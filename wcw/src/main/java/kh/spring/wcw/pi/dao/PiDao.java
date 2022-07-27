package kh.spring.wcw.pi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.dept.domain.Dept;

@Repository
public class PiDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	// 상위부서조회
	public List<Dept> selectUpperDept(int cp_no){
		return sqlsession.selectList("PI.selectUpperDept", cp_no);
	}
	
	// 하위부서조회
	public List<Dept> selectHasUpperDept(int cp_no){
		return sqlsession.selectList("PI.selectHasUpperDept", cp_no);
	}
	
	// 상위부서 부재 부서 조회
	public List<Dept> selectNoUpperDept(int cp_no){
		return sqlsession.selectList("PI.selectNoUpperDept", cp_no);
	}
	
	// 부서별 직원 조회 
	public List<Dept> selectEmployeeDept(int cp_no){
		return sqlsession.selectList("PI.selectEmployeeDept", cp_no);
	}
	
}
