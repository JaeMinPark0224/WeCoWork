package kh.spring.wcw.pi.service;

import java.util.List;


import kh.spring.wcw.dept.domain.Dept;

/**
 *   결재 & 기안 서비스 
 *   */
public interface PiService {
	
	/**
	 * @param 회사 번호
	 * @return 상위부서 리스트
	 * @author Jinjeong Lee
	 */
	public List<Dept> selectUpperDept(int cp_no);
	
	/**
	 * @param 회사 번호
	 * @return 하위부서 리스트
	 * @author Jinjeong Lee
	 */
	public List<Dept> selectHasUpperDept(int cp_no);
	
	/**
	 * @param 회사 번호
	 * @return 상위부서 부재 부서 리스트
	 * @author Jinjeong Lee
	 */
	public List<Dept> selectNoUpperDept(int cp_no);
	
	/**
	 * @param 회사 번호
	 * @return 부서별 직원 리스트
	 * @author Jinjeong Lee
	 */
	public List<Dept> selectEmployeeDept(int cp_no);

}
