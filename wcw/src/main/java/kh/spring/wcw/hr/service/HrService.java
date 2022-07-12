package kh.spring.wcw.hr.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.employee.domain.Employee;

/**
 *   직원 서비스 
 *   */
public interface HrService {
	/**
	 * @param 회사명
	 * @return 직원 리스트
	 * @author ybseo
	 */
	public List<Employee> selectEmployeeList(int cp_no);
	
	/**
	 * @param filter value
	 * @return filter에 맞는 직원 리스트
	 * @author ybseo
	 */
	public List<Employee> selectEmployeeListFilter(String selectVal, RowBounds rowBounds, int cp_no);

	/**
	 * @param 사원 번호, 회사명
	 * @return 직원 상세 정보
	 * @author ybseo
	 */
	public Employee selectEmployee(String emp_no, int cp_no);
	
	/**
	 * @param 회사명
	 * @return 부서 리스트
	 * @author ybseo
	 */
	public List<String> selectDeptList(int cp_no);
	
	/**
	 * @param 회사명
	 * @return 직위 리스트
	 * @author ybseo
	 */
	public List<String> selectJobList(int cp_no);
}
