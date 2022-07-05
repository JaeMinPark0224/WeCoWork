package kh.spring.wcw.employee.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.employee.dao.EmployeeDao;
import kh.spring.wcw.employee.domain.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDao dao;
	
	// 로그인
	@Override
	public Employee selectEmployee(String id, String password){
		return dao.selectEmployee(id, password);
	}
	
	// 자동 로그인
	@Override
	public int autologin(String uid, String sessionId, Date next) {
		return dao.autologin(uid, sessionId, next);
	}
	
	// 유효기간 확인
	@Override
	public Employee checkSessionKey(String sessionId) {
		return dao.checkSessionKey(sessionId);
	}
	
	// 비밀번호 찾기
	@Override
	public String selectEmployeePwd(String cp_name, String email, String name) {
		return dao.selectEmployeePwd(cp_name, email, name);
	}
	
	// 난수 insert
	@Override
	public int insertRandomNum(String email) {
		return dao.insertRandomNum(email);
	}
	
	public int updateRandomNum(String email) {
		return dao.updateRandomNum(email);
	}
	
	// 난수 delete
	@Override
	public int deleteRandomNum(String email) {
		return dao.deleteRandomNum(email);
	}
	
	// 난수 select
	@Override
	public String selectRandomNum(String email) {
		return dao.selectRandomNum(email);
	}

	
}
