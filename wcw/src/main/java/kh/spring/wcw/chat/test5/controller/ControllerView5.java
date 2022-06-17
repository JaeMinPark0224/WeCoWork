package kh.spring.wcw.chat.test5.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControllerView5 {
	// 채팅방 입장
		@RequestMapping(value = "/chat5.do", method = RequestMethod.GET)
		public ModelAndView view_chat5(HttpServletRequest request
				, HttpServletResponse response
				, ModelAndView mv
				, @RequestParam(name="bang_id",defaultValue = "0") String bang_id
				) throws Exception {
			
			
			
			mv.addObject("bang_id", bang_id);
			mv.setViewName("test/view_chat5");
			
			return mv;
		}
		
		
		
		/* 원본코드
		 * // 채팅방 입장
		 * 
		 * @RequestMapping(value = "/chat.do", method = RequestMethod.GET) public String
		 * view_chat(HttpServletRequest request, HttpServletResponse response, Model
		 * model) throws Exception {
		 * 
		 * 
		 * return "view_chat"; }
		 */
	}
