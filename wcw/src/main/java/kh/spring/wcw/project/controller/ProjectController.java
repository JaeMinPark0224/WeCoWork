package kh.spring.wcw.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@RequestMapping("/list")
	public ModelAndView selectProject(ModelAndView mv) {
		mv.setViewName("project/list");
		return mv;
	}
	
	@RequestMapping("/main")
	public ModelAndView readProject(ModelAndView mv) {
		mv.setViewName("project/main");
		return mv;
	}
	
}
