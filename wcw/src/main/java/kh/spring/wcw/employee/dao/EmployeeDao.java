package kh.spring.wcw.employee.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 로그인
	public Employee selectEmployee(String email, String password){
		HashMap<String, String> map= new HashMap<>();
		map.put("email", email);
		map.put("pwd", password);
		
		return sqlsession.selectOne("employeeMapper.selectEmployee", map);
	}
	
	// 자동 로그인
	public int autologin(String email, String sessionId, Date next){
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("email", email);
		map.put("sessionId", sessionId);
		map.put("next", next);
		
		int result = sqlsession.update("employeeMapper.autologin", map);
		System.out.println("업데이트 완료");
		return result;
	}
	
	// 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크
	public Employee checkSessionKey(String sessionId){
		return sqlsession.selectOne("employeeMapper.checkSessionKey",sessionId);
	}
	
	// 비밀번호 찾기
	public String selectEmployeePwd(String cp_name, String email, String name){
		HashMap<String, String> map= new HashMap<>();
		map.put("cp_name", cp_name);
		map.put("email", email);
		map.put("name", name);
		
		return sqlsession.selectOne("employeeMapper.selectEmployeePwd", map);
	}
	
	// 난수 번호 insert
	public int insertRandomNum(String email) {
		return sqlsession.insert("employeeMapper.insertRandomNum", email);
	}
	
	// 난수 번호 update
	public int updateRandomNum(String email) {
		return sqlsession.update("employeeMapper.updateRandomNum", email);
	}
	
	// 난수 번호 select
	public String selectRandomNum(String email) {
		return sqlsession.selectOne("employeeMapper.selectRandomNum", email);
	}
}
