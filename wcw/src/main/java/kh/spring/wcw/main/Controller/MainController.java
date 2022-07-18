package kh.spring.wcw.main.Controller;


import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.company.service.CompanyService;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.employee.service.EmployeeService;
import kh.spring.wcw.mail.Mail;

@Controller
public class MainController {
	
	@Autowired
	private EmployeeService empService;
	@Autowired
	private CompanyService cpService;
	
	// 메인 페이지로 이동
	@GetMapping("/")
	public ModelAndView readMain(ModelAndView mv
			, HttpSession session) {
		if(session.getAttribute("loginSSInfo") == null) {
			mv.setViewName("redirect:/login"); //TODO 첫화면으로
			return mv;
		}
		mv.setViewName("main/main");
		return mv;
	}
	
	// 로그인 페이지로 이동
	@GetMapping("/login")
	public ModelAndView viewlogin(ModelAndView mv) {
		mv.setViewName("login/login");
		return mv;
	}
	
	// 로그인 기능
	@PostMapping("/login.do")
	public ModelAndView selectLogin(
			ModelAndView mv
			, HttpSession session
			, HttpServletResponse response
			, RedirectAttributes rttr
			, @RequestParam(name="email") String email
			, @RequestParam(name="pwd") String pwd
			, @RequestParam(value = "autoLogin", required = false) String autoLogin
			) {
		Company result2 = null;
		
		// 난수 비밀번호 단어 암호화
	    try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(pwd.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			pwd = hexString.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		// 직원 로그인
		Employee result = empService.selectEmployee(email, pwd);
		if(result == null) {
			// 회사 로그인
			result2 = cpService.selectCompany(email, pwd);
			System.out.println("result2: " + result2);
			if(result2 == null) {
				rttr.addFlashAttribute("msg", "로그인 실패. 입력값 확인 후 다시 시도해 주세요.");
				mv.setViewName("redirect:/login");
				return mv;
			}
			else {
				session.setAttribute("CompanySSinfo", result2);
				mv.setViewName("redirect:/hr/employee/list"); //TODO 최고 관리자용 메인 페이지로 이동 예정
			}

			return mv;
		}
		
		// 퇴사했을 경우 로그인 불가
		if(result.getResign_yn().equals("Y")) {
			mv.setViewName("redirect:/login");
		// 퇴사하지 않았다면 로그인 가능
		} else {
			session.setAttribute("loginSSInfo", result);
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public ModelAndView viewLogout(
			ModelAndView mv
			, HttpSession session
			, HttpServletRequest request
			, HttpServletResponse response) {
		
//		Object obj = session.getAttribute("login");
//		if ( obj != null ){
//			Employee vo = (Employee)obj;
//			session.removeAttribute("login");
//			session.invalidate(); // 세션 전체를 날려버림            
//			//쿠키를 가져와보고            
//			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
//			if ( loginCookie != null ){
//				// null이 아니면 존재하면!                
//				loginCookie.setPath("/");
//				// 쿠키는 없앨 때 유효시간을 0으로 설정하는 것 !!! invalidate같은거 없음.                
//				loginCookie.setMaxAge(0);
//				// 쿠키 설정을 적용한다.                
//				response.addCookie(loginCookie);
//				// 사용자 테이블에서도 유효기간을 현재시간으로 다시 세팅해줘야함.               
//				Date date = new Date(System.currentTimeMillis());
//				EmployeeService.autologin(vo.getEmail(), session.getId(), date);
//			}
//		}
		request.getSession().invalidate(); // 세션 초기화 - 로그아웃에서만 사용 권장
		mv.setViewName("redirect:/");
		return mv;
	}
	
	// 비밀번호 찾기 페이지로 이동
	@GetMapping("/find/pwd")
	public ModelAndView viewFindPwd(ModelAndView mv) {
		mv.setViewName("login/findPwd");
		return mv;
	}
	
	// 비밀번호 찾기용 난수 저장 및 이메일 전송
	@PostMapping(value = "/insertRandomNum", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertRandomNum(
			@RequestParam(name="employeeEmail") String email) throws Throwable{

		String randomNum = empService.selectRandomNum(email);
		
		// 해당 이메일이 테이블에 없다면 새로운 난수 insert
		if(randomNum == null) {
			int result = empService.insertRandomNum(email);
			if(result > 0) {
				// 난수 번호 찾기
				randomNum = empService.selectRandomNum(email);
				// 난수 번호를 메일로 보내기
				Mail.sendMailForPwd(email, randomNum);
			}
		}
		// 해당 이메일이 테이블에 있다면 기존 난수 update
		else {
			int result2 = empService.updateRandomNum(email);
			if(result2 > 0) {
				// 난수 번호 찾기
				randomNum = empService.selectRandomNum(email);
				// 난수 번호를 메일로 보내기
				Mail.sendMailForPwd(email, randomNum);
			}
		}
		return randomNum;
	}
	
	// 비밀번호 찾기용 난수 삭제
	@PostMapping(value = "/deleteRandomNum", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public int deleteRandomNum(
	@RequestParam(name="employeeEmail") String email) throws Throwable{

		return empService.deleteRandomNum(email);
	}
	
	// 비밀번호 찾기 기능
	@PostMapping("find/pwd.do")
	public ModelAndView selectFindPwd(
			ModelAndView mv
			, RedirectAttributes rttr
			, @RequestParam(name="cp") String cp_name
			, @RequestParam(name="email") String email
			, @RequestParam(name="name") String name) {
		
		String result = empService.selectEmployeePwd(cp_name, email, name);
		if(result == null) {
			rttr.addFlashAttribute("msg", "입력한 정보에 해당하는 비밀번호를 찾을 수 없습니다. 입력값 확인 후 다시 시도해 주세요.");
			mv.setViewName("redirect:/find/pwd");
			return mv;
		}
		mv.addObject("emailInfo", email);
		mv.addObject("pwdInfo", result);
		mv.setViewName("login/findPwdSC");
		return mv;
	}

	// 비즈니스 회원가입 페이지로 이동
	@GetMapping("/join")
	public ModelAndView viewBusiness(ModelAndView mv) {
		mv.setViewName("join/join");
		return mv;
	}
	
	// 비즈니스 회원가입 기능
	@PostMapping("/join.do")
	public ModelAndView insertBusiness(
			ModelAndView mv
			, Company company
			, RedirectAttributes rttr
			, @RequestParam(name="cp_name") String cp_name
			, @RequestParam(name="email") String cp_join_email
			, @RequestParam(name="pwd") String cp_pwd
			, @RequestParam(name="cp_join_name") String cp_join_name
			, @RequestParam(name="cp_join_phone") String cp_join_phone
			, @RequestParam(name="cp_url", defaultValue = "") String cp_url) {
		
		// 난수 비밀번호 단어 암호화
		String pwd="";
	    try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(cp_pwd.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			pwd = hexString.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		
		company.setCp_name(cp_name);
		company.setCp_join_email(cp_join_email);
		company.setCp_pwd(pwd);
		company.setCp_join_name(cp_join_name);
		company.setCp_join_phone(cp_join_phone);
		company.setCp_url(cp_url);
		
		int result = cpService.insertBusiness(company);
		
		if(result > 0 ) {
			rttr.addAttribute("msg" , "회원가입이 완료되었습니다. 심사 후 입력하신 연락처로 연락드리겠습니다.");
			mv.setViewName("redirect:/");
			return mv;
		}
		
		return mv;
	}
	
	// 마이페이지로 이동
	@GetMapping("/mypage")
	public ModelAndView viewMypage(ModelAndView mv) {
		mv.setViewName("mypage/mypage");
		
		return mv;
	}
	
	// 마이페이지 정보 수정 기능
	@PostMapping("/mypage.do")
	public ModelAndView updateMypage(
			ModelAndView mv
			, @RequestParam(name = "pwd", required = false, defaultValue = "") String employee_pwd
			, @RequestParam(name = "file", required = false) MultipartFile employee_profile
			, @RequestParam(name = "sign_file", required = false, defaultValue = "") String employee_sign
			, HttpServletRequest request
			, HttpSession session
			, Employee employee
			, RedirectAttributes rttr
			) throws ServletException, IOException {
		
		Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");

		
		// 변경된 값이 있는지 확인하기 위한 임의의 숫자
		int sum = -1;
		
		// 프로필 이미지 변경 시
		if(employee_profile.getSize() != 0) {
			long timeForRename = System.currentTimeMillis();
			String realPath = request.getSession().getServletContext().getRealPath("");
			String savePath = "resources\\uploadFiles";
			File folder = new File(realPath+savePath);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			String filePath = realPath + savePath + "\\" + timeForRename + "_" + employee_profile.getOriginalFilename();
			employee_profile.transferTo(new File(filePath));
			Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
					"cloud_name", "dfam8azdg",
					"api_key", "882165332977633",
					"api_secret", "lrdbmfClWzNqybNeqXyEoRpFmfg",
					"secure", true));
			File cloudinaryFile = new File(filePath);
			@SuppressWarnings("rawtypes")
			Map uploadResult = cloudinary.uploader().upload(cloudinaryFile, ObjectUtils.emptyMap());
			String profile= (String) uploadResult.get("url");
			System.out.println("프로필 저장 URL: " + profile);
			
			// 프로필 사진 cloudinary URL 경로를 세션에 담아주기
			loginInfo.setProfile(profile);
					
			// cloudinary URL 경로를 DB에 업데이트 해주기
			empService.updateEmployeeProfile(loginInfo.getEmp_no(), profile);
			
			sum = 1;
			System.out.println("프로필 사진 변경");
		}
		
		// 서명 이미지 변경 시
		if(employee_sign.length() > 7) {
			System.out.println("서명 URL: " + employee_sign);
			
			// 서명 URL 경로를 세션에 담아주기
			loginInfo.setSign(employee_sign);
			
			// cloudinary URL 경로를 DB에 업데이트 해주기
			empService.updateEmployeeSign(loginInfo.getEmp_no(), employee_sign);
			
			sum = 1;
			System.out.println("서명 이미지 변경");
		}
		
		// 비밀번호 변경 시
		if(employee_pwd.length() > 7) {
			System.out.println("변경 예정 비밀번호: " + employee_pwd);
			
			// 변경 예정 비밀번호를 세센에 담아주기
			loginInfo.setPwd(employee_pwd);
			
			// 비밀번호를 DB에 없데이트 해주기
			empService.updateEmployeePwd(loginInfo.getEmp_no(), employee_pwd);
			
			sum = 1;
			System.out.println("비밀번호 변경");
			
			// 비밀번호가 변경되었음으로 재로그인 유도
			rttr.addFlashAttribute("msg", "비밀번호가 변경되었습니다. 재로그인 후 이용해주세요.");
			request.getSession().invalidate();
			mv.setViewName("redirect:/login");
			return mv;
		}
		
		// 변경된 값이 없다면
		if(sum == -1) {
			rttr.addFlashAttribute("msg", "변경된 값이 없습니다. 프로필 정보 수정 후 수정하기 버튼을 클릭해 주세요.");
			mv.setViewName("redirect:/mypage");
			return mv;
		}
		rttr.addFlashAttribute("msg", "정보가 수정되었습니다.");
		mv.setViewName("redirect:/mypage"); // 다시 마이페이지로
		return mv;
	}
		
}