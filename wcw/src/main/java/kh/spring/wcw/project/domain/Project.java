package kh.spring.wcw.project.domain;


import java.sql.Timestamp;
import java.util.List;

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
	private int ep_no;
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
	private int pw_no;
	private String pw_title;
	private int pw_status;
	private int pw_priority;
	private Timestamp pw_start_date;
	private Timestamp pw_end_date;
	private String pw_content;
	private int pw_tier;
	private int pw_ref_no;
	private int pw_order;
	private Timestamp pw_date;
	private String pr_emp_authority;
	private String intl_no;
	private String email;
	private String profile;
	private int pwp_no;
	private String pwp_authority;
	private List<String> empNoList;
	private int pt_no;
	private Timestamp pt_date;
	private String pt_content;
	private String pt_complete_yn;
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
	public int getEp_no() {
		return ep_no;
	}
	public void setEp_no(int ep_no) {
		this.ep_no = ep_no;
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
	public int getPw_no() {
		return pw_no;
	}
	public void setPw_no(int pw_no) {
		this.pw_no = pw_no;
	}
	public String getPw_title() {
		return pw_title;
	}
	public void setPw_title(String pw_title) {
		this.pw_title = pw_title;
	}
	public int getPw_status() {
		return pw_status;
	}
	public void setPw_status(int pw_status) {
		this.pw_status = pw_status;
	}
	public int getPw_priority() {
		return pw_priority;
	}
	public void setPw_priority(int pw_priority) {
		this.pw_priority = pw_priority;
	}
	public Timestamp getPw_start_date() {
		return pw_start_date;
	}
	public void setPw_start_date(Timestamp pw_start_date) {
		this.pw_start_date = pw_start_date;
	}
	public Timestamp getPw_end_date() {
		return pw_end_date;
	}
	public void setPw_end_date(Timestamp pw_end_date) {
		this.pw_end_date = pw_end_date;
	}
	public String getPw_content() {
		return pw_content;
	}
	public void setPw_content(String pw_content) {
		this.pw_content = pw_content;
	}
	public int getPw_tier() {
		return pw_tier;
	}
	public void setPw_tier(int pw_tier) {
		this.pw_tier = pw_tier;
	}
	public int getPw_ref_no() {
		return pw_ref_no;
	}
	public void setPw_ref_no(int pw_ref_no) {
		this.pw_ref_no = pw_ref_no;
	}
	public int getPw_order() {
		return pw_order;
	}
	public void setPw_order(int pw_order) {
		this.pw_order = pw_order;
	}
	public Timestamp getPw_date() {
		return pw_date;
	}
	public void setPw_date(Timestamp pw_date) {
		this.pw_date = pw_date;
	}
	public String getPr_emp_authority() {
		return pr_emp_authority;
	}
	public void setPr_emp_authority(String pr_emp_authority) {
		this.pr_emp_authority = pr_emp_authority;
	}
	public String getIntl_no() {
		return intl_no;
	}
	public void setIntl_no(String intl_no) {
		this.intl_no = intl_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getPwp_no() {
		return pwp_no;
	}
	public void setPwp_no(int pwp_no) {
		this.pwp_no = pwp_no;
	}
	public String getPwp_authority() {
		return pwp_authority;
	}
	public void setPwp_authority(String pwp_authority) {
		this.pwp_authority = pwp_authority;
	}
	public List<String> getEmpNoList() {
		return empNoList;
	}
	public void setEmpNoList(List<String> empNoList) {
		this.empNoList = empNoList;
	}
	public int getPt_no() {
		return pt_no;
	}
	public void setPt_no(int pt_no) {
		this.pt_no = pt_no;
	}
	public Timestamp getPt_date() {
		return pt_date;
	}
	public void setPt_date(Timestamp pt_date) {
		this.pt_date = pt_date;
	}
	public String getPt_content() {
		return pt_content;
	}
	public void setPt_content(String pt_content) {
		this.pt_content = pt_content;
	}
	public String getPt_complete_yn() {
		return pt_complete_yn;
	}
	public void setPt_complete_yn(String pt_complete_yn) {
		this.pt_complete_yn = pt_complete_yn;
	}
	@Override
	public String toString() {
		return "Project [pr_no=" + pr_no + ", pr_title=" + pr_title + ", pr_content=" + pr_content + ", pr_open_yn="
				+ pr_open_yn + ", pr_join_open=" + pr_join_open + ", pr_date=" + pr_date + ", cp_no=" + cp_no
				+ ", cp_name=" + cp_name + ", pr_complete_yn=" + pr_complete_yn + ", emp_no=" + emp_no + ", ep_no="
				+ ep_no + ", pr_fav=" + pr_fav + ", pb_no=" + pb_no + ", pb_title=" + pb_title + ", pb_content="
				+ pb_content + ", pb_date=" + pb_date + ", name=" + name + ", job_title=" + job_title + ", dept_name="
				+ dept_name + ", board_fix=" + board_fix + ", pn_no=" + pn_no + ", pn_title=" + pn_title
				+ ", pn_content=" + pn_content + ", pn_date=" + pn_date + ", pw_no=" + pw_no + ", pw_title=" + pw_title
				+ ", pw_status=" + pw_status + ", pw_priority=" + pw_priority + ", pw_start_date=" + pw_start_date
				+ ", pw_end_date=" + pw_end_date + ", pw_content=" + pw_content + ", pw_tier=" + pw_tier
				+ ", pw_ref_no=" + pw_ref_no + ", pw_order=" + pw_order + ", pw_date=" + pw_date + ", pr_emp_authority="
				+ pr_emp_authority + ", intl_no=" + intl_no + ", email=" + email + ", profile=" + profile + ", pwp_no="
				+ pwp_no + ", pwp_authority=" + pwp_authority + ", empNoList=" + empNoList + ", pt_no=" + pt_no
				+ ", pt_date=" + pt_date + ", pt_content=" + pt_content + ", pt_complete_yn=" + pt_complete_yn + "]";
	}
	
}
