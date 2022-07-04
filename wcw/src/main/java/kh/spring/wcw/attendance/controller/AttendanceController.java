package kh.spring.wcw.attendance.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.spring.wcw.attendance.domain.Attendance;
import kh.spring.wcw.attendance.model.service.AttendanceService;
import kh.spring.wcw.common.WCWUtill;
import kh.spring.wcw.employee.domain.Employee;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {
	
	@Autowired
	private AttendanceService service;
	
	@Autowired
	private WCWUtill util;
	
	@RequestMapping("/day")
	public ModelAndView selectDayAttendance(ModelAndView mv) {
		mv.setViewName("attendance/day");
		return mv;
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public String insertAttendance(Attendance attendance
			, HttpSession session
			, HttpServletRequest request
			) {
		Employee loginSSInfo = (Employee)session.getAttribute("loginSSInfo");
		if(loginSSInfo == null) {
			return "session is empty";
		}
		attendance.setEmp_no(loginSSInfo.getEmp_no());
		attendance.setIp_clock_in(util.getClientIP(request));
		int result = service.insertAttendance(attendance);
		return String.valueOf(result);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public String updateAttendance(
			Attendance attendance
			, HttpSession session
			, HttpServletRequest request
			) {
		Employee loginSSInfo = (Employee)session.getAttribute("loginSSInfo");
		attendance.setEmp_no(loginSSInfo.getEmp_no());
		attendance.setIp_clock_out(util.getClientIP(request));
		int result = service.updateAttendance(attendance);
		return String.valueOf(result);
	}
	
	@RequestMapping(value =  "/read", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String readAttendance(
			Attendance attendance
			,@RequestParam(name="att_date_start") String att_date_start
			, @RequestParam(name="att_date_end") String att_date_end
			, HttpSession session
			) {
		Employee loginSSInfo = (Employee)session.getAttribute("loginSSInfo");
		Date att_date_start_d = Date.valueOf(att_date_start);
		Date att_date_end_d = Date.valueOf(att_date_end);
		attendance.setEmp_no(loginSSInfo.getEmp_no());
		attendance.setAtt_date_start(att_date_start_d);
		attendance.setAtt_date_end(att_date_end_d);
		List<Attendance> readResult = service.readAttendance(attendance);
		
		Gson gsonObj = new GsonBuilder().setDateFormat("yyyy-MM-dd' / 'HH:mm:ss").create();
		
		return gsonObj.toJson(readResult);
				
		
	}
}
