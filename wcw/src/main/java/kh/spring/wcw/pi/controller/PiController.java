package kh.spring.wcw.pi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pi")
public class PiController {
	@GetMapping("/chart")
	public ModelAndView viewChart(ModelAndView mv) {
		mv.setViewName("pi/chart");
		return mv;
	}
}
