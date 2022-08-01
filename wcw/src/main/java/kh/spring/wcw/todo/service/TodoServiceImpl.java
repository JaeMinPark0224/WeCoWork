package kh.spring.wcw.todo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.todo.dao.TodoDao;
import kh.spring.wcw.todo.domain.Todo;

@Service
public class TodoServiceImpl implements TodoService{

	@Autowired
	private TodoDao dao;
	
	@Override
	public int insertTodo(Todo todo) {
		return dao.insertTodo(todo);
	}

	@Override
	public List<Todo> selectListTodo(int emp_no) {
		return dao.selectListTodo(emp_no);
	}

	@Override
	public int deleteTodo(int todo_no) {
		return dao.deleteTodo(todo_no);
	}

}
