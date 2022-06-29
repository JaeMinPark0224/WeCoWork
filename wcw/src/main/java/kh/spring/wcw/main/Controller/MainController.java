package kh.spring.wcw.main.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	@GetMapping("/")
	public ModelAndView mainController(ModelAndView mv) {
		mv.setViewName("main/main");
		return mv;
	}
	
	@GetMapping("/login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("login/login");
		return mv;
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String loginDo(
			HttpSession session 
			, @RequestParam(name="email") String email
			, @RequestParam(name="pwd") String pwd) {
		Company result2 = null;
		
		Employee result = EmployeeService.selectEmployee(email, pwd);
		if(result == null) {
			result2 = CompanyService.selectCompany(email, pwd);
			session.setAttribute("CompanySSinfo", result2);
			return "redirect:/";
		}
		session.setAttribute("loginSSInfo", result);
		return "redirect:/";
	}
	
	
	
	@GetMapping("/find/pwd")
	public ModelAndView findPwd(ModelAndView mv) {
		mv.setViewName("login/findPwd");
		return mv;
	}

	
}