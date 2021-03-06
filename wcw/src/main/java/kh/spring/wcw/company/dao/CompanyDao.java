package kh.spring.wcw.company.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.company.domain.Company;

@Repository
public class CompanyDao {
	
	@Autowired
	private SqlSession sqlsession;
	 
	public Company selectCompany(String email, String password){
		HashMap<String, String> map= new HashMap<>();
		map.put("email", email);
		map.put("pwd", password);
		
		return sqlsession.selectOne("companyMapper.selectCompany", map);
	}
	
	public int insertBusiness(Company company) {
		int result = -1;
		if(company.getCp_url() == "") {
			result= sqlsession.insert("companyMapper.insertBusiness1", company);
		} else {
			result= sqlsession.insert("companyMapper.insertBusiness2", company);
		}
		return result;
	}
	
}
