package kh.spring.wcw.draft.service;

import java.util.List;

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

	

}
