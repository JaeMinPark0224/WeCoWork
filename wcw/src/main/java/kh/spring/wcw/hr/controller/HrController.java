package kh.spring.wcw.hr.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.hr.service.HrService;

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

	@PostMapping(value= "/employee/update", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateEmployee(
			HttpSession session
			, @RequestParam(name="emp_no", required = false) String e_no_str
			, @RequestParam(name="dept_name", required = false) String dept_name
			, @RequestParam(name="job_title", required = false) String job_title
			, @RequestParam(name="intl_no", required = false) String intl_no_str
			, @RequestParam(name="resign_yn", required = false) String resign_yn) {
		
		Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
		int cp_no = loginInfo.getCp_no();
		
		int e_no = Integer.parseInt(e_no_str);
		int intl_no = Integer.parseInt(intl_no_str);
		
		int result_int = hrService.updateEmployee(cp_no, e_no, dept_name, job_title, intl_no, resign_yn);
		String result = Integer.toString(result_int);
		return result;
	}
}
