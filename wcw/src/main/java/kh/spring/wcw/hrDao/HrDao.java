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
	public List<Employee> selectEmployeeList() {
		// 페이징
		int currentPage = 1;  // 현재 페이지 1이라 가정 
		int cotentLimit = 18; // 한 페이지에 보여질 직원 정보 갯수
		  
		int offset = (currentPage - 1) * cotentLimit;
		  
		RowBounds rowBounds = new RowBounds(offset, cotentLimit);
		
		return sqlsession.selectList("hrMapper.selectEmployeeList", null , rowBounds);
	}
	
}
