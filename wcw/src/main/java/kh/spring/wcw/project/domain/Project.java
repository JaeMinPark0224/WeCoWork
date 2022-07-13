package kh.spring.wcw.project.domain;


import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Project {
	private int pr_no;
	private String pr_title;
	private String pr_content;
	private String pr_open_yn;
	private String pr_join_open;
	private Timestamp pr_date;
	private int cp_no;
	private String cp_name;
	private String pr_complete_yn;
	private int emp_no;
	private int pr_fav;
	private int pb_no;
	private String pb_title;
	private String pb_content;
	private Timestamp pb_date;
	private String name;
	private String job_title;
	private String dept_name;
	private String board_fix;
	private int pn_no;
	private String pn_title;
	private String pn_content;
	private Timestamp pn_date;
	public int getPr_no() {
		return pr_no;
	}
	public void setPr_no(int pr_no) {
		this.pr_no = pr_no;
	}
	public String getPr_title() {
		return pr_title;
	}
	public void setPr_title(String pr_title) {
		this.pr_title = pr_title;
	}
	public String getPr_content() {
		return pr_content;
	}
	public void setPr_content(String pr_content) {
		this.pr_content = pr_content;
	}
	public String getPr_open_yn() {
		return pr_open_yn;
	}
	public void setPr_open_yn(String pr_open_yn) {
		this.pr_open_yn = pr_open_yn;
	}
	public String getPr_join_open() {
		return pr_join_open;
	}
	public void setPr_join_open(String pr_join_open) {
		this.pr_join_open = pr_join_open;
	}
	public Timestamp getPr_date() {
		return pr_date;
	}
	public void setPr_date(Timestamp pr_date) {
		this.pr_date = pr_date;
	}
	public int getCp_no() {
		return cp_no;
	}
	public void setCp_no(int cp_no) {
		this.cp_no = cp_no;
	}
	public String getCp_name() {
		return cp_name;
	}
	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}
	public String getPr_complete_yn() {
		return pr_complete_yn;
	}
	public void setPr_complete_yn(String pr_complete_yn) {
		this.pr_complete_yn = pr_complete_yn;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getPr_fav() {
		return pr_fav;
	}
	public void setPr_fav(int pr_fav) {
		this.pr_fav = pr_fav;
	}
	public int getPb_no() {
		return pb_no;
	}
	public void setPb_no(int pb_no) {
		this.pb_no = pb_no;
	}
	public String getPb_title() {
		return pb_title;
	}
	public void setPb_title(String pb_title) {
		this.pb_title = pb_title;
	}
	public String getPb_content() {
		return pb_content;
	}
	public void setPb_content(String pb_content) {
		this.pb_content = pb_content;
	}
	public Timestamp getPb_date() {
		return pb_date;
	}
	public void setPb_date(Timestamp pb_date) {
		this.pb_date = pb_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJob_title() {
		return job_title;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getBoard_fix() {
		return board_fix;
	}
	public void setBoard_fix(String board_fix) {
		this.board_fix = board_fix;
	}
	public int getPn_no() {
		return pn_no;
	}
	public void setPn_no(int pn_no) {
		this.pn_no = pn_no;
	}
	public String getPn_title() {
		return pn_title;
	}
	public void setPn_title(String pn_title) {
		this.pn_title = pn_title;
	}
	public String getPn_content() {
		return pn_content;
	}
	public void setPn_content(String pn_content) {
		this.pn_content = pn_content;
	}
	public Timestamp getPn_date() {
		return pn_date;
	}
	public void setPn_date(Timestamp pn_date) {
		this.pn_date = pn_date;
	}
	@Override
	public String toString() {
		return "Project [pr_no=" + pr_no + ", pr_title=" + pr_title + ", pr_content=" + pr_content + ", pr_open_yn="
				+ pr_open_yn + ", pr_join_open=" + pr_join_open + ", pr_date=" + pr_date + ", cp_no=" + cp_no
				+ ", cp_name=" + cp_name + ", pr_complete_yn=" + pr_complete_yn + ", emp_no=" + emp_no + ", pr_fav="
				+ pr_fav + ", pb_no=" + pb_no + ", pb_title=" + pb_title + ", pb_content=" + pb_content + ", pb_date="
				+ pb_date + ", name=" + name + ", job_title=" + job_title + ", dept_name=" + dept_name + ", board_fix="
				+ board_fix + ", pn_no=" + pn_no + ", pn_title=" + pn_title + ", pn_content=" + pn_content
				+ ", pn_date=" + pn_date + "]";
	}
	
	
	
}
