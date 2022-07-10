package kh.spring.wcw.vacation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.wcw.common.WCWUtill;

@Controller

public class VacationController {

	@Autowired
	private WCWUtill util;
	
	@GetMapping("/vacation")
	public ModelAndView viewVacation(ModelAndView mv) {
		mv.setViewName("vacation/vacation");
		return mv;
	}
	
}
