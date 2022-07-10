package kh.spring.wcw.hr.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.hr.service.HrService;

@Controller
@RequestMapping("/hr")
public class HrController {
	
	@Autowired
	private HrService HrService;
	
	@GetMapping("/employee/list")
	public ModelAndView viewDailyAttendance(ModelAndView mv) {
		 
		List<Employee> list = HrService.selectEmployeeList();
		
		mv.setViewName("hr/employeeList");
		return mv;
	}
}
