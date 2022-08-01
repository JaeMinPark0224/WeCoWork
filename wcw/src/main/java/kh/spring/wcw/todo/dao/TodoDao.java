package kh.spring.wcw.todo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.todo.domain.Todo;

@Repository
public class TodoDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int insertTodo(Todo todo) {
		return sqlsession.insert("Todo.insertTodo", todo);
	}
	
	public List<Todo> selectListTodo(int emp_no) {
		return sqlsession.selectList("Todo.selectListTodo", emp_no);
	}
	
	public int deleteTodo(int todo_no) {
		return sqlsession.delete("Todo.deleteTodo", todo_no);
	}
}
