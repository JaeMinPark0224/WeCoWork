package kh.spring.wcw.attendance.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.wcw.attendance.domain.Attendance;
import kh.spring.wcw.attendance.model.service.AttendanceService;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {
	
	@Autowired
	private AttendanceService service;
	
	@RequestMapping("/day")
	public ModelAndView selectDayAttendance(ModelAndView mv) {
		mv.setViewName("attendance/day");
		return mv;
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public String insertAttendance(Attendance Attendance
//			@RequestParam(name="clock_in", required = false) String 
			) {
		int result = service.insertAttendance(Attendance);
		return String.valueOf(result);
	}
}
