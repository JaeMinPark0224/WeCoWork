package kh.spring.wcw.draft.dao;

import java.util.HashMap;
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
	
	// 직원 리스트 조회
	public List<Employee> selectEmployeeList(int cp_no){
		return sqlsession.selectList("draftMapper.selectEmployee", cp_no);
	}
	
	// 기안 작성
	public int insertDraft(Draft darft){
		return sqlsession.insert("draftMapper.insertDraft", darft);
	}
	
	// 기안함 리스트
	public List<Draft> selectListDraft(int ep_no, RowBounds rowBounds){
		return sqlsession.selectList("draftMapper.selectListDraft", ep_no, rowBounds);
	}
	
	// 결재함 리스트
	public List<Draft> selectListAppr(int emp_no, RowBounds rowBounds){
		return sqlsession.selectList("draftMapper.selectListAppr", emp_no, rowBounds);
	}
	
	// 기안 상세 보기
	public List<Draft> selectDraft(int dr_no, int dr_sort){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dr_no", dr_no);
		map.put("dr_sort", dr_sort);
		System.out.println(dr_sort);
		return sqlsession.selectList("draftMapper.selectDraft", map);
	}
	
	//가안 삭제하기
	public int deleteDraft(int dr_no, int dr_sort, int ep_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result1 = 0;
		map.put("dr_no", dr_no);
		map.put("dr_sort", dr_sort);
		map.put("ep_no", ep_no);
		System.out.println("dr_sort: " + dr_sort);
		if(dr_sort == 3) {
			sqlsession.delete("draftMapper.deleteDraft1", map);
			result1 = 1;
		}
		int result2 = sqlsession.delete("draftMapper.deleteDraft2", map);
		int result3 = sqlsession.delete("draftMapper.deleteDraft3", map);
		int result = result1 + result2 + result3;
		
		return result;
	}
	
	// 기안 결재자 수 확인
	public int checkApproval(int dr_no) {
		return sqlsession.selectOne("draftMapper.checkApproval", dr_no);
	}
	
	// 시안 순번 확인
	public int checkApprOrder(int dr_no, int emp_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dr_no", dr_no);
		map.put("emp_no", emp_no);
		return sqlsession.selectOne("draftMapper.checkApprOrder", map);
	}
	
	// 기안 승인용 업데이트
	public int updateDraft(int dr_no, int cnt, int apprOrder, int num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dr_no", dr_no);
		map.put("cnt", cnt);
		map.put("apprOrder", apprOrder);
		
		int result = -1;
		// 승인
		if(num == 1) {
			result = sqlsession.update("draftMapper.updateTbApproval1", map);
			if(cnt == 3 && apprOrder == 2) {
				System.out.println("안가요");
			} else {
				result = sqlsession.update("draftMapper.updateTbApproval2", map);
			}
		} 
		// 반려
		else if(num == 2) {
			result = sqlsession.update("draftMapper.updateTbApproval3", map);
			result = sqlsession.update("draftMapper.updateTbApproval4", dr_no);
		}
		
		return result;
	}
	
	// 기안 자동 부결용
	public void draftAutoRejected() {
		sqlsession.update("draftMapper.draftAutoRejected");
	}
}
