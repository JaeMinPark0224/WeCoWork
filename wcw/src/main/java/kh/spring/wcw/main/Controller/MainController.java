package kh.spring.wcw.main.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@GetMapping("/")
	public ModelAndView mainController(ModelAndView mv) {
		mv.setViewName("main/main");
		return mv;
	}
	
}
