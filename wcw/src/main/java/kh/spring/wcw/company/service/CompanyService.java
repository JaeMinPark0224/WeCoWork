package kh.spring.wcw.company.service;

import java.util.List;

import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.notice.domain.Notice;

/**
 *   회사 서비스 
 *   */
public interface CompanyService {
	/**
	 * @param id(email), pwd
	 * @return 회사 정보
	 * @author ybseo
	 */
	public Company selectCompany(String id, String password);
	
	/**
	 * @param company
	 * @return INSERT 후 성공 여부(int)
	 * @author ybseo
	 */
	public int insertBusiness(Company company);

}
