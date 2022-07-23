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
	
	// 직원 리스트 조회
	@Override
	public List<Employee> selectEmployeeList(int cp_no) {
		return dao.selectEmployeeList(cp_no);
	}
	
	// 기안 작성
	@Override
	public int insertDraft(Draft draft) {
		return dao.insertDraft(draft);
	}
	
	// 기안함 리스트 조회
	@Override
	public List<Draft> selectListDraft(int ep_no, RowBounds rowBounds){
		return dao.selectListDraft(ep_no, rowBounds);
	}
	
	// 결재함 리스트 조회
	@Override
	public List<Draft> selectListAppr(int emp_no, RowBounds rowBounds){
		return dao.selectListAppr(emp_no, rowBounds);
	}

	// 기안 상세 보기
	@Override
	public List<Draft> selectDraft(int dr_no, int dr_sort){
		return dao.selectDraft(dr_no, dr_sort);
	}
	
	// 가안 삭제하기
	public int deleteDraft(int dr_no, int dr_sort, int ep_no) {
		return dao.deleteDraft(dr_no, dr_sort, ep_no);
	}
	
	// 기안의 결재자 수 확인
	public int checkApproval(int dr_no) {
		return dao.checkApproval(dr_no);
	}
	
	// 기안 순번 확인
	public int checkApprOrder(int dr_no, int emp_no) {
		return dao.checkApprOrder(dr_no, emp_no);
	}
	
	// 기안 승인용 업데이트
	public int updateDraft(int dr_no, int cnt, int apprOrder) {
		return dao.updateDraft(dr_no, cnt, apprOrder);
	}
}
