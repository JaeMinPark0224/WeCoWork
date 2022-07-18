package kh.spring.wcw.project.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.spring.wcw.common.WCWUtill;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.project.domain.Project;
import kh.spring.wcw.project.model.service.ProjectService;
import oracle.jdbc.proxy.annotation.Pre;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired
	private WCWUtill wcwutill;
	
	@Autowired
	private ProjectService service;
	
	@Autowired
	private Project projectObj;
	
	@GetMapping("/list")
	public ModelAndView selectListProject(
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
	public ModelAndView selectOneProject(
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
		projectObj = service.selectProject(project);
		mv.addObject("project", service.selectProject(project));
		mv.addObject("pr_no", projectObj.getPr_no());
		mv.setViewName("project/main");
		return mv;
	}
	
	@GetMapping("/insert")
	public ModelAndView insertProject(
			ModelAndView mv
			, HttpSession session
			) {
		if(!wcwutill.loginChk(session)) {
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
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		Employee loginSSInfo = (Employee)session.getAttribute("loginSSInfo");
		project.setEmp_no(loginSSInfo.getEmp_no());
		int result = service.insertProject(project);
		
		mv.setViewName("redirect:/project/list");
		return mv;
	}
	
	@GetMapping("/board/list")
	public ModelAndView selectListBoardProject(
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
		List<Project> noticeList = service.selectListNoticeProject(projectObj);
		List<Project> boardList = service.selectListBoardProject(projectObj);
		List<Project> boardFixList = service.selectListBoardFixProject(projectObj);
		mv.addObject("pr_no", project);
		mv.addObject("noticeList", noticeList);
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
	public ModelAndView selectOneBoardProject(
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
	public ModelAndView selectListWorkProject(
			ModelAndView mv
			, HttpSession session
			, @RequestParam(name = "project", defaultValue = "0") int pr_no
			) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		projectObj.setEmp_no(loginSSInfo.getEmp_no());
		projectObj.setPr_no(pr_no);
		if(service.selectEmpProject(projectObj) == null) {
			mv.setViewName("redirect:/project/list");
			return mv;
		}
		
		List<Project> workList = service.selectListWorkProject(projectObj);
		
		// 프로젝트 번호 저장
		mv.addObject("pr_no", pr_no);
		// 업무 리스트 저장
		mv.addObject("workList", workList);
		// 프로젝트 업무 list 페이지 이동
		mv.setViewName("project/work/list");
		return mv;
	}
	
	@GetMapping("/work/read")
	public ModelAndView selectOneWorkProject(
			ModelAndView mv
			, HttpSession session
			, @RequestParam(name = "project", defaultValue = "0") int pr_no
			, @RequestParam(name = "no", defaultValue = "0") int pw_no
			) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		projectObj.setEmp_no(loginSSInfo.getEmp_no());
		projectObj.setPr_no(pr_no);
		if(service.selectEmpProject(projectObj) == null) {
			mv.setViewName("redirect:/project/list");
			return mv;
		}
		
		Project result = service.selectOneWorkProject(pw_no);
		List<Project> workerList = service.selectListWorkEmpProject(pw_no);
		List<Project> subWorkList = service.selectListSubWorkProject(pw_no);
		mv.addObject("work", result);
		mv.addObject("workerList", workerList);
		mv.addObject("subWorkList", subWorkList);
		mv.setViewName("project/work/read");
		return mv;
	}
	
	@GetMapping("/work/insert")
	public ModelAndView insertWorkProject(
			ModelAndView mv
			, HttpSession session
			, @RequestParam(name = "project", defaultValue = "0") int pr_no
			, @RequestParam(name = "no", required = false) String pwNoStr
			, Project project
			) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		if(pwNoStr != null) {
			mv.addObject("ref_pw_no", pwNoStr);
		}
		mv.setViewName("project/work/insert");
		return mv;
	}
	
	@PostMapping("/work/insert.do")
	public ModelAndView insertDoWorkProject(
			ModelAndView mv
			, RedirectAttributes rttr
			, HttpSession session
			, Project project
			, @RequestParam(name = "pw_start_date_str") String pwStartDateStr
			, @RequestParam(name = "pw_end_date_str") String pwEndDateStr
			, @RequestParam(name = "empNoList") List<String> empNoList
			) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		LocalDateTime localDateTime = LocalDateTime.from(dateFormat.parse(pwStartDateStr));
		Timestamp tsStart = Timestamp.valueOf(localDateTime);
		localDateTime = LocalDateTime.from(dateFormat.parse(pwEndDateStr));
		Timestamp tsEnd = Timestamp.valueOf(localDateTime);
		project.setPw_start_date(tsStart);
		project.setPw_end_date(tsEnd);
		project.setEmp_no(loginSSInfo.getEmp_no());
		project.setEmpNoList(empNoList);
		service.insertWorkProject(project);
		rttr.addAttribute("project", project.getPr_no());
		mv.setViewName("redirect:/project/work/list");
		return mv;
	}
	
	@GetMapping("/todo/list")
	public ModelAndView selectTodoProject(
			ModelAndView mv
			, @RequestParam(name = "project") int pr_no
			, HttpSession session
			, Project project
			) {
		
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		
		SimpleDateFormat todayFormat = new SimpleDateFormat("yyyy-MM-dd");
		String todayStr = todayFormat.format(new Date());
		
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-ddHH:mm:ss");
		LocalDateTime local_pt_date = LocalDateTime.from(dateFormat.parse(todayStr+"00:00:00"));
		Timestamp pt_date = Timestamp.valueOf(local_pt_date);
		project.setPt_date(pt_date);
		project.setPr_no(pr_no);
		project.setEmp_no(loginSSInfo.getEmp_no());
		List<Project> todoList = service.selectListTodoProject(project);
		mv.addObject("today", todayStr);
		mv.addObject("todoList", todoList);
		mv.setViewName("project/todo/list");
		return mv;
	}
	
	@PostMapping("/todo/list")
	@ResponseBody
	public String selectAjaxTodoProject(
			ModelAndView mv
			, HttpSession session
			, Project project
			, @RequestParam String pt_date_year
			) {
		
		if(!wcwutill.loginChk(session)) {
			return "-1";
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		
		
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-ddHH:mm:ss");
		LocalDateTime local_pt_date = LocalDateTime.from(dateFormat.parse(pt_date_year+"00:00:00"));
		Timestamp pt_date = Timestamp.valueOf(local_pt_date);
		project.setPt_date(pt_date);
		project.setEmp_no(loginSSInfo.getEmp_no());
		List<Project> todoList = service.selectListTodoProject(project);
		Gson gson = new GsonBuilder().setPrettyPrinting().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		return gson.toJson(todoList);
	}
	
	@PostMapping("/todo/insert")
	@ResponseBody
	public String insertTodoProject(
			ModelAndView mv
			, Project project
			, @RequestParam String pt_date_year
			, @RequestParam String pt_date_hour_minute
			, HttpSession session
			) {
		
		if(!wcwutill.loginChk(session)) {
			return "-1";
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		project.setEmp_no(loginSSInfo.getEmp_no());
		
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-ddHH:mm");
		LocalDateTime local_pt_date = LocalDateTime.from(dateFormat.parse(pt_date_year+pt_date_hour_minute));
		Timestamp pt_date = Timestamp.valueOf(local_pt_date);
		project.setPt_date(pt_date);
		int result = service.insertTodoProject(project);
		return String.valueOf(result);
	}
	
	@PostMapping("/todo/update")
	@ResponseBody
	public String updateTodoProject(
			ModelAndView mv
			, Project project
			, HttpSession session
			) {
		
		if(!wcwutill.loginChk(session)) {
			return "-1";
		}
		int result = service.updateTodoProject(project);
		return String.valueOf(result);
	}
	
	@GetMapping("/calendar/list")
	public ModelAndView selectListCalendarProject(
			ModelAndView mv
			, HttpSession session
			, Project project
			, @RequestParam(name = "project") int pr_no
			) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		project.setEmp_no(loginSSInfo.getEmp_no());
		project.setPr_no(pr_no);
		
		if(service.selectEmpProject(project) == null) {
			mv.setViewName("redirect:/project/list");
			return mv;
		}
		
		List<Project> calendarMyList = service.selectListCalendarProject(project);
		project.setEmp_no(0);
		List<Project> calendarAllList = service.selectListCalendarProject(project);
		mv.addObject("calendarMyList", calendarMyList);
		mv.addObject("calendarAllList", calendarAllList);
		mv.setViewName("project/calendar/list");
		return mv;
	}
	
	@GetMapping("/file/list")
	public ModelAndView selectFileProject(
			ModelAndView mv
			, HttpSession session
			, @RequestParam(name = "project") int pr_no
			) {
		
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		int emp_no = loginSSInfo.getEmp_no();
		projectObj.setEmp_no(emp_no);
		projectObj.setPr_no(pr_no);
		if(service.selectEmpProject(projectObj) == null) {
			mv.setViewName("redirect:/project/list");
			return mv;
		}
		
		List<Project> folderList = service.selectListFolderProject(pr_no);
		
		mv.addObject("folderList", folderList);
		mv.setViewName("project/file/list");
		return mv;
	}
	
	@PostMapping("/folder/insert")
	@ResponseBody
	public String insertFolerProject(
			HttpSession session
			, @RequestParam int pr_no
			, @RequestParam(required = false) String root
			, Project project
			) {
		if(!wcwutill.loginChk(session)) {
			return "-1";
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		int emp_no = loginSSInfo.getEmp_no();
		projectObj.setEmp_no(emp_no);
		projectObj.setPr_no(pr_no);
		if(service.selectEmpProject(projectObj) == null) {
			return "-2";
		}
		
		if(root != null && root.equals("true")) {
			project.setPr_no(pr_no);
			project.setPff_name("ROOT");
			project.setPff_ref(0);
			project.setPff_level(0);
			project.setPff_order(0);
			int result = service.insertFolderProject(project);
			return String.valueOf(result);
		}
		else if(root == null) {
			int result = service.insertFolderProject(project);
			return String.valueOf(result);
		}
		
		return "100";
	}
	
	@PostMapping("/folder/list")
	@ResponseBody
	public String selectListAjaxFolerProject(
			HttpSession session
			, @RequestParam int pr_no
			, @RequestParam(required = false) String root
			, Project project
			) {
		if(!wcwutill.loginChk(session)) {
			return "-1";
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		int emp_no = loginSSInfo.getEmp_no();
		projectObj.setEmp_no(emp_no);
		projectObj.setPr_no(pr_no);
		if(service.selectEmpProject(projectObj) == null) {
			return "-2";
		}
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		return gson.toJson(service.selectListFolderProject(pr_no));
	}
	
	@PostMapping("/folder/update")
	@ResponseBody
	public String updateFolerProject(
			HttpSession session
			, @RequestParam int pr_no
			, Project project
			) {
		if(!wcwutill.loginChk(session)) {
			return "-1";
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		int emp_no = loginSSInfo.getEmp_no();
		projectObj.setEmp_no(emp_no);
		projectObj.setPr_no(pr_no);
		if(service.selectEmpProject(projectObj) == null) {
			return "-2";
		}
		service.updateFolderProject(project);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		return gson.toJson(service.selectListFolderProject(pr_no));
	}
	
	
	@GetMapping("/participant/list")
	public ModelAndView selectListParticipantProject(
			ModelAndView mv
			, HttpSession session
			, @RequestParam(name = "project", defaultValue = "0") int pr_no
			) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		int emp_no = loginSSInfo.getEmp_no();
		projectObj.setEmp_no(emp_no);
		projectObj.setPr_no(pr_no);
		if(service.selectEmpProject(projectObj) == null) {
			mv.setViewName("redirect:/project/list");
			return mv;
		}
		
		List<Project> participantAList = service.selectListParticipantProject(pr_no, "A");
		List<Project> participantBList = service.selectListParticipantProject(pr_no, "B");
		List<String> deptAList = service.selectListDeptProject(pr_no, "A");
		List<String> deptBList = service.selectListDeptProject(pr_no, "B");
		
		String pr_emp_authority = null;
		
		for(int i = 0; i < participantAList.size(); i++) {
			if(participantAList.get(i).getEp_no() == emp_no) {
				pr_emp_authority = participantAList.get(i).getPr_emp_authority();
			}
		}
		
		for(int i = 0; i < participantBList.size(); i++) {
			if(participantBList.get(i).getEp_no() == emp_no) {
				pr_emp_authority = participantBList.get(i).getPr_emp_authority();
			}
		}
		mv.addObject("pr_emp_authority", pr_emp_authority);
		mv.addObject("deptAList", deptAList);
		mv.addObject("deptBList", deptBList);
		mv.addObject("participantAList", participantAList);
		mv.addObject("participantBList", participantBList);
		mv.setViewName("project/participant/list");
		return mv;
	}
	
	@PostMapping("/participant/list")
	@ResponseBody
	public String selectListAjaxParticipantProject(
			HttpSession session
			, @RequestParam int pr_no
			, @RequestParam String authority
			) {
		if(!wcwutill.loginChk(session)) {
			return "0";
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		int emp_no = loginSSInfo.getEmp_no();
		projectObj.setEmp_no(emp_no);
		projectObj.setPr_no(pr_no);
		if(service.selectEmpProject(projectObj) == null) {
			return "0";
		}
		List<Project> participantList = null;
		List<String> deptList = null;
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		participantList = service.selectListParticipantProject(pr_no, authority);
		deptList = service.selectListDeptProject(pr_no, authority);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("participantList", participantList);
		map.put("deptList", deptList);
		String result = gson.toJson(map);
		return result;
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
	
	@PostMapping("/participant/insert")
	@ResponseBody
	public String insertParticipantProject(
			ModelAndView mv
			, HttpSession session
			, @RequestParam int pr_no
			, @RequestParam(defaultValue = "0") int emp_no
			) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return "0";
		}
		projectObj.setPr_no(pr_no);
		if(emp_no == 0) {
			Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
			projectObj.setEmp_no(loginSSInfo.getEmp_no());
		} else {
			projectObj.setEmp_no(emp_no);
		}
		int result = service.insertParticipantProject(projectObj);
		return String.valueOf(result);
	}
	
	@PostMapping("/participant/delete")
	@ResponseBody
	public String deleteParticipantProject(
			ModelAndView mv
			, HttpSession session
			, Project project
			) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return "0";
		}
		int result = service.deleteParticipantProject(project);		
		
		return String.valueOf(result);
	}
	
	@PostMapping("/participant/update")
	@ResponseBody
	public String updateParticipantProject(
			ModelAndView mv
			, HttpSession session
			, Project project
			) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return "0";
		}
		int result = service.updateParticipantProject(project);
		
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
	
	@GetMapping("/notice/insert")
	public ModelAndView	insertNoticeProject(
			ModelAndView mv
			, HttpSession session
			, @RequestParam int project
			) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		mv.addObject("pr_no", project);
		mv.setViewName("project/notice/insert");
		return mv;
	}
	
	@PostMapping("/notice/insert.do")
	public ModelAndView	insertDoNoticeProject(
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
		int result = service.insertNoticeProject(project);
		mv.setViewName("redirect:/project/board/list?project="+project.getPr_no());
		return mv;
	}
	
	@GetMapping("/notice/read")
	public ModelAndView	selectListNoticeProject(
			ModelAndView mv
			, HttpSession session
			, Project project
			, @RequestParam(name = "project", defaultValue = "0") int pr_no
			, @RequestParam(name = "no", defaultValue = "0") int pn_no
			) {
		if(!wcwutill.loginChk(session)) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		Employee loginSSInfo = (Employee) session.getAttribute("loginSSInfo");
		project.setEmp_no(loginSSInfo.getEmp_no());
		project.setPn_no(pn_no);
		Project result = service.selectOneNoticeProject(project);
		mv.addObject("pr_no", pr_no);
		mv.addObject("notice", result);
		mv.setViewName("project/notice/read");
		return mv;
	}
	
}
