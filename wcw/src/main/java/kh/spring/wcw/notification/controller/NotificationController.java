package kh.spring.wcw.notification.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/notification")
public class NotificationController {
	
	@GetMapping("/list")
	public ModelAndView selectNotification(
			ModelAndView mv
			) {
		
		mv.setViewName("notification/list");
		return mv;
		
		
	}
	
	
}
