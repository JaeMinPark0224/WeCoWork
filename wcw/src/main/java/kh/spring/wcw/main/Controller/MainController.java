package kh.spring.wcw.main.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.support.RequestPartServletServerHttpRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.company.service.CompanyService;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.employee.service.EmployeeService;

@Controller
public class MainController {
	
	@Autowired
	private EmployeeService EmployeeService;
	@Autowired
	private CompanyService CompanyService;
	
	// 메인 페이지로 이동
	@GetMapping("/")
	public ModelAndView mainController(ModelAndView mv
			, HttpSession session) {
		if(session.getAttribute("loginSSInfo") == null) {
			mv.setViewName("redirect:/login"); //TODO 첫화면 만들예정
			return mv;
		}
		mv.setViewName("main/main");
		return mv;
	}
	
	// 로그인 페이지로 이동
	@GetMapping("/login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("login/login");
		return mv;
	}
	
	// 로그인 기능
	@PostMapping("/login.do")
	public ModelAndView loginDo(
			ModelAndView mv
			, HttpSession session 
			, RedirectAttributes rttr
			, @RequestParam(name="email") String email
			, @RequestParam(name="pwd") String pwd) {
		Company result2 = null;
		
		// 직원 로그인
		Employee result = EmployeeService.selectEmployee(email, pwd);
		if(result == null) {
			// 회사 로그인
			result2 = CompanyService.selectCompany(email, pwd);
			if(result2 == null) {
				rttr.addFlashAttribute("msg", "로그인 실패. 입력값 확인 후 다시 시도해 주세요.");
				mv.setViewName("redirect:/login");
				return mv;
			}
			session.setAttribute("CompanySSinfo", result2);
			mv.setViewName("redirect:/"); //TODO 최고 관리자용 메인 페이지로 이동 예정
			return mv;
		}
		
		// 퇴사 했을 경우 로그인 불가
		if(result.getResign_yn() == "Y") {
			mv.setViewName("redirect:/login");
			return mv;
		// 퇴사하지 않았다면 로그인 가능
		} else {
			session.setAttribute("loginSSInfo", result);
			mv.setViewName("redirect:/");
			return mv;
		}
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public ModelAndView logout(
			ModelAndView mv
			, HttpSession session
			, HttpServletRequest request) {
		request.getSession().invalidate(); // 세션 초기화 - 로그아웃에서만 사용 권장
//		request.getSession().removeAttribute("loginSSInfo");
//		request.getSession().removeAttribute("CompanySSinfo");
		mv.setViewName("redirect:/");
		return mv;
	}
	
	// 비밀번호 찾기 페이지로 이동
	@GetMapping("/find/pwd")
	public ModelAndView findPwd(ModelAndView mv) {
		mv.setViewName("login/findPwd");
		return mv;
	}
	
	// 비밀번호 찾기 기능
	@PostMapping("find/pwd.do")
	public ModelAndView findPwdDo(
			ModelAndView mv
			, RedirectAttributes rttr
			, @RequestParam(name="cp") String cp_name
			, @RequestParam(name="email") String email
			, @RequestParam(name="name") String name) {
		
		String result = EmployeeService.selectEmployeePwd(cp_name, email, name);
		if(result == null) {
			rttr.addFlashAttribute("msg", "입력한 정보에 해당하는 비밀번호를 찾을 수 없습니다. 입력값 확인 후 다시 시도해 주세요.");
			mv.setViewName("redirect:/find/pwd");
			return mv;
		}
		mv.addObject("emailInfo", email);
		mv.addObject("pwdInfo", result);
		mv.setViewName("login/findPwdSC");
		return mv;
	}

	
}