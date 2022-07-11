package kh.spring.wcw.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.wcw.chat.service.ChatService;
import kh.spring.wcw.employee.domain.Employee;

@Controller
@RequestMapping("/chat")
public class ChatController {
	@Autowired
	private ChatService service;

	@GetMapping("/insert")
	public ModelAndView insertChat(
			ModelAndView mv) {
		
		
		List<Employee> result = service.selectEmployee();
		
		mv.addObject("emplist",result);
		mv.setViewName("chat/insert");
		return mv;
	}
}
