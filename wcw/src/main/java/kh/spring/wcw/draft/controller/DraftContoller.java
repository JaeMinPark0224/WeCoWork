package kh.spring.wcw.draft.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.wcw.draft.domain.Draft;
import kh.spring.wcw.draft.service.DraftService;
import kh.spring.wcw.employee.domain.Employee;

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
		
		// 회사가 가진 모든 직원 이름 정보 가져오기
		List<Employee> employeeList = draftService.selectEmployeeList(cp_no);
		System.out.println("전체 직원 목록: " + employeeList);
			
		mv.addObject("employeeList", employeeList);
		mv.setViewName("draft/insertDraft");
			
		return mv;
	}
	
	// 기안 리스트 페이지로 이동
	@GetMapping("/list")
	public ModelAndView selectListDraft(
			ModelAndView mv
			, HttpSession session
			, RedirectAttributes rttr
			, @RequestParam(name="page", required = false) String page) {
		int currentPage = 1; // 현재 페이지
		int cotentLimit = 25; // 한 페이지에 보여질 직원 정보 갯수
		
		String currentPageStr = page;
		try {
			if(currentPageStr != null && !currentPageStr.equals("")) {
				currentPage = Integer.parseInt(currentPageStr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int offset = (currentPage - 1) * cotentLimit;
		RowBounds rowBounds = new RowBounds(offset, cotentLimit);
		
		// 직위 레벨 가져오기 (대표직 확인)
		Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
		int ep_no = loginInfo.getEmp_no();
		
		// 대표적인지 확인하기
		String job_level = loginInfo.getJob_level();
		
		if(job_level.equals("0")) {
			rttr.addFlashAttribute("msg", "대표직은 기안함 이용이 불가합니다.");
			mv.setViewName("redirect:/");
			return mv;
		}
		
		// 자신이 작성한 기안 리스트 조회
		List<Draft> draftList = draftService.selectListDraft(ep_no, rowBounds);
		
		int totalpageCnt = draftList.size()/cotentLimit + 1;
		int startPage = currentPage - (((currentPage % 5) == 0)?4:((currentPage % 5)-1)); 
		int endPage = ((startPage + 4) > totalpageCnt)?totalpageCnt:(startPage + 4);
		
		mv.addObject("totalpageCnt", totalpageCnt);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("draftList", draftList);
		mv.setViewName("draft/draftList");
		
		return mv;
	}
	
	// 기안 작성 기능
	@PostMapping("/insert.do")
	public ModelAndView insertDoDraft(
			ModelAndView mv
			, HttpSession session
			, RedirectAttributes rttr
			, Draft draft) {
	
		System.out.println("draft: " + draft);
		
		// 기안을 작성하는 직원 번호 가져오기
		Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
		int ep_no = loginInfo.getEmp_no();
		
		if(draft.getEmp_no_1() != null) {
			int one = draft.getEmp_no_1();
			System.out.println("결재자1: " + one);
		}
		if(draft.getEmp_no_2() != null) {
			int two = draft.getEmp_no_2();
			System.out.println("결재자2: " + two);
		}
		if(draft.getEmp_no_3() != null) {
			int three = draft.getEmp_no_3();
			System.out.println("결재자3: " + three);
		}
		
		
		draft.setEp_no(ep_no);
		
		// 기안 insert하러 가기
		int result = draftService.insertDraft(draft);
		
		rttr.addFlashAttribute("msg", "기안 상신 완료");
		mv.setViewName("redirect:/draft/list");
		return mv;
	}
	
	// 기안 상세 조회 기능
	@GetMapping("/select")
	public ModelAndView selectDraft(
			ModelAndView mv
			, HttpSession session
			, RedirectAttributes rttr
			, @RequestParam(name="dr_sort", required = false) int dr_sort
			, @RequestParam(name="drNo", required = false) String dr_no_str) {
		System.out.println("dr_sort: " + dr_sort);
		System.out.println("dr_no_str: " + dr_no_str);
		int dr_no = Integer.parseInt(dr_no_str);
		List<Draft> draft = null;
		
		// 상세 조회할 기안 정보 가져오기
		draft = draftService.selectDraft(dr_no, dr_sort);

		mv.addObject("draft", draft);
		mv.setViewName("draft/selectDraft");
		return mv;
	}
}
