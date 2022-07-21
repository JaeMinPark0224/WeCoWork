package kh.spring.wcw.draft.service;


import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.draft.dao.DraftDao;
import kh.spring.wcw.draft.domain.Draft;
import kh.spring.wcw.employee.domain.Employee;

@Service
public class DraftServiceImpl implements DraftService {
	@Autowired
	private DraftDao dao;
	
	@Override
	public List<Employee> selectEmployeeList(int cp_no) {
		return dao.selectEmployeeList(cp_no);
	}
	
	@Override
	public int insertDraft(Draft draft) {
		return dao.insertDraft(draft);
	}
	
	@Override
	public List<Draft> selectListDraft(int ep_no, RowBounds rowBounds){
		return dao.selectListDraft(ep_no, rowBounds);
	}

	
}
