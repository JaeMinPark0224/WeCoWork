package kh.spring.wcw.todo.domain;

import org.springframework.stereotype.Component;

@Component
public class Todo {
	private int todo_no;
	private int emp_no;
	private String todo_content;
	
	public int getTodo_no() {
		return todo_no;
	}
	public void setTodo_no(int todo_no) {
		this.todo_no = todo_no;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getTodo_content() {
		return todo_content;
	}
	public void setTodo_content(String todo_content) {
		this.todo_content = todo_content;
	}
	@Override
	public String toString() {
		return "Todo [todo_no=" + todo_no + ", emp_no=" + emp_no + ", todo_content=" + todo_content + "]";
	}
	
	
	
}
