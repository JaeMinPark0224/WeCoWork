package kh.spring.wcw.employee.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.notice.domain.Notice;

@Repository
public class EmployeeDao {
	
	@Autowired
	private SqlSession sqlsession;
	 
	public Employee selectEmployee(String email, String password){
		HashMap<String, String> map= new HashMap<>();
		map.put("email", email);
		map.put("pwd", password);
		
		return sqlsession.selectOne("employeeMapper.selectEmployee", map);
	}
	
	public String selectEmployeePwd(String cp_name, String email, String name){
		HashMap<String, String> map= new HashMap<>();
		map.put("cp_name", cp_name);
		map.put("email", email);
		map.put("name", name);
		
		return sqlsession.selectOne("employeeMapper.selectEmployeePwd", map);
	}
}
