package kh.spring.wcw.todo.service;

import java.util.List;

import kh.spring.wcw.todo.domain.Todo;

public interface TodoService {
	public int insertTodo(Todo todo);
	
	public List<Todo> selectListTodo(int emp_no);
	
	public int deleteTodo(int todo_no);
}
