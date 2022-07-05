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
	
	@RequestMapping("/insert")
	public ModelAndView insertProject(ModelAndView mv) {
		mv.setViewName("project/insert");
		return mv;
	}
	
	@RequestMapping("/board/list")
	public ModelAndView selectBoardProject(ModelAndView mv) {
		mv.setViewName("project/board/list");
		return mv;
	}
	
	@RequestMapping("/board/insert")
	public ModelAndView insertBoardProject(ModelAndView mv) {
		mv.setViewName("project/board/insert");
		return mv;
	}
	
	@RequestMapping("/board/read")
	public ModelAndView readBoardProject(ModelAndView mv) {
		mv.setViewName("project/board/read");
		return mv;
	}
	
	@RequestMapping("/work/list")
	public ModelAndView selectWorkProject(ModelAndView mv) {
		mv.setViewName("project/work/list");
		return mv;
	}
	
	@RequestMapping("/work/read")
	public ModelAndView readWorkProject(ModelAndView mv) {
		mv.setViewName("project/work/read");
		return mv;
	}
	
	@RequestMapping("/todo/list")
	public ModelAndView selectTodoProject(ModelAndView mv) {
		mv.setViewName("project/todo/list");
		return mv;
	}
	
	@RequestMapping("/calendar/list")
	public ModelAndView selectCalendarProject(ModelAndView mv) {
		mv.setViewName("project/calendar/list");
		return mv;
	}
	
	@RequestMapping("/file/list")
	public ModelAndView selectFileProject(ModelAndView mv) {
		mv.setViewName("project/file/list");
		return mv;
	}
	
	@RequestMapping("/participant/list")
	public ModelAndView selectParticipantProject(ModelAndView mv) {
		mv.setViewName("project/participant/list");
		return mv;
	}
	
}
