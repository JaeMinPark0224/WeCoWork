package kh.spring.wcw.wcw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.wcw.dao.WcwDao;
import kh.spring.wcw.wcw.domain.Wcw;

@Service
public class WcwService {

	@Autowired
	private WcwDao wcwdao;
	
	// 로그인 기능
	public Wcw selectLogin(Wcw wcw) {
		return wcwdao.selectLogin(wcw);
	}
	
	// 모든 회사 정보
	public List<Company> selectCompanyList(){
		return wcwdao.selectCompanyList();
	}
	
	// 회사 업데이트 (가입 승인 및 반려 처리)
	public int updateCompany(String cp_no, String type){
		return wcwdao.updateCompany(cp_no, type);
	}
}
