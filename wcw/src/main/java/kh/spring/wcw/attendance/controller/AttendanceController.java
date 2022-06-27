package kh.spring.wcw.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {
	
	@RequestMapping("/day")
	public ModelAndView selectDayAttendance(ModelAndView mv) {
		mv.setViewName("attendance/day");
		return mv;
	}

}
