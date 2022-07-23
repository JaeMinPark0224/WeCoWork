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
	 * @return 기안함 리스트
	 * @author ybseo
	 */
	public List<Draft> selectListDraft(int ep_no,  RowBounds rowBounds);
	
	/**
	 * @param 직원 번호
	 * @return 결재함 리스트
	 * @author ybseo
	 */
	public List<Draft> selectListAppr(int emp_no,  RowBounds rowBounds);
	
	/**
	 * @param 기안 번호
	 * @return 기안 정보 (결재자가 1명 이상이 될 수 있으므로 List)
	 * @author ybseo
	 */
	public List<Draft> selectDraft(int dr_no, int dr_sort);

	/**
	 * @param 기안 번호, 직원 번호
	 * @return delete 후 결과값 (성공 여부)
	 * @author ybseo
	 */
	public int deleteDraft(int dr_no, int dr_sort, int ep_no);
	
	/**
	 * @param 기안 번호
	 * @return 해당 기안의 결재자 수
	 * @author ybseo
	 */
	public int checkApproval(int dr_no);
	
	/**
	 * @param 기안 번호, 직원 번호
	 * @return 해당 직원의 결재 번호
	 * @author ybseo
	 */
	public int checkApprOrder(int dr_no, int emp_no);
	
	/**
	 * @param 기안 번호, 해당 기안의 총 결재자 수, 결재하는 직원의 결재 순서
	 * @return 기안 업데이트 결과 (승인 ver)
	 * @author ybseo
	 */
	public int updateDraft(int dr_no, int cnt, int apprOrder);

}
