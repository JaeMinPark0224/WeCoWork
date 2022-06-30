package kh.spring.wcw.employee.service;

import java.util.List;

import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.notice.domain.Notice;

/**
 *   직원 서비스 
 *   */
public interface EmployeeService {
	/**
	 * @param id(email), pwd
	 * @return 직원 정보
	 * @author ybseo
	 */
	public Employee selectEmployee(String id, String password);
	
	/**
	 * @param cp_name(회사명), id(email), name(성명)
	 * @return 직원 비밀번호 정보
	 * @author ybseo
	 */
	public Employee selectEmployeePwd(String cp_name, String id, String name);

}
