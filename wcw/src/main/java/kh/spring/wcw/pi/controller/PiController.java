package kh.spring.wcw.pi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.dept.domain.Dept;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.hr.service.HrService;
import kh.spring.wcw.pi.service.PiService;

@Controller
@RequestMapping("/pi")
public class PiController {
	@Autowired
	private HrService hrService;
	@Autowired
	private PiService piService;
	
	@GetMapping("/chart")
	public ModelAndView viewChart(ModelAndView mv
			, HttpSession session
			) {
		Employee loginInfo = (Employee)session.getAttribute("loginSSInfo");
		int cp_no = loginInfo.getCp_no();
		
		List<Dept> upperDeptList = piService.selectUpperDept(cp_no);
		List<Dept> hasUpperDeptList = piService.selectHasUpperDept(cp_no);
		List<Dept> noUpperDeptList = piService.selectNoUpperDept(cp_no);
		List<Dept> empDeptList = piService.selectEmployeeDept(cp_no);
		
		mv.addObject("upperDeptList", upperDeptList);
		mv.addObject("hasUpperDeptList", hasUpperDeptList);
		mv.addObject("noUpperDeptList", noUpperDeptList);
		mv.addObject("empDeptList", empDeptList);
		
		mv.setViewName("pi/chart");
		return mv;
	}
	@GetMapping("/employeeList")
	public ModelAndView viewEmployeelist(ModelAndView mv
			, HttpSession session
			, @RequestParam(name="page", required = false) String page
			, @RequestParam(name="option", required = false, defaultValue = "date") String selectVal
			, @RequestParam(name="list", required = false) List<Employee> list
			) {
		int currentPage = 1; // 현재 페이지
		int cotentLimit = 15; // 한 페이지에 보여질 직원 정보 갯수
		
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
		
		// 직원 리스트 (size 측정용)
		List<Employee> totalList = hrService.selectEmployeeList(cp_no);
		
		int totalpageCnt = totalList.size()/cotentLimit + 1;
		int startPage = currentPage - (((currentPage % 5) == 0)?4:((currentPage % 5)-1)); 
		int endPage = ((startPage + 4) > totalpageCnt)?totalpageCnt:(startPage + 4);
		
		// 직원 리스트
		list = hrService.selectEmployeeListFilter(selectVal, rowBounds, cp_no);
		
		mv.addObject("option", selectVal);
		mv.addObject("totalpageCnt", totalpageCnt);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("employeeList", list);
		mv.setViewName("pi/employeeList");
		return mv;
	}
}
