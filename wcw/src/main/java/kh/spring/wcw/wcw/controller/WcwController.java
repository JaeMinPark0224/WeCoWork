package kh.spring.wcw.wcw.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.wcw.wcw.service.WcwService;

@Controller
public class WcwController {
	
	@Autowired
	private WcwService wcwservice;
	
	// wcw 전용 로그인 페이지로 이동
	@GetMapping("/dp/login")
	public ModelAndView readMain(ModelAndView mv) {
		mv.setViewName("wcw/login");
		return mv;
	}
}
