package kh.spring.wcw.draft.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.dept.domain.Dept;
import kh.spring.wcw.draft.service.DraftService;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.hr.service.HrService;

@Controller
@RequestMapping("/draft")
public class DraftContoller {
	
	@Autowired
	private DraftService draftService;
	
	// 부서 리스트 조회 페이지로 이동
		@GetMapping("/insert")
		public ModelAndView insertDraft(
				ModelAndView mv
				, HttpSession session) {
			// 회사 번호 가져오기
			int cp_no = -1;
			Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
					
			if(loginInfo == null) {
				Company CompanySSinfo = (Company)session.getAttribute("CompanySSinfo");
				System.out.println("CompanySSinfo: "+CompanySSinfo);
				cp_no = CompanySSinfo.getCp_no();
			} else {
				cp_no = loginInfo.getCp_no();
			}
			System.out.println("회사 번호: " + cp_no);
				
			// 회사가 가진 모든 직원 이름 정보 가져오기
			List<Employee> employeeList = draftService.selectEmployeeList(cp_no);
			System.out.println("전체 직원 목록: " + employeeList);
				
			mv.addObject("employeeList", employeeList);  // 회사 내 전체 직원 리스트
			mv.setViewName("draft/insertDraft");
			
			return mv;
		}
}
