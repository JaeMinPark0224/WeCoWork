package kh.spring.wcw.hr.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.hr.service.HrService;

@Controller
@RequestMapping("/hr")
public class HrController {
	
	@Autowired
	private HrService HrService;
	
	// 직원 리스트 조회 페이지로 이동
	@GetMapping("/employee/list")
	public ModelAndView selectListEmployee(
			ModelAndView mv
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
		
		List<Employee> totalList = HrService.selectEmployeeList();
		
		int totalpageCnt = totalList.size()/cotentLimit + 1;
		int startPage = currentPage - (((currentPage % 5) == 0)?4:((currentPage % 5)-1)); 
		int endPage = ((startPage + 4) > totalpageCnt)?totalpageCnt:(startPage + 4);
		
		list = HrService.selectEmployeeListFilter(selectVal, rowBounds);
		
		mv.addObject("option", selectVal);
		mv.addObject("totalpageCnt", totalpageCnt);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("employeeList", list);
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
//		list = HrService.selectEmployeeListFilter(selectVal);
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
}
