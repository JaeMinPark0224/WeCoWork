package kh.spring.wcw.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@GetMapping("/insert")
	public ModelAndView insertChat(
			ModelAndView mv) {
		
		mv.setViewName("chat/insert");
		return mv;
	}
}
