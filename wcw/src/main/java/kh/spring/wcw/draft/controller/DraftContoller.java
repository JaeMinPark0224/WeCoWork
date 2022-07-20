package kh.spring.wcw.draft.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.dept.domain.Dept;
import kh.spring.wcw.draft.domain.Draft;
import kh.spring.wcw.draft.service.DraftService;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.hr.service.HrService;

@Controller
@RequestMapping("/draft")
public class DraftContoller {
	
	@Autowired
	private DraftService draftService;
	
	// 기안 작성 페이지로 이동
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
			rttr.addFlashAttribute("msg", "대표직은 기안 작성이 불가합니다.");
			mv.setViewName("redirect:/"); // 결재함 리스트로 이동 TODO
			return mv;
		}
		// 회사가 가진 모든 직원 이름 정보 가져오기
		List<Employee> employeeList = draftService.selectEmployeeList(cp_no);
		System.out.println("전체 직원 목록: " + employeeList);
			
		mv.addObject("employeeList", employeeList);
		mv.setViewName("draft/insertDraft");
			
		return mv;
	}
	
	// 기안 작성 기능
	@PostMapping("/insert.do")
	public ModelAndView insertDoDraft(
			ModelAndView mv
			, HttpSession session
			, RedirectAttributes rttr
			, Draft draft) {
		// 기안을 작성하는 직원 번호 가져오기
		Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
		int ep_no = loginInfo.getEmp_no();
		
		// 기안 insert하러 가기
		
		
		
		rttr.addFlashAttribute("msg", "기안 작성 완료");
		mv.setViewName("redirect:/draft/insert");
		return mv;
	}
}
