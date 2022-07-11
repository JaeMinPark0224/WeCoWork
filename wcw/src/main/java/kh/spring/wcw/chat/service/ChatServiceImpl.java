package kh.spring.wcw.chat.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.chat.dao.ChatDao;
import kh.spring.wcw.employee.domain.Employee;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired
	private ChatDao dao;

	@Override
	public List<Employee> selectEmployee() {
		return dao.selectEmployee();
	}
	
	
	
}
