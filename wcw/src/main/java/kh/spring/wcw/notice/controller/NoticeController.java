package kh.spring.wcw.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.wcw.notice.domain.Notice;
import kh.spring.wcw.notice.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@GetMapping("/noticelist")
	public ModelAndView selectNotice(ModelAndView mv) {
		
		List<Notice> noticelist = service.selectNotice();
		
		mv.addObject("noticelist", noticelist);
		mv.setViewName("notice/noticelist");
		return mv;
	}
	

}
