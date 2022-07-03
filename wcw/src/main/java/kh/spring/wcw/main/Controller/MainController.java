package kh.spring.wcw.main.Controller;


import java.sql.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.company.service.CompanyService;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.employee.service.EmployeeService;
import kh.spring.wcw.mail.Mail;

@Controller
public class MainController {
	
	@Autowired
	private EmployeeService EmployeeService;
	@Autowired
	private CompanyService CompanyService;
	
	// 메인 페이지로 이동
	@GetMapping("/")
	public ModelAndView mainController(ModelAndView mv
			, HttpSession session) {
		if(session.getAttribute("loginSSInfo") == null) {
			mv.setViewName("redirect:/login"); //TODO 첫화면 만들예정
			return mv;
		}
		mv.setViewName("main/main");
		return mv;
	}
	
	// 로그인 페이지로 이동
	@GetMapping("/login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("login/login");
		return mv;
	}
	
	// 로그인 기능
	@PostMapping("/login.do")
	public ModelAndView loginDo(
			ModelAndView mv
			, HttpSession session
			, HttpServletResponse response
			, RedirectAttributes rttr
			, @RequestParam(name="email") String email
			, @RequestParam(name="pwd") String pwd
			, @RequestParam(value = "autoLogin", required = false) String autoLogin
			) {
		Company result2 = null;
		
		// 직원 로그인
		Employee result = EmployeeService.selectEmployee(email, pwd);
		if(result == null) {
			// 회사 로그인
			result2 = CompanyService.selectCompany(email, pwd);
			if(result2 == null) {
				rttr.addFlashAttribute("msg", "로그인 실패. 입력값 확인 후 다시 시도해 주세요.");
				mv.setViewName("redirect:/login");
				return mv;
			}
			session.setAttribute("CompanySSinfo", result2);
			mv.setViewName("redirect:/"); //TODO 최고 관리자용 메인 페이지로 이동 예정

			return mv;
		}
		
		// 퇴사했을 경우 로그인 불가
		if(result.getResign_yn().equals("Y")) {
			mv.setViewName("redirect:/login");
			return mv;
		// 퇴사하지 않았다면 로그인 가능
		} else {
			// 관리자 권한이 있다면
			if(result.getHr_yn().equals("Y")) {
				session.setAttribute("loginSSInfo", result);
				mv.setViewName("redirect:/"); //TODO 직원(인사) 관리자용 페이지로 이동
				
				// 자동로그인을 체크했다면 세션 추가
//				if (autoLogin != null){ 
//					Cookie cookie = new Cookie("loginCookie", session.getId());
//					cookie.setPath("/");
//					int amount = 60 * 60 * 24 * 7; // 7일
//					cookie.setMaxAge(amount);
//					// 쿠키 적용              
//					response.addCookie(cookie);
//					
//					Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
//					EmployeeService.autologin(result.getEmail(), session.getId(), sessionLimit);
//					}
			}
			// 관리자 권한이 없다면
			if(result.getHr_yn().equals("N")) {
				session.setAttribute("loginSSInfo", result);
				mv.setViewName("redirect:/");
				
				// 자동로그인을 체크했다면 세션 추가
//				if (autoLogin != null){ 
//					Cookie cookie = new Cookie("loginCookie", session.getId());
//					cookie.setPath("/");
//					int amount = 60 * 60 * 24 * 7; // 7일
//					cookie.setMaxAge(amount);
//					// 쿠키 적용              
//					response.addCookie(cookie);
//					
//					Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
//					EmployeeService.autologin(result.getEmail(), session.getId(), sessionLimit);
//				}
			}
			return mv;
		}
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public ModelAndView logout(
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
	public ModelAndView findPwd(ModelAndView mv) {
		mv.setViewName("login/findPwd");
		return mv;
	}
	
	// 비밀번호 찾기용 난수 저장 및 이메일 전송
	@PostMapping(value = "/insertRandomNum", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertRandomNum(
			@RequestParam(name="employeeEmail") String email) throws Throwable{
		
		int result = EmployeeService.insertRandomNum(email);
		if(result > 0) {
			// 난수 번호 찾기
			String randomNum = EmployeeService.selectRandomNum(email);
			// 난수 번호를 메일로 보내기
			Mail.sendMailForPwd(email, randomNum);
		}
		return "난수 저장 및 전송 완료";
	}
	
	// 비밀번호 찾기 기능
	@PostMapping("find/pwd.do")
	public ModelAndView findPwdDo(
			ModelAndView mv
			, RedirectAttributes rttr
			, @RequestParam(name="cp") String cp_name
			, @RequestParam(name="email") String email
			, @RequestParam(name="name") String name) {
		
		String result = EmployeeService.selectEmployeePwd(cp_name, email, name);
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

	
}