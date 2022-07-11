package kh.spring.wcw.chat.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.employee.domain.Employee;

@Repository
public class ChatDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<Employee> selectEmployee (){
		return sqlsession.selectList("Chat.selectEmployee");
	}
	
	
}
