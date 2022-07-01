package kh.spring.wcw.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.employee.dao.EmployeeDao;
import kh.spring.wcw.employee.domain.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDao dao;
	
	
	@Override
	public Employee selectEmployee(String id, String password){
		return dao.selectEmployee(id, password);
	}
	
	@Override
	public String selectEmployeePwd(String cp_name, String email, String name) {
		return dao.selectEmployeePwd(cp_name, email, name);
	}

	
}
