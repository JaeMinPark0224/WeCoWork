package kh.spring.wcw.draft.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import kh.spring.wcw.draft.domain.Draft;
import kh.spring.wcw.employee.domain.Employee;

/**
 *   결재 & 기안 서비스 
 *   */
public interface DraftService {
	/**
	 * @param 회사 번호
	 * @return 직원 리스트 (직책순)
	 * @author ybseo
	 */
	public List<Employee> selectEmployeeList(int cp_no);
	
	/**
	 * @param 기안 작성에 필요한 정보
	 * @return insert 후 결과값 (성공 여부)
	 * @author ybseo
	 */
	public int insertDraft(Draft draft);
	
	/**
	 * @param 직원 번호
	 * @return 기안 리스트
	 * @author ybseo
	 */
	public List<Draft> selectListDraft(int ep_no,  RowBounds rowBounds);

	

}
