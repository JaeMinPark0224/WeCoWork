package kh.spring.wcw.draft.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.draft.domain.Draft;
import kh.spring.wcw.employee.domain.Employee;

@Repository
public class DraftDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<Employee> selectEmployeeList(int cp_no){
		return sqlsession.selectList("draftMapper.selectEmployee", cp_no);
	}
	
	public int insertDraft(Draft darft){
		return sqlsession.insert("draftMapper.insertDraft", darft);
	}
	
	public List<Draft> selectListDraft(int ep_no, RowBounds rowBounds){
		return sqlsession.selectList("draftMapper.selectListDraft", ep_no, rowBounds);
	}
}
