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
	
//	VU_NO            NOT NULL VARCHAR2(20) 
//	EMP_NO           NOT NULL NUMBER       
//	VU_YEAR          NOT NULL NUMBER       
//	VU_COUNT         NOT NULL NUMBER       
//	VU_USE_DAYS      NOT NULL NUMBER       
//	VU_REGISTER_DATE NOT NULL DATE         
//	VACA_SORT        NOT NULL VARCHAR2(1)   
	
	private String vaca_no;
	private int emp_no;
	private String vaca_sort;
	private Date vaca_start;
	private Date vaca_end;
	private double vaca_cnt;
	private String vaca_comment;
	private Date vaca_req_date;
	private String vaca_confirm;
	private int vaca_approver;   //사원번호
	private String vaca_allday;
	
	private String vu_no;
	private String vu_year;
	private int vu_count;
	private int vu_use_Days;
	private Date vu_register_Date;
	@Override
	public String toString() {
		return "Vacation [vaca_no=" + vaca_no + ", emp_no=" + emp_no + ", vaca_sort=" + vaca_sort + ", vaca_start="
				+ vaca_start + ", vaca_end=" + vaca_end + ", vaca_cnt=" + vaca_cnt + ", vaca_comment=" + vaca_comment
				+ ", vaca_req_date=" + vaca_req_date + ", vaca_confirm=" + vaca_confirm + ", vaca_approver="
				+ vaca_approver + ", vaca_allday=" + vaca_allday + ", vu_no=" + vu_no + ", vu_year=" + vu_year
				+ ", vu_count=" + vu_count + ", vu_use_Days=" + vu_use_Days + ", vu_register_Date=" + vu_register_Date
				+ "]";
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
	public String getVaca_allday() {
		return vaca_allday;
	}
	public String getVu_no() {
		return vu_no;
	}
	public String getVu_year() {
		return vu_year;
	}
	public int getVu_count() {
		return vu_count;
	}
	public int getVu_use_Days() {
		return vu_use_Days;
	}
	public Date getVu_register_Date() {
		return vu_register_Date;
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
	public void setVaca_allday(String vaca_allday) {
		this.vaca_allday = vaca_allday;
	}
	public void setVu_no(String vu_no) {
		this.vu_no = vu_no;
	}
	public void setVu_year(String vu_year) {
		this.vu_year = vu_year;
	}
	public void setVu_count(int vu_count) {
		this.vu_count = vu_count;
	}
	public void setVu_use_Days(int vu_use_Days) {
		this.vu_use_Days = vu_use_Days;
	}
	public void setVu_register_Date(Date vu_register_Date) {
		this.vu_register_Date = vu_register_Date;
	}
	public String getVaca_confirm() {
		return vaca_confirm;
	}
	public void setVaca_confirm(String vaca_confirm) {
		this.vaca_confirm = vaca_confirm;
	}
	
	
}
