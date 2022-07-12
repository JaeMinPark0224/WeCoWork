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
}
