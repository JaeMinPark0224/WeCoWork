package kh.spring.wcw.pi.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.dept.domain.Dept;
import kh.spring.wcw.pi.dao.PiDao;

@Service
public class PiServiceImpl implements PiService {
	@Autowired
	private PiDao dao;
	
	// 직원 리스트 조회
	@Override
	public List<Dept> selectUpperDept(int cp_no) {
		return dao.selectUpperDept(cp_no);
	}

	@Override
	public List<Dept> selectHasUpperDept(int cp_no) {
		return dao.selectHasUpperDept(cp_no);
	}

	@Override
	public List<Dept> selectNoUpperDept(int cp_no) {
		return dao.selectNoUpperDept(cp_no);
	}

	@Override
	public List<Dept> selectEmployeeDept(int cp_no) {
		return dao.selectEmployeeDept(cp_no);
	}
	
	
}
