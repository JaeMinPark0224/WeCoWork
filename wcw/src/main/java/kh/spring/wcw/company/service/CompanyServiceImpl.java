package kh.spring.wcw.company.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.company.dao.CompanyDao;
import kh.spring.wcw.company.domain.Company;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompanyDao dao;
	
	@Override
	public Company selectCompany(String id, String password){
		return dao.selectCompany(id, password);
	}
	
	@Override
	public int insertBusiness(Company company) {
		return dao.insertBusiness(company);
	}

	
}
