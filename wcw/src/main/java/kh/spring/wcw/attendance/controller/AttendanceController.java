package kh.spring.wcw.attendance.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping("/daily")
	public ModelAndView viewDailyAttendance(ModelAndView mv) {
		mv.setViewName("attendance/daily");
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
	
	@RequestMapping(value =  "/select", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectAttendance(
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
		List<Attendance> selectResult = service.selectAttendance(attendance);
		
		Gson gsonObj = new GsonBuilder().setDateFormat("yyyy-MM-dd' / 'HH:mm:ss").serializeNulls().create();
		
		return gsonObj.toJson(selectResult);
				
	}
	
	
	@PostMapping("/approval/insert")
	@ResponseBody
	public String insertApprovalAttendance(Attendance attendance
			, @RequestParam(name="att_appr_req_date") String att_appr_req_date
			, @RequestParam(name="att_appr_clock_in_str") String att_appr_clock_in_str
			, @RequestParam(name="att_appr_clock_out_str") String att_appr_clock_out_str
			, @RequestParam(name="att_modify_reason_text") String att_modify_reason_text
			, HttpSession session
			) {
		Employee loginSSInfo = (Employee)session.getAttribute("loginSSInfo");
		Date att_appr_req_date_d = Date.valueOf(att_appr_req_date);
		Timestamp att_appr_clock_in_t = Timestamp.valueOf(att_appr_req_date + " " + att_appr_clock_in_str +":00");
		Timestamp att_appr_clock_out_t = Timestamp.valueOf(att_appr_req_date + " " +att_appr_clock_out_str +":00");
		attendance.setEmp_no(loginSSInfo.getEmp_no());
		attendance.setAtt_appr_req_date(att_appr_req_date_d);
		attendance.setAtt_appr_clock_in(att_appr_clock_in_t);
		attendance.setAtt_appr_clock_out(att_appr_clock_out_t);
		attendance.setAtt_appr_content(att_modify_reason_text);
		int result = service.insertApprovalAttendance(attendance);
//		int result = 0;
		return String.valueOf(result);
	}
	
	@PostMapping(value =  "/approval/select", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectApprovalAttendance(
			Attendance attendance
			,@RequestParam(name="att_date_start_str") String att_appr_date_start
			, @RequestParam(name="att_date_end_str") String att_appr_date_end
			, HttpSession session
			) {
		Employee loginSSInfo = (Employee)session.getAttribute("loginSSInfo");
		Date att_date_start_d = Date.valueOf(att_appr_date_start);
		Date att_date_end_d = Date.valueOf(att_appr_date_end);
		attendance.setEmp_no(loginSSInfo.getEmp_no());
		attendance.setAtt_date_start(att_date_start_d);
		attendance.setAtt_date_end(att_date_end_d);
		List<Attendance> selectResult = service.selectApprovalAttendance(attendance);
		
		Gson gsonObj = new GsonBuilder().setDateFormat("yyyy-MM-dd' / 'HH:mm:ss").serializeNulls().create();
		
		return gsonObj.toJson(selectResult);
				
	}
	
	///////////////////////////////////////주간 근태 관리//////////////////////////////////
	
	@RequestMapping("/weekly")
	public ModelAndView viewWeeklyAttendance(ModelAndView mv) {
		mv.setViewName("attendance/weekly");
		return mv;
	}
	
	@RequestMapping(value =  "/selectWeekly", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String selectWeeklyAttendance(
			Attendance attendance
			,@RequestParam(name="att_date_start_str") String att_date_start
			, @RequestParam(name="att_date_end_str") String att_date_end
			, HttpSession session
			) {
		Employee loginSSInfo = (Employee)session.getAttribute("loginSSInfo");
		Date att_date_start_d = Date.valueOf(att_date_start);
		Date att_date_end_d = Date.valueOf(att_date_end);
		attendance.setEmp_no(loginSSInfo.getEmp_no());
		attendance.setAtt_date_start(att_date_start_d);
		attendance.setAtt_date_end(att_date_end_d);
		List<Attendance> result = service.selectAttendance(attendance);
		
		Gson gsonObj = new GsonBuilder().setDateFormat("yyyy-MM-dd' / 'HH:mm:ss").serializeNulls().create();
		
		return gsonObj.toJson(result);
				
	}
	
///////////////////////////////////////월간 근태 관리//////////////////////////////////
	
	@RequestMapping("/monthly")
	public ModelAndView viewWMonthlyAttendance(ModelAndView mv) {
	mv.setViewName("attendance/monthly");
	return mv;
}
	

	
}
