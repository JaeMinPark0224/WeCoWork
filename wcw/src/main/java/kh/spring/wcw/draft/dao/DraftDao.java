package kh.spring.wcw.draft.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.employee.domain.Employee;

@Repository
public class DraftDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<Employee> selectEmployeeList(int cp_no){
		return sqlsession.selectList("draftMapper.selectEmployee", cp_no);
	}
}
