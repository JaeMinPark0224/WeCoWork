package kh.spring.wcw.draft.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.company.dao.CompanyDao;
import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.hrDao.HrDao;

@Service
public class DraftServiceImpl implements DraftService {
	@Autowired
	private HrDao dao;
	
	public List<Employee> selectEmployeeList(int cp_no) {
		return dao.selectEmployeeList(cp_no);
	}
	

	
}
