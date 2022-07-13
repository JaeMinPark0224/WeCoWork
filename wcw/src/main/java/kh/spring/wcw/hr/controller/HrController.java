package kh.spring.wcw.hr.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.hr.service.HrService;
import kh.spring.wcw.mail.Mail;

@Controller
@RequestMapping("/hr")
public class HrController {
	
	@Autowired
	private HrService hrService;
	
	// 직원 리스트 조회 페이지로 이동
	@GetMapping("/employee/list")
	public ModelAndView selectListEmployee(
			ModelAndView mv
			, HttpSession session
			, @RequestParam(name="page", required = false) String page
			, @RequestParam(name="option", required = false, defaultValue = "date") String selectVal
			, @RequestParam(name="list", required = false) List<Employee> list) {
		int currentPage = 1; // 현재 페이지
		int cotentLimit = 15; // 한 페이지에 보여질 직원 정보 갯수
		
		String currentPageStr = page;
		try {
			if(currentPageStr != null && !currentPageStr.equals("")) {
				currentPage = Integer.parseInt(currentPageStr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int offset = (currentPage - 1) * cotentLimit;
		RowBounds rowBounds = new RowBounds(offset, cotentLimit);
		
		// 회사 번호 가져오기
		Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
		System.out.println(loginInfo);
		int cp_no = loginInfo.getCp_no();
		
		// 회사가 가진 부서 전부 가져오기
		List<String> deptList = hrService.selectDeptList(cp_no);
		System.out.println("부서 목록: " + deptList);
		
		// 회사가 가진 직위 전부 가져오기
		List<String> jobList = hrService.selectJobList(cp_no);
		System.out.println("직위 목록: " + jobList);
		
		// 직원 리스트 (size 측정용)
		List<Employee> totalList = hrService.selectEmployeeList(cp_no);
		
		int totalpageCnt = totalList.size()/cotentLimit + 1;
		int startPage = currentPage - (((currentPage % 5) == 0)?4:((currentPage % 5)-1)); 
		int endPage = ((startPage + 4) > totalpageCnt)?totalpageCnt:(startPage + 4);
		
		// 직원 리스트
		list = hrService.selectEmployeeListFilter(selectVal, rowBounds, cp_no);
		
		mv.addObject("option", selectVal);
		mv.addObject("totalpageCnt", totalpageCnt);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("employeeList", list);
		mv.addObject("deptList", deptList);
		mv.addObject("jobList", jobList);
		mv.setViewName("hr/employeeList");
		return mv;
	}
	
	// 직원 리스트 조회 필터 ajax
//	@PostMapping(value= "/employee/list", produces = "text/plain;charset=UTF-8")
//	@ResponseBody
//	public String selectListEmployeeAjax(
//			HttpServletRequest req
//			, @RequestParam(name="selectVal", required = false) String selectVal
//			, @RequestParam(name="page", required = false) String page
//			, @RequestParam(name="list", required = false) List<Employee> list) {
//		int currentPage = 1; // 현재 페이지
//		int cotentLimit = 15; // 한 페이지에 보여질 직원 정보 갯수
//		
//		System.out.println("ajax");
//		System.out.println(selectVal);
//		System.out.println(page);
//		String currentPageStr = page;
//		try {
//			if(currentPageStr != null && !currentPageStr.equals("")) {
//				currentPage = Integer.parseInt(currentPageStr);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		int offset = (currentPage - 1) * cotentLimit;
//		RowBounds rowBounds = new RowBounds(offset, cotentLimit);
//			
//		List<Employee> totalList = HrService.selectEmployeeList();
//			
//		int totalpageCnt = totalList.size()/cotentLimit + 1;
//		int startPage = currentPage - (((currentPage % 5) == 0)?4:((currentPage % 5)-1)); 
//		int endPage = ((startPage + 4) > totalpageCnt)?totalpageCnt:(startPage + 4);
//		
//		list = hrService.selectEmployeeListFilter(selectVal);
//			
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("employeeList", list);
//		map.put("totalpageCnt", totalpageCnt);
//		map.put("startPage", startPage);
//		map.put("endPage", endPage);
//		
//		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
//		return gson.toJson(map);
//	}
	
	// 직원 상세 정보 조회
	@PostMapping(value= "/employee/select", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectOneEmployee(
			HttpSession session
			, @RequestParam(name="empNo", required = false) String emp_no) {
		
		Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
		int cp_no = loginInfo.getCp_no();
		Employee result = hrService.selectEmployee(emp_no, cp_no);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return gson.toJson(result);
	}
	
	// 직원 정보 업데이트
	@PostMapping(value= "/employee/update", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateEmployee(
			HttpSession session
			, @RequestParam(name="emp_no", required = false) String e_no_str
			, @RequestParam(name="dept_name", required = false) String dept_name
			, @RequestParam(name="job_title", required = false) String job_title
			, @RequestParam(name="intl_no", required = false) String intl_no
			, @RequestParam(name="resign_yn", required = false) String resign_yn) {
		
		Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
		int cp_no = loginInfo.getCp_no();
		
		int e_no = Integer.parseInt(e_no_str);
		
		int result_int = hrService.updateEmployee(cp_no, e_no, dept_name, job_title, intl_no, resign_yn);
		String result = Integer.toString(result_int);
		return result;
	}
	
	// 직원 계정 등록 페이지로 이동
	@GetMapping("/employee/insert")
	public ModelAndView viewEmployee(
			ModelAndView mv
			, HttpSession session) {
		
		// 회사 번호 가져오기
		Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
		System.out.println(loginInfo);
		int cp_no = loginInfo.getCp_no();
				
		// 회사가 가진 부서 전부 가져오기
		List<String> deptList = hrService.selectDeptList(cp_no);
		System.out.println("부서 목록: " + deptList);
				
		// 회사가 가진 직위 전부 가져오기
		List<String> jobList = hrService.selectJobList(cp_no);
		System.out.println("직위 목록: " + jobList);
		
		mv.addObject("deptList", deptList);
		mv.addObject("jobList", jobList);
		mv.setViewName("hr/insertEmployee");
		return mv;
	}
	
	// 직원 계정 등록 기능
	@PostMapping("/employee/insert")
	public ModelAndView insertEmployee(
			ModelAndView mv
			, HttpSession session
			, RedirectAttributes rttr
			, @RequestParam(name="name", required = false) String name
			, @RequestParam(name="email", required = false) String email
			, @RequestParam(name="phone", required = false) String phone
			, @RequestParam(name="dept_name", required = false) String dept_name
			, @RequestParam(name="job_title", required = false) String job_title
			, @RequestParam(name="intl_no", required = false) String intl_no
			) {
		
		// 난수 비밀번호 단어 (ex. pwd12345) 생성
		Random random = new Random();      //랜덤 함수 선언
	    int createNum = 0;           //1자리 난수
	    String ranNum = "";          //1자리 난수 형변환 변수
	    int letter    = 5;           //난수 자릿수:6
	    String resultNum = "pwd";    //결과 난수

	    for (int i=0; i<letter; i++) { 
	    	createNum = random.nextInt(9);      //0부터 9까지 올 수 있는 1자리 난수 생성
	        ranNum =  Integer.toString(createNum);  //1자리 난수를 String으로 형변환
	        resultNum += ranNum;         //생성된 난수(문자열)을 원하는 수(letter)만큼 더하며 나열
	    }       
	    System.out.println(resultNum);
	    
	    String pwd = "";
		// 난수 비밀번호 단어 암호화
	    try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(resultNum.getBytes());
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
	    
	    System.out.println("암호화한 비밀번호: " + pwd);
	    
		// 암호화한 비밀번호 + @RequestParam 값들 db 저장
	    	// 회사 번호 가져오기
	    	Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
	    	int cp_no = loginInfo.getCp_no();
	    	String cp_name = loginInfo.getCp_name();
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    map.put("name", name);
	    map.put("pwd", pwd);
	    map.put("email", email);
	    map.put("phone", phone);
	    map.put("dept_name", dept_name);
	    map.put("job_title", job_title);
	    map.put("intl_no", intl_no);
	    map.put("cp_no", cp_no);
	    
	    int result = -1;
	    result = hrService.insertEmployee(map);
		
		// 아이디와 비밀번호 이메일 전송
		if(result == 1) {
			// 이메일 전송
			Mail.sendMailForInsert(email, resultNum, cp_name);
			result = 2;
		}
		// 등록 완료
		if(result == 2) {
			rttr.addFlashAttribute("msg", "직원 계정 생성이 완료되었습니다");
			mv.setViewName("redirect:/hr/employee/list");
		} else {
			rttr.addFlashAttribute("msg", "직원 계정 생성 중 오류가 발생했습니다. 다시 시도해 주세요.");
			mv.setViewName("hr/employeeList");
		}
		return mv;
	}
}
