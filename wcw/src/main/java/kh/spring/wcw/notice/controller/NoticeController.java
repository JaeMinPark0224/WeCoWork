package kh.spring.wcw.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.wcw.notice.domain.Notice;
import kh.spring.wcw.notice.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@GetMapping("/list")
	public ModelAndView selectNotice(ModelAndView mv,
			@RequestParam(name = "page", defaultValue = "1") int currentPage) {
		
		final int pageSize = 7; // 한페이지에 보여줄 행
		final int pageBlock = 3; // 페이징에 나타날 페이지수
		
		
		
		List<Notice> noticelist = service.selectNotice(currentPage,pageSize);
		
		mv.addObject("noticelist", noticelist);
		mv.setViewName("notice/list");
		return mv;
	}
	
	@GetMapping("/read")
	public ModelAndView readNotice(
			ModelAndView mv,
			@RequestParam(name="nt_no", defaultValue = "0") int nt_no
			) {
		if(nt_no == 0) {
			mv.setViewName("redirect:list");
			return mv;
		}
		Notice result = service.readNotice(nt_no);
		mv.addObject("notice", result);
		mv.setViewName("notice/read");
		
		return mv;
		
	}

}
