package kh.spring.wcw.todo.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.wcw.common.WCWUtill;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.todo.domain.Todo;
import kh.spring.wcw.todo.service.TodoService;

@Controller
@RequestMapping("/todo")
public class TodoController {
	
	@Autowired
	private WCWUtill wcwutill;
	
	@Autowired
	private TodoService service;
	
	@PostMapping("/insert")
	@ResponseBody
	public String insertTodo(
			HttpSession session
			, Todo todo) {
		if(!wcwutill.loginChk(session)) {
			return "-1";
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		todo.setEmp_no(loginSSInfo.getEmp_no());
		int result = service.insertTodo(todo);
		return String.valueOf(result);
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public String deleteTodo(
			HttpSession session
			, @RequestParam int todo_no
			, Todo todo) {
		if(!wcwutill.loginChk(session)) {
			return "-1";
		}
		int result = service.deleteTodo(todo_no);
		return String.valueOf(result);
	}
}
