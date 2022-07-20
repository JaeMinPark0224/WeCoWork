package kh.spring.wcw.vacation.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.vacation.domain.Vacation;
import kh.spring.wcw.vacation.model.service.VacationService;

@Controller
@RequestMapping("/vacation")
public class VacationController {


	@Autowired
	private VacationService service;
	
	@GetMapping("")
	public ModelAndView viewVacation(ModelAndView mv) {
		mv.setViewName("vacation/vacation");
		return mv;
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public String insertVacation(Vacation vacation
			, HttpSession session
			, @RequestParam(name="vacation_req_date") String vacation_req_date
			, @RequestParam(name="vacation_start") String vacation_start
			, @RequestParam(name="vacation_end") String vacation_end
			, @RequestParam(name="vaca_select") String vaca_select
			, @RequestParam(name="vacation_text") String vacation_text
			, @RequestParam(name="vaca_select_allday") String vaca_select_allday
			) {
		Employee loginSSInfo = (Employee)session.getAttribute("loginSSInfo");
		Date vacation_req_date_d = Date.valueOf(vacation_req_date);
		Date vacation_start_d = Date.valueOf(vacation_start);
		Date vacation_end_d = Date.valueOf(vacation_end);
		vacation.setEmp_no(loginSSInfo.getEmp_no());
		vacation.setVaca_req_date(vacation_req_date_d);
		vacation.setVaca_start(vacation_start_d);
		vacation.setVaca_end(vacation_end_d);
		vacation.setVaca_sort(vaca_select);
		vacation.setVaca_comment(vacation_text);
		vacation.setVaca_allday(vaca_select_allday);
		try {
			// Convert `String` to `Date`
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			    java.util.Date dateBefore = sdf.parse(vacation_start);
			    java.util.Date dateAfter = sdf.parse(vacation_end);

			// Calculate the number of days between dates
			    long timeDiff = Math.abs(dateAfter.getTime() - dateBefore.getTime());
			    double daysDiff = TimeUnit.DAYS.convert(timeDiff, TimeUnit.MILLISECONDS);
			    if(vaca_select_allday.equals("1")) {
			    	vacation.setVaca_cnt(daysDiff+1);
			    } else {
			    	vacation.setVaca_cnt(daysDiff+0.5);
			    }
			    System.out.println("The number of days between dates: " + daysDiff);
			}catch(Exception e){
			    e.printStackTrace();
			}
		
		
		int result = service.insertVacation(vacation);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/select", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectVacation(
			Vacation vacation
			, HttpSession session
			, @RequestParam(name="year_select") String year_select
			, @RequestParam(name="vaca_confirm") String vaca_confirm
			, @RequestParam(name="vaca_sort") String vaca_sort
			) {
		Employee loginSSInfo = (Employee)session.getAttribute("loginSSInfo");
		vacation.setEmp_no(loginSSInfo.getEmp_no());
		vacation.setVu_year(year_select);
		vacation.setVaca_confirm(vaca_confirm);
		vacation.setVaca_sort(vaca_sort);
		List<Vacation> result = service.selectVacation(vacation);
		Gson gsonObj = new GsonBuilder().setDateFormat("yyyy-MM-dd' / 'HH:mm:ss").serializeNulls().create();
		
		return gsonObj.toJson(result);
	}
	
}
