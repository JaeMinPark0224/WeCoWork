package kh.spring.wcw.project.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.spring.wcw.common.WCWUtill;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.project.domain.Project;
import kh.spring.wcw.project.model.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired
	private WCWUtill wcwutill;
	
	@Autowired
	private ServletContext context;
	
	@Autowired
	private ProjectService service;
	
	@Autowired
	private Project projectObj;
	
	@GetMapping("/list")
	public ModelAndView selectProject(
			ModelAndView mv
			,HttpSession session) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		int emp_no = ((Employee)session.getAttribute("loginSSInfo")).getEmp_no();
		List<Project> projectList = service.selectListProject(emp_no);
		logger.info("projectList : {}", projectList);
		mv.addObject("projectList", projectList);
		mv.setViewName("project/list");
		return mv;
	}
	
	@GetMapping("/main")
	public ModelAndView readProject(
			ModelAndView mv
			, @RequestParam int project
			, HttpSession session
			) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		projectObj.setEmp_no(loginSSInfo.getEmp_no());
		projectObj.setPr_no(project);
		logger.info("stage1");
		if(service.selectEmpProject(projectObj) == null) {
			logger.info("stage2");
			mv.setViewName("redirect:/project/list");
			return mv;
		}
		mv.addObject("project", service.selectProject(project));
		mv.setViewName("project/main");
		return mv;
	}
	
	@GetMapping("/insert")
	public ModelAndView insertProject(
			ModelAndView mv
			, HttpSession session
			) {
		Employee loginSSInfo = (Employee)session.getAttribute("loginSSInfo");
		if(loginSSInfo == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		mv.setViewName("project/insert");
		return mv;
	}
	
	@PostMapping("/insert.do")
	public ModelAndView insertDoProject(
			ModelAndView mv
			, Project project
			, HttpSession session
			) {
		Employee loginSSInfo = (Employee)session.getAttribute("loginSSInfo");
		if(loginSSInfo == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		project.setEmp_no(loginSSInfo.getEmp_no());
		int result = service.insertProject(project);
		
		mv.setViewName("redirect:/project/list");
		return mv;
	}
	
	@GetMapping("/board/list")
	public ModelAndView selectBoardProject(
			ModelAndView mv
			, HttpSession session
			, @RequestParam int project
			) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		projectObj.setPb_no(project);
		projectObj.setEmp_no(loginSSInfo.getEmp_no());
		List<Project> boardList = service.selectListBoardProject(projectObj);
		List<Project> boardFixList = service.selectListBoardFixProject(projectObj);
		mv.addObject("pr_no", project);
		mv.addObject("boardList", boardList);
		mv.addObject("boardFixList", boardFixList);
		mv.setViewName("project/board/list");
		return mv;
	}
	
	@GetMapping("/board/insert")
	public ModelAndView insertBoardProject(
			ModelAndView mv
			, HttpSession session
			, @RequestParam int project
			) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		mv.addObject("pr_no", project);
		mv.setViewName("project/board/insert");
		return mv;
	}
	
	@PostMapping("/board/insert.do")
	public ModelAndView insertDoBoardProject(
			ModelAndView mv
			, HttpSession session
			, Project project
			) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		project.setEmp_no(loginSSInfo.getEmp_no());
		int result = service.insertDoBoardProject(project);
		mv.setViewName("redirect:/project/board/list?project="+project.getPr_no());
		return mv;
	}
	@GetMapping("/board/read")
	public ModelAndView readBoardProject(
			ModelAndView mv
			, HttpSession session
			, @RequestParam(required = false , defaultValue = "0") int project
			, @RequestParam(required = false , defaultValue = "0") int no
			) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		if(project == 0 || no == 0) {
			mv.setViewName("redirect:/project/list");
			return mv;
		}
		
		projectObj = service.selectOneBoardProject(no);
		mv.addObject("project", projectObj);
		mv.addObject("pr_no", project);
		mv.setViewName("project/board/read");
		return mv;
	}
	
	@GetMapping("/work/list")
	public ModelAndView selectWorkProject(ModelAndView mv) {
		mv.setViewName("project/work/list");
		return mv;
	}
	
	@GetMapping("/work/read")
	public ModelAndView readWorkProject(ModelAndView mv) {
		mv.setViewName("project/work/read");
		return mv;
	}
	
	@GetMapping("/todo/list")
	public ModelAndView selectTodoProject(
			ModelAndView mv
			, @RequestParam int project
			) {
		mv.setViewName("project/todo/list");
		return mv;
	}
	
	@GetMapping("/calendar/list")
	public ModelAndView selectCalendarProject(ModelAndView mv) {
		mv.setViewName("project/calendar/list");
		return mv;
	}
	
	@GetMapping("/file/list")
	public ModelAndView selectFileProject(ModelAndView mv) {
		mv.setViewName("project/file/list");
		return mv;
	}
	
	@GetMapping("/participant/list")
	public ModelAndView selectParticipantProject(ModelAndView mv) {
		mv.setViewName("project/participant/list");
		return mv;
	}
	
	@PostMapping("/participant/read")
	@ResponseBody
	public String selectOneParticipantProject(
			@RequestParam int pr_no
			, HttpSession session
			) {
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		if(loginSSInfo == null) {
			return "0";
		}
		projectObj.setPr_no(pr_no);
		projectObj.setEmp_no(loginSSInfo.getEmp_no());
		int result = 0;
		if(service.selectEmpProject(projectObj) == null) {
			result = 0;
		} else {
			result = 1;
		}
		return String.valueOf(result);
	}
	
	@PostMapping("/favorite/insert")
	@ResponseBody
	public String insertFavoriteProject(
			Project project,
			HttpSession session
			) {
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		int emp_no = loginSSInfo.getEmp_no();
		project.setEmp_no(emp_no);
		int result = service.insertFavoriteProject(project);
		if(result == 1) {
			return String.valueOf(project.getPr_no());
		}
		return "0";
	}
	
	@PostMapping("/favorite/delete")
	@ResponseBody
	public String deleteFavoriteProject(
			Project project,
			HttpSession session
			) {
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		int emp_no = loginSSInfo.getEmp_no();
		project.setEmp_no(emp_no);
		int result = service.deleteFavoriteProject(project);
		if(result == 1) {
			return String.valueOf(project.getPr_no());
		}
		return "0";
	}
	
	@PostMapping("/board/fix/insert")
	@ResponseBody
	public String insertFixBoardProject(
			HttpSession session
			, @RequestParam int pb_no
			) {
		if(!wcwutill.loginChk(session)) {
			return "0";
		}
		Employee loginSSInfo= (Employee) session.getAttribute("loginSSInfo");
		projectObj.setPb_no(pb_no);
		projectObj.setEmp_no(loginSSInfo.getEmp_no());
		int result = service.insertBoardFixProject(projectObj);
		return String.valueOf(result);
	}
	
	@PostMapping("/board/fix/delete")
	@ResponseBody
	public String deleteFixBoardProject(
			HttpSession session
			, @RequestParam int pb_no
			) {
		if(!wcwutill.loginChk(session)) {
			return "0";
		}
		Employee loginSSInfo= (Employee) session.getAttribute("loginSSInfo");
		projectObj.setPb_no(pb_no);
		projectObj.setEmp_no(loginSSInfo.getEmp_no());
		int result = service.deleteBoardFixProject(projectObj);
		return String.valueOf(result);
	}
	
	@PostMapping("/board/fix/select")
	@ResponseBody
	public String selectFixBoardProject(
			HttpSession session
			, @RequestParam int pr_no
			) {
		if(!wcwutill.loginChk(session)) {
			return "0";
		}
		Employee loginSSInfo= (Employee) session.getAttribute("loginSSInfo");
		projectObj.setEmp_no(loginSSInfo.getEmp_no());
		projectObj.setPr_no(pr_no);
		List<Project> boardFixList = service.selectListBoardFixProject(projectObj);
		Gson gson = new GsonBuilder().setPrettyPrinting().setDateFormat("YYYY-MM-dd").create();
		String result = gson.toJson(boardFixList);
		return result;
	}
	
}
