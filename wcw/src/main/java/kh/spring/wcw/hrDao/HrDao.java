package kh.spring.wcw.hrDao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.notice.domain.Notice;

@Repository
public class HrDao {
	
	@Autowired
	private SqlSession sqlsession;
	 
	// 직원 리스트 조회
	public List<Employee> selectEmployeeList(int cp_no) {
		return sqlsession.selectList("hrMapper.selectEmployeeList", cp_no);
	}
	
	public List<Employee> selectEmployeeListFilter(String selectVal, RowBounds rowBounds, int cp_no) {
		HashMap<String, Object> map= new HashMap<>();
		map.put("selectVal", selectVal);
		map.put("cp_no", cp_no);
		return sqlsession.selectList("hrMapper.selectEmployeeListFilter", map, rowBounds);
	}
	
	// 직원 상세 조회
	public Employee selectEmployee(String emp_no, int cp_no) {
		HashMap<String, Object> map= new HashMap<>();
		map.put("emp_no", emp_no);
		map.put("cp_no", cp_no);
		return sqlsession.selectOne("hrMapper.selectEmployee", map);
	}
	
	// 부서 리스트 조회
	public List<String> selectDeptList(int cp_no) {
		return sqlsession.selectList("hrMapper.selectDeptList", cp_no);
	}
	
	// 직위 리스트 조회
	public List<String> selectJobList(int cp_no) {
		return sqlsession.selectList("hrMapper.selectJobList", cp_no);
	}	
	
	// 직원 정보 업데이트
	public int updateEmployee(int cp_no, int e_no, String dept_name, String job_title, int intl_no, String resign_yn) {
		HashMap<String, Object> map= new HashMap<>();
		map.put("cp_no", cp_no);
		map.put("emp_no", e_no);
		map.put("dept_name", dept_name);
		map.put("job_title", job_title);
		map.put("intl_no", intl_no);
		map.put("resign_yn", resign_yn);
		int result1 = sqlsession.update("hrMapper.updateEmployee1", map);
		System.out.println("result1: " + result1);
		int result2 = sqlsession.update("hrMapper.updateEmployee2", map);
		System.out.println("result2: " + result2);
		int result3 = sqlsession.update("hrMapper.updateEmployee3", map);
		System.out.println("result3: " + result3);
		
		int result = result1 + result2 + result3;
		return result;
	}
}
