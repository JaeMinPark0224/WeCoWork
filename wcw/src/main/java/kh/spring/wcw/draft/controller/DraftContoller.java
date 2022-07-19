package kh.spring.wcw.draft.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
				, HttpSession session
				, RedirectAttributes rttr) {
			// 회사 번호 가져오기
			Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
			int cp_no = loginInfo.getCp_no();
			
			// 직위 레벨 가져오기
			String job_level = loginInfo.getJob_level();
				
			if(job_level.equals("0")) {
				System.out.println("대표님이다!!!!!!!!!!!");
				rttr.addFlashAttribute("msg", "대표직은 기안 작성이 불가합니다.");
				mv.setViewName("redirect:/"); // 결재함 리스트로 이동 TODO
				return mv;
			}
			// 회사가 가진 모든 직원 이름 정보 가져오기
			List<Employee> employeeList = draftService.selectEmployeeList(cp_no);
			System.out.println("전체 직원 목록: " + employeeList);
				
			mv.addObject("employeeList", employeeList);  // 회사 내 전체 직원 리스트
			mv.setViewName("draft/insertDraft");
			
			return mv;
		}
}
