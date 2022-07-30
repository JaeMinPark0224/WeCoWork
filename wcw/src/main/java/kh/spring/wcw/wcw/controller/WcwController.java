package kh.spring.wcw.wcw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.wcw.domain.Wcw;
import kh.spring.wcw.wcw.service.WcwService;

@Controller
public class WcwController {
	
	@Autowired
	private WcwService wcwservice;
	
	// wcw 전용 로그인 페이지로 이동
	@GetMapping("/dp/login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("wcw/login");
		return mv;
	}
	
	// wcw 전용 로그인 기능
	@PostMapping("/dp/login.do")
	public ModelAndView loginDo(
			ModelAndView mv
			, HttpSession session
			, RedirectAttributes rttr
			, Wcw wcw) {
		Wcw loginResult = wcwservice.selectLogin(wcw);
		
		// 값이 없으면
		if(loginResult == null) {
			System.out.println("로그인 실패");
			rttr.addFlashAttribute("msg", "로그인 실패. 아이디와 비밀번호를 확인해 주세요.");
			mv.setViewName("redirect:/dp/login");
		// 값이 있으면
		} else {
			System.out.println("로그인 성공");
			session.setAttribute("WcwSSinfo", loginResult);
			
			// 모든 회사 정보 가져오기
			List<Company> companyList = wcwservice.selectCompanyList();
			
			mv.addObject("companyList", companyList);
			mv.setViewName("wcw/wcwMain");
		}
		return mv;
	}
	
	// 메인 페이지로 이동
	@GetMapping("/dp/main")
	public ModelAndView readMain(
			ModelAndView mv
			, HttpSession session
			, RedirectAttributes rttr) {
		if(session.getAttribute("WcwSSinfo") == null) {
			rttr.addFlashAttribute("msg", "로그인 후 이용해 주세요.");
			mv.setViewName("redirect:/dp/login");
			return mv;
		}
		
		// 모든 회사 정보 가져오기
		List<Company> companyList = wcwservice.selectCompanyList();
		
		mv.addObject("companyList", companyList);
		mv.setViewName("wcw/wcwMain");
		return mv;
	}
	
	@PostMapping("/dp/updateCompany")
	@ResponseBody
	public int updateCompany(
			@RequestParam(name="cp_no") String cp_no
			, @RequestParam(name="type") String type
			, RedirectAttributes rttr) {
		
		int result = -1;
		// 회사 업데이트 (가입 승인 및 반려 처리)
		result = wcwservice.updateCompany(cp_no, type);
		
		return result;
	}
}
