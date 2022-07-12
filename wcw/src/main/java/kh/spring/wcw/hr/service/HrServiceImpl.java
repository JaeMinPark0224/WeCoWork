package kh.spring.wcw.hr.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
	@Override
	public List<Employee> selectEmployeeList(int cp_no) {
		return dao.selectEmployeeList(cp_no);
	};

	@Override
	public List<Employee> selectEmployeeListFilter(String selectVal, RowBounds rowBounds, int cp_no){
		return dao.selectEmployeeListFilter(selectVal, rowBounds, cp_no);
	}
	
	// 직원 상세 조회
	@Override
	public Employee selectEmployee(String emp_no, int cp_no) {
		return dao.selectEmployee(emp_no, cp_no);
	}
	
	// 부서 리스트 조회
	@Override
	public List<String> selectDeptList(int cp_no) {
		return dao.selectDeptList(cp_no);
	}

	// 직위 리스트 조회
	@Override
	public List<String> selectJobList(int cp_no) {
		return dao.selectJobList(cp_no);
	}
		
}
