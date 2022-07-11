package kh.spring.wcw.vacation.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Vacation {
//	VACA_NO            NOT NULL VARCHAR2        
//	EMP_NO             NOT NULL NUMBER        
//	VACA_SORT          NOT NULL VARCHAR2(1)   
//	VACA_START         NOT NULL DATE          
//	VACA_END           NOT NULL DATE          
//	VACA_CNT           NOT NULL NUMBER        
//	VACA_COMMENT       NOT NULL VARCHAR2(300) 
//	VACA_REQ_DATE      NOT NULL DATE          
//	VACA_CONFIRM       NOT NULL NUMBER        
//	VACA_APPROVER      NOT NULL NUMBER    
	
//	AL_NO            NOT NULL NUMBER 
//	EMP_NO           NOT NULL NUMBER 
//	AL_YEAR          NOT NULL NUMBER 
//	AL_COUNT         NOT NULL NUMBER 
//	AL_USE_DAYS      NOT NULL NUMBER 
//	AL_REGISTER_DATE NOT NULL DATE   
	
	private String vaca_no;
	private int emp_no;
	private String vaca_sort;
	private Date vaca_start;
	private Date vaca_end;
	private double vaca_cnt;
	private String vaca_comment;
	private Date vaca_req_date;
	private int vaca_approver;   //사원번호
	private String vaca_allday;
	
	private String al_no;
	private String al_year;
	private int al_count;
	private int al_use_Days;
	private Date al_register_Date;
	@Override
	public String toString() {
		return "Vacation [vaca_no=" + vaca_no + ", emp_no=" + emp_no + ", vaca_sort=" + vaca_sort + ", vaca_start="
				+ vaca_start + ", vaca_end=" + vaca_end + ", vaca_cnt=" + vaca_cnt + ", vaca_comment=" + vaca_comment
				+ ", vaca_req_date=" + vaca_req_date + ", vaca_approver=" + vaca_approver + ", vaca_allday="
				+ vaca_allday + ", al_no=" + al_no + ", al_year=" + al_year + ", al_count=" + al_count
				+ ", al_use_Days=" + al_use_Days + ", al_register_Date=" + al_register_Date + "]";
	}
	public Vacation() {
		super();
	}
	public String getVaca_no() {
		return vaca_no;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public String getVaca_sort() {
		return vaca_sort;
	}
	public Date getVaca_start() {
		return vaca_start;
	}
	public Date getVaca_end() {
		return vaca_end;
	}
	public double getVaca_cnt() {
		return vaca_cnt;
	}
	public String getVaca_comment() {
		return vaca_comment;
	}
	public Date getVaca_req_date() {
		return vaca_req_date;
	}
	public int getVaca_approver() {
		return vaca_approver;
	}
	public String getAl_no() {
		return al_no;
	}
	public String getAl_year() {
		return al_year;
	}
	public int getAl_count() {
		return al_count;
	}
	public int getAl_use_Days() {
		return al_use_Days;
	}
	public Date getAl_register_Date() {
		return al_register_Date;
	}
	public void setVaca_no(String vaca_no) {
		this.vaca_no = vaca_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public void setVaca_sort(String vaca_sort) {
		this.vaca_sort = vaca_sort;
	}
	public void setVaca_start(Date vaca_start) {
		this.vaca_start = vaca_start;
	}
	public void setVaca_end(Date vaca_end) {
		this.vaca_end = vaca_end;
	}
	public void setVaca_cnt(double vaca_cnt) {
		this.vaca_cnt = vaca_cnt;
	}
	public void setVaca_comment(String vaca_comment) {
		this.vaca_comment = vaca_comment;
	}
	public void setVaca_req_date(Date vaca_req_date) {
		this.vaca_req_date = vaca_req_date;
	}
	public void setVaca_approver(int vaca_approver) {
		this.vaca_approver = vaca_approver;
	}
	public void setAl_no(String al_no) {
		this.al_no = al_no;
	}
	public void setAl_year(String al_year) {
		this.al_year = al_year;
	}
	public void setAl_count(int al_count) {
		this.al_count = al_count;
	}
	public void setAl_use_Days(int al_use_Days) {
		this.al_use_Days = al_use_Days;
	}
	public void setAl_register_Date(Date al_register_Date) {
		this.al_register_Date = al_register_Date;
	}
	public String getVaca_allday() {
		return vaca_allday;
	}
	public void setVaca_allday(String vaca_allday) {
		this.vaca_allday = vaca_allday;
	}
	
	
	
}
