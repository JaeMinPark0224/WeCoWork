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
	 
	// 직원 리스트 select
	public List<Employee> selectEmployeeList(RowBounds rowBounds) {
		return sqlsession.selectList("hrMapper.selectEmployeeList", null , rowBounds);
	}
	
	public List<Employee> selectEmployeeList() {
		return sqlsession.selectList("hrMapper.selectEmployeeList");
	}
	
	public List<Employee> selectEmployeeListFilter(String selectVal, RowBounds rowBounds) {
		return sqlsession.selectList("hrMapper.selectEmployeeListFilter", selectVal, rowBounds);
	}
	
}
