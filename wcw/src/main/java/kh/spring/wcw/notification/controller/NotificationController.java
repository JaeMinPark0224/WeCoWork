package kh.spring.wcw.notification.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.wcw.notification.domain.Notification;
import kh.spring.wcw.notification.service.NotificationService;

@Controller
@RequestMapping("/notification")
public class NotificationController {
	
	@Autowired
	private NotificationService service;
	
	@GetMapping("/list")
	public ModelAndView selectNotification(
			ModelAndView mv
			) {
		
		List<Notification> notificationlist = service.selectNotification();
			
		mv.addObject("notificationlist", notificationlist);
		mv.setViewName("notification/list");
		return mv;
		
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public String deleteNotification(
			//@RequestParam(name="deletecheckArr",required = false) List<String> deletecheckArr,
			@RequestParam(name="chk",required = false) List<String> deletecheckArr
			)throws IOException {
		System.out.println(deletecheckArr);
		int result = service.deleteNotification(deletecheckArr);
		
		return String.valueOf(result);
	}
	
}
