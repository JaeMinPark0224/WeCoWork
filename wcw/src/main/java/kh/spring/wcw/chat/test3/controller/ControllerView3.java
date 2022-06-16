package kh.spring.wcw.chat.test3.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ControllerView3 {
	
	// 채팅방 입장
		@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
		public String view_chat(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

			return "test/view_chat";
		}
}
