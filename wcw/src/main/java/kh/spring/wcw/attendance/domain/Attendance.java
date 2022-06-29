package kh.spring.wcw.attendance.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Attendance {

//	ATT_NO          NOT NULL NUMBER       
//	EMP_NO          NOT NULL NUMBER       
//	ATT_DATE        NOT NULL DATE         
//	ATT_CLOCK_IN    NOT NULL DATE         
//	ATT_CLOCK_OUT            DATE         
//	IP_CLOCK_IN     NOT NULL VARCHAR2(20) 
//	IP_CLOCK_OUT             VARCHAR2(20) 
//	ATT_MODIFY_DATE          DATE         
//	ATT_DELETE_YN            VARCHAR2(1)  
	
//	ATT_APPR_NO        NOT NULL VARCHAR2(255) 
//	ATT_NO             NOT NULL NUMBER        
//	EMP_NO                      NUMBER        
//	ATT_APPR_CONTENT   NOT NULL VARCHAR2(300) 
//	ATT_APPR_TYPE      NOT NULL VARCHAR2(1)   
//	ATT_APPR_CLOCK_IN  NOT NULL DATE          
//	ATT_APPR_CLOCK_OUT NOT NULL DATE          
	
	private int att_no;
	private int emp_no;
	private Date att_date;
	private Date att_clock_in;
	private Date att_clock_out;
	private String ip_clock_in;
	private String ip_clock_out;
	private Date att_modify_date;
	private String att_delete_yn;
	
	private String att_appr_no;
	private String att_appr_content;
	private String att_appr_type;
	private Date att_appr_clock_in;
	private Date att_appr_clock_out;
	
	@Override
	public String toString() {
		return "AttendanceDomain [att_no=" + att_no + ", emp_no=" + emp_no + ", att_date=" + att_date
				+ ", att_clock_in=" + att_clock_in + ", att_clock_out=" + att_clock_out + ", ip_clock_in=" + ip_clock_in
				+ ", ip_clock_out=" + ip_clock_out + ", att_modify_date=" + att_modify_date + ", att_delete_yn="
				+ att_delete_yn + ", att_appr_no=" + att_appr_no + ", att_appr_content=" + att_appr_content
				+ ", att_appr_type=" + att_appr_type + ", att_appr_clock_in=" + att_appr_clock_in
				+ ", att_appr_clock_out=" + att_appr_clock_out + "]";
	}
	public Attendance() {
		super();
	}
	public int getAtt_no() {
		return att_no;
	}
	public void setAtt_no(int att_no) {
		this.att_no = att_no;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public Date getAtt_date() {
		return att_date;
	}
	public void setAtt_date(Date att_date) {
		this.att_date = att_date;
	}
	public Date getAtt_clock_in() {
		return att_clock_in;
	}
	public void setAtt_clock_in(Date att_clock_in) {
		this.att_clock_in = att_clock_in;
	}
	public Date getAtt_clock_out() {
		return att_clock_out;
	}
	public void setAtt_clock_out(Date att_clock_out) {
		this.att_clock_out = att_clock_out;
	}
	public String getIp_clock_in() {
		return ip_clock_in;
	}
	public void setIp_clock_in(String ip_clock_in) {
		this.ip_clock_in = ip_clock_in;
	}
	public String getIp_clock_out() {
		return ip_clock_out;
	}
	public void setIp_clock_out(String ip_clock_out) {
		this.ip_clock_out = ip_clock_out;
	}
	public Date getAtt_modify_date() {
		return att_modify_date;
	}
	public void setAtt_modify_date(Date att_modify_date) {
		this.att_modify_date = att_modify_date;
	}
	public String getAtt_delete_yn() {
		return att_delete_yn;
	}
	public void setAtt_delete_yn(String att_delete_yn) {
		this.att_delete_yn = att_delete_yn;
	}
	public String getAtt_appr_no() {
		return att_appr_no;
	}
	public void setAtt_appr_no(String att_appr_no) {
		this.att_appr_no = att_appr_no;
	}
	public String getAtt_appr_content() {
		return att_appr_content;
	}
	public void setAtt_appr_content(String att_appr_content) {
		this.att_appr_content = att_appr_content;
	}
	public String getAtt_appr_type() {
		return att_appr_type;
	}
	public void setAtt_appr_type(String att_appr_type) {
		this.att_appr_type = att_appr_type;
	}
	public Date getAtt_appr_clock_in() {
		return att_appr_clock_in;
	}
	public void setAtt_appr_clock_in(Date att_appr_clock_in) {
		this.att_appr_clock_in = att_appr_clock_in;
	}
	public Date getAtt_appr_clock_out() {
		return att_appr_clock_out;
	}
	public void setAtt_appr_clock_out(Date att_appr_clock_out) {
		this.att_appr_clock_out = att_appr_clock_out;
	}
	
	

}
