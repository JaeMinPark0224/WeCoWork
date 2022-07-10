package kh.spring.wcw.hr.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.company.dao.CompanyDao;
import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.employee.dao.EmployeeDao;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.hrDao.HrDao;

@Service
public class HrServiceImpl implements HrService {
	
	@Autowired
	private HrDao dao;
	
	// 직원 리스트 조회
	public List<Employee> selectEmployeeList(){
		return dao.selectEmployeeList();
	};

	
}
