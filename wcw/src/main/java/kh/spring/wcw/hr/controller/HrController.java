package kh.spring.wcw.hr.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.spring.wcw.dept.domain.Dept;
import kh.spring.wcw.attendance.domain.Attendance;
import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.hr.service.HrService;
import kh.spring.wcw.mail.Mail;
import kh.spring.wcw.vacation.domain.Vacation;

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
		int cp_no = -1;
		Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
		
		if(loginInfo == null) {
			Company CompanySSinfo = (Company)session.getAttribute("CompanySSinfo");
			System.out.println("CompanySSinfo: "+CompanySSinfo);
			cp_no = CompanySSinfo.getCp_no();
		} else {
			cp_no = loginInfo.getCp_no();
		}
		System.out.println("회사 번호: " + cp_no);
		
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
		
		// 회사 번호 가져오기
		int cp_no = -1;
		Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
		
		if(loginInfo == null) {
			Company CompanySSinfo = (Company)session.getAttribute("CompanySSinfo");
			System.out.println("CompanySSinfo: "+ CompanySSinfo);
			cp_no = CompanySSinfo.getCp_no();
		} else {
			cp_no = loginInfo.getCp_no();
		}
		System.out.println("회사 번호: " + cp_no);
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
		
		// 회사 번호 가져오기
				int cp_no = -1;
				Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
				
				if(loginInfo == null) {
					Company CompanySSinfo = (Company)session.getAttribute("CompanySSinfo");
					System.out.println("CompanySSinfo: "+CompanySSinfo);
					cp_no = CompanySSinfo.getCp_no();
				} else {
					cp_no = loginInfo.getCp_no();
				}
				System.out.println("회사 번호: " + cp_no);
		
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
				int cp_no = -1;
				Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
				
				if(loginInfo == null) {
					Company CompanySSinfo = (Company)session.getAttribute("CompanySSinfo");
					System.out.println("CompanySSinfo: "+CompanySSinfo);
					cp_no = CompanySSinfo.getCp_no();
				} else {
					cp_no = loginInfo.getCp_no();
				}
				System.out.println("회사 번호: " + cp_no);
				
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
	 		int cp_no = -1;
	 		String cp_name = "";
	 		
	 		Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
	 		if(loginInfo == null) {
	 			Company CompanySSinfo = (Company)session.getAttribute("CompanySSinfo");
	 			System.out.println("CompanySSinfo: "+CompanySSinfo);
	 			cp_no = CompanySSinfo.getCp_no();
	 			cp_name = CompanySSinfo.getCp_name();
	 		} else {
	 			cp_no = loginInfo.getCp_no();
	 			cp_name = loginInfo.getCp_name();
	 		}
	 		System.out.println("회사 번호: " + cp_no);
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
			mv.setViewName("redirect:/hr/employee/list");
		}
		return mv;
	}
	
	// 관리자 부서 설정 페이지로 이동
	@GetMapping("/department/admin/list")
	public ModelAndView selectAdminDeptSetting(
			ModelAndView mv
			, HttpSession session) {
			
		// 회사 번호 가져오기
				int cp_no = -1;
				Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
				
				if(loginInfo == null) {
					Company CompanySSinfo = (Company)session.getAttribute("CompanySSinfo");
					System.out.println("CompanySSinfo: "+CompanySSinfo);
					cp_no = CompanySSinfo.getCp_no();
				} else {
					cp_no = loginInfo.getCp_no();
				}
				System.out.println("회사 번호: " + cp_no);
					
		// 직원이 존재하는 부서 가져오기
		List<String> deptList = hrService.selectAdminDeptList(cp_no);
		System.out.println("부서 목록: " + deptList);
		
		// 관리자 권한이 'Y'인 직원 리스트 가져오기
		List<Employee> adminList = hrService.selectAdminList(cp_no);
		System.out.println("관리자 직원 목록: " + adminList);
		
		mv.addObject("deptList", deptList);
		mv.addObject("adminList", adminList);
		mv.setViewName("hr/adminDeptSetting");
		return mv;
	}
	
	// 관리자 부서 설정 기능
	@PostMapping("/department/admin/update")
	@ResponseBody
	public int updateAdminDeptSetting(
			HttpSession session
			, @RequestParam(name="selectVal", required = false) String dept_name) {
				
		// 회사 번호 가져오기
				int cp_no = -1;
				Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
				
				if(loginInfo == null) {
					Company CompanySSinfo = (Company)session.getAttribute("CompanySSinfo");
					System.out.println("CompanySSinfo: "+CompanySSinfo);
					cp_no = CompanySSinfo.getCp_no();
				} else {
					cp_no = loginInfo.getCp_no();
				}
				System.out.println("회사 번호: " + cp_no);
		
		int result = hrService.updateAdmin(cp_no, dept_name);
		
		return result;
	}
	
	// 부서 리스트 조회 페이지로 이동
	@GetMapping("/department/list")
	public ModelAndView selectListDepartment(
			ModelAndView mv
			, HttpSession session
			, @RequestParam(name="option", required = false) String selectVal) {
		// 회사 번호 가져오기
				int cp_no = -1;
				Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
				
				if(loginInfo == null) {
					Company CompanySSinfo = (Company)session.getAttribute("CompanySSinfo");
					System.out.println("CompanySSinfo: "+CompanySSinfo);
					cp_no = CompanySSinfo.getCp_no();
				} else {
					cp_no = loginInfo.getCp_no();
				}
				System.out.println("회사 번호: " + cp_no);
		
		// 회사가 가진 부서 전체 정보 가져오기
		List<Dept> deptList = hrService.selectDeptAllList(cp_no);
		String first_dept_name = deptList.get(0).getDept_name();
		System.out.println("부서 목록: " + deptList);
		System.out.println("1번 부서: " + first_dept_name);
		
		// 회사가 가진 부서 이름 전부 가져오기
		List<String> deptNameList = hrService.selectDeptList(cp_no);
		System.out.println("부서 목록: " + deptNameList);
		
		List<Employee> employeeList_dept = null;
		System.out.println("selectVal: " + selectVal);
		// 특정 부서의 직원 리스트 가져오기
		if(selectVal == null || selectVal == "") {
			employeeList_dept = hrService.selectDeptEmployeeList(cp_no, first_dept_name);
		} else {
			employeeList_dept = hrService.selectDeptEmployeeList(cp_no, selectVal);
		}
		
		// 회사가 가진 모든 직원 이름 정보 가져오기
		List<Employee> employeeNameList = hrService.selectEmployeeList(cp_no);
		System.out.println("전체 직원 목록: " + employeeNameList);
		
		mv.addObject("option", selectVal);					 // 필터에 사용될 부서 이름
		mv.addObject("deptList", deptList);					 // 회사 내 전체 부서 리스트 (정보 다)
		mv.addObject("first_dept_name", first_dept_name);    // 부서 리스트 결과값에서 확인된 첫번째 부서명
		mv.addObject("deptNameList", deptNameList);			 // 회사 내 전체 부서 리스트 (부서명만)
		mv.addObject("employeeList", employeeList_dept);     // 특정 부서의 직원 리스트
		mv.addObject("employeeNameList", employeeNameList);  // 회사 내 전체 직원 리스트
		mv.setViewName("hr/deptList");
		
		return mv;
	}
	
	// 부서 상세 조회 기능
	@PostMapping("/department/select")
	@ResponseBody
	public String selectOneDepartment(
			HttpSession session
			, @RequestParam(name="deptNo", required = false) int dept_no
			, @RequestParam(name="deptName", required = false) String dept_name) {
					
		System.out.println("dept_no: " + dept_no);
		System.out.println("dept_name: " + dept_name);
		
		// 회사 번호 가져오기
				int cp_no = -1;
				Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
				
				if(loginInfo == null) {
					Company CompanySSinfo = (Company)session.getAttribute("CompanySSinfo");
					System.out.println("CompanySSinfo: "+CompanySSinfo);
					cp_no = CompanySSinfo.getCp_no();
				} else {
					cp_no = loginInfo.getCp_no();
				}
				System.out.println("회사 번호: " + cp_no);
		
		// 하나의 부서에 정보
		Dept form_dept = hrService.selectOneDepartment(cp_no, dept_no);
		System.out.println("해당 부서 정보: " + form_dept);
		
		// 특정 부서의 직원 리스트 가져오기
		List<Employee> employeeList_dept = hrService.selectDeptEmployeeList(cp_no, dept_name);
		System.out.println("특정 부서의 직원 리스트: " + employeeList_dept);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("employeeList_dept",employeeList_dept);
		map.put("form_dept", form_dept);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		return gson.toJson(map);
	}
	
	// 부서 생성 기능
	@PostMapping("/department/insert")
	@ResponseBody
	public int insertDepartment(
			HttpSession session
			, @RequestParam(name="dept_name", required = false) String dept_name
			, @RequestParam(name="emp_no", required = false) int emp_no
			, @RequestParam(name="dept_upper_no", required = false) int dept_upper_no) {
		System.out.println(dept_name + emp_no + dept_upper_no);
		
		// 회사 번호 가져오기
				int cp_no = -1;
				Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
				
				if(loginInfo == null) {
					Company CompanySSinfo = (Company)session.getAttribute("CompanySSinfo");
					System.out.println("CompanySSinfo: "+CompanySSinfo);
					cp_no = CompanySSinfo.getCp_no();
				} else {
					cp_no = loginInfo.getCp_no();
				}
				System.out.println("회사 번호: " + cp_no);
			
		int result = -1; 
		// 부서 생성하러 가기
		result = hrService.insertDepartment(cp_no, dept_name, emp_no, dept_upper_no);
		if (result == 1) {
			System.out.println("부서 생성 성공");
		} else {
			System.out.println("부서 생성 실패");
		}

		return result;
	}
	
	// 부서 정보 엡데이트 기능
	@PostMapping("/department/update")
	@ResponseBody
	public int updateDepartment(
			HttpSession session
			, @RequestParam(name="dept_name", required = false) String dept_name
			, @RequestParam(name="emp_no", required = false) int emp_no
			, @RequestParam(name="dept_upper_name", required = false) String dept_upper_name
			, @RequestParam(name="modal_select_yn", required = false) String active_yn
			, @RequestParam(name="dept_no", required = false) int dept_no) {
		System.out.println(dept_name + emp_no + dept_upper_name + active_yn + dept_no);
		
		// 회사 번호 가져오기
				int cp_no = -1;
				Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
				
				if(loginInfo == null) {
					Company CompanySSinfo = (Company)session.getAttribute("CompanySSinfo");
					System.out.println("CompanySSinfo: "+CompanySSinfo);
					cp_no = CompanySSinfo.getCp_no();
				} else {
					cp_no = loginInfo.getCp_no();
				}
				System.out.println("회사 번호: " + cp_no);
			
		int result = -1;
		
		// 부서 수정하러 가기
		result = hrService.updateDepartment(cp_no, dept_name, emp_no, dept_upper_name, active_yn, dept_no);
		if (result == 1) {
			System.out.println("부서 수정 성공");
		} else {
			System.out.println("부서 수정 실패");
		}

		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	////// 이진정 //////
	@RequestMapping("/attendance/daily")
	public ModelAndView viewDailyAttendanceHr(ModelAndView mv) {
		mv.setViewName("hr/attendance/daily");
		return mv;
	}
	
	@RequestMapping(value =  "/attendance/select", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectAttendance(
			Attendance attendance
			,@RequestParam(name="att_date_start") String att_date_start
			, @RequestParam(name="att_date_end") String att_date_end
			) {
		Date att_date_start_d = Date.valueOf(att_date_start);
		Date att_date_end_d = Date.valueOf(att_date_end);
		attendance.setAtt_date_start(att_date_start_d);
		attendance.setAtt_date_end(att_date_end_d);
		List<Attendance> result = hrService.selectAttendance(attendance);
		
		Gson gsonObj = new GsonBuilder().setDateFormat("yyyy-MM-dd' / 'HH:mm:ss").serializeNulls().create();
		
		return gsonObj.toJson(result);
				
	}
	
	@RequestMapping("/attendance/approval")
	public ModelAndView viewApprovalAttendanceHr(ModelAndView mv
			, HttpSession session
			) {
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		int cp_no = loginSSInfo.getCp_no();
		List<Employee> deptList = hrService.selectDept(cp_no);
		mv.addObject("deptList", deptList);
		mv.setViewName("hr/attendance/approval");
		return mv;
	}
	@PostMapping(value =  "/attendance/approval/select", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectApprovalAttendance(
			Attendance attendance
			, @RequestParam(name="att_date_start") String att_date_start
			, @RequestParam(name="att_date_end") String att_date_end
			, @RequestParam(name="dept_name") String dept_name
			, @RequestParam(name="att_appr_result") String att_appr_result
			) {
		Date att_date_start_d = Date.valueOf(att_date_start);
		Date att_date_end_d = Date.valueOf(att_date_end);
		attendance.setAtt_date_start(att_date_start_d);
		attendance.setAtt_date_end(att_date_end_d);
		attendance.setDept_name(dept_name);
		attendance.setAtt_appr_result(att_appr_result);
		List<Attendance> selectResult = hrService.selectApprovalAttendance(attendance);
		
		Gson gsonObj = new GsonBuilder().setDateFormat("yyyy-MM-dd' / 'HH:mm:ss").serializeNulls().create();
		
		return gsonObj.toJson(selectResult);
				
	}
	
	
	@GetMapping("/attendance/weekly")
	public ModelAndView viewWeeklyAttendanceHr(ModelAndView mv
			, HttpSession session
			) {
		
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		int cp_no = loginSSInfo.getCp_no();
		List<Employee> empList = hrService.selectEmp(cp_no);
		List<Employee> deptList = hrService.selectDept(cp_no);
		
		mv.addObject("deptList", deptList);
		mv.addObject("empList", empList);
		mv.setViewName("hr/attendance/weekly");
		return mv;
	}
	
	@RequestMapping(value = "/attendance/selectWeekly", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String selectWeeklyAttendance(
			Attendance attendance
			,@RequestParam(name="att_date_start_str") String att_date_start
			, @RequestParam(name="att_date_end_str") String att_date_end
			, @RequestParam(name="dept_name") String dept_name
			, @RequestParam(name="name") String name
			, @RequestParam(name="emp_no") int emp_no
			) {
		Date att_date_start_d = Date.valueOf(att_date_start);
		Date att_date_end_d = Date.valueOf(att_date_end);
		attendance.setAtt_date_start(att_date_start_d);
		attendance.setAtt_date_end(att_date_end_d);
		attendance.setDept_name(dept_name);
		attendance.setName(name);
		attendance.setEmp_no(emp_no);
		List<Attendance> result = hrService.selectWeeklyAttendance(attendance);
		
		Gson gsonObj = new GsonBuilder().setDateFormat("yyyy-MM-dd' / 'HH:mm:ss").serializeNulls().create();
		
		return gsonObj.toJson(result);
				
	}
	
	@GetMapping("/attendance/monthly")
	public ModelAndView viewMonthlyAttendanceHr(ModelAndView mv
			, HttpSession session
			) {
		
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		int cp_no = loginSSInfo.getCp_no();
		List<Employee> empList = hrService.selectEmp(cp_no);
		List<Employee> deptList = hrService.selectDept(cp_no);
		
		mv.addObject("deptList", deptList);
		mv.addObject("empList", empList);
		mv.setViewName("hr/attendance/monthly");
		return mv;
	}
	
	@GetMapping("/attendance/vacation")
	public ModelAndView viewVacationHr(ModelAndView mv
			, HttpSession session
			) {
		
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		int cp_no = loginSSInfo.getCp_no();
		List<Employee> empList = hrService.selectEmp(cp_no);
		List<Employee> deptList = hrService.selectDept(cp_no);
		
		mv.addObject("deptList", deptList);
		mv.addObject("empList", empList);
		mv.setViewName("hr/attendance/vacation");
		return mv;
	}
	
	@PostMapping("/attendance/vacation/select")
	@ResponseBody
	public String selectVacation(
			Vacation vacation
			, HttpSession session
			, @RequestParam(name="year_select") String year_select
			, @RequestParam(name="vaca_confirm") String vaca_confirm
			, @RequestParam(name="vaca_sort") String vaca_sort
			, @RequestParam(name="dept_name") String dept_name
			, @RequestParam(name="name") String name
			) {
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		int cp_no = loginSSInfo.getCp_no();
		vacation.setCp_no(cp_no);
		vacation.setDept_name(dept_name);
		vacation.setName(name);
		vacation.setVu_year(year_select);
		vacation.setVaca_confirm(vaca_confirm);
		vacation.setVaca_sort(vaca_sort);
		List<Vacation> result = hrService.selectVacation(vacation);
		Gson gsonObj = new GsonBuilder().setDateFormat("yyyy-MM-dd' / 'HH:mm:ss").serializeNulls().create();
		
		return gsonObj.toJson(result);
	}
	
	@PostMapping("/attendance/vacation/update")
	@ResponseBody
	public int updateVacation(
			Vacation vacation
			, HttpSession session
			, @RequestParam(name="modal_vaca_confirm") String modal_vaca_confirm
			, @RequestParam(name="modal_vaca_denied") String modal_vaca_denied
			, @RequestParam(name="vaca_no") String vaca_no
			) {
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		int vaca_approver = loginSSInfo.getEmp_no();
		vacation.setVaca_confirm(modal_vaca_confirm);
		vacation.setVaca_denied(modal_vaca_denied);
		vacation.setVaca_no(vaca_no);
		vacation.setVaca_approver(vaca_approver);
		int result = hrService.updateVacation(vacation);
		return result;
	}
}
