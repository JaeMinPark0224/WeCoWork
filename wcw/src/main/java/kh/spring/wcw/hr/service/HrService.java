package kh.spring.wcw.hr.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import kh.spring.wcw.employee.domain.Employee;

/**
 *   직원 서비스 
 *   */
public interface HrService {
	/**
	 * @param -
	 * @return 직원 리스트
	 * @author ybseo
	 */
	public List<Employee> selectEmployeeList(RowBounds rowBounds);
	
	public List<Employee> selectEmployeeList();
	
	/**
	 * @param filter value
	 * @return filter에 맞는 직원 리스트
	 * @author ybseo
	 */
	public List<Employee> selectEmployeeListFilter(String selectVal, RowBounds rowBounds);
}
