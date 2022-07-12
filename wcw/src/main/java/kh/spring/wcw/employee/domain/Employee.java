package kh.spring.wcw.employee.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Employee {
	private int emp_no;
	private String email;
	private String pwd;
	private String name;
	private String intl_no;
	private String phone;
	private String profile;
	private String sign;
	private String ip;
	private Date join_date;
	private Date resign_date;
	private String resign_yn;
	private int dept_no;
	private int job_title_no;
	private String cp_name;
	private int cp_no;
	private String dept_name;
	private String job_title;
	private String hr_yn;

	@Override
	public String toString() {
		return "Employee [emp_no=" + emp_no + ", email=" + email + ", pwd=" + pwd + ", name=" + name + ", intl_no="
				+ intl_no + ", phone=" + phone + ", profile=" + profile + ", sign=" + sign + ", ip=" + ip
				+ ", join_date=" + join_date + ", resign_date=" + resign_date + ", resign_yn=" + resign_yn
				+ ", dept_no=" + dept_no + ", job_title_no=" + job_title_no + ", cp_name=" + cp_name + ", cp_no="
				+ cp_no + ", dept_name=" + dept_name + ", job_title=" + job_title + ", hr_yn=" + hr_yn + "]";
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntl_no() {
		return intl_no;
	}

	public void setIntl_no(String intl_no) {
		this.intl_no = intl_no;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public Date getResign_date() {
		return resign_date;
	}

	public void setResign_date(Date resign_date) {
		this.resign_date = resign_date;
	}

	public String getResign_yn() {
		return resign_yn;
	}

	public void setResign_yn(String resign_yn) {
		this.resign_yn = resign_yn;
	}

	public int getDept_no() {
		return dept_no;
	}

	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}

	public int getJob_title_no() {
		return job_title_no;
	}

	public void setJob_title_no(int job_title_no) {
		this.job_title_no = job_title_no;
	}

	public String getCp_name() {
		return cp_name;
	}

	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public String getHr_yn() {
		return hr_yn;
	}

	public void setHr_yn(String hr_yn) {
		this.hr_yn = hr_yn;
	}

	public int getCp_no() {
		return cp_no;
	}

	public void setCp_no(int cp_no) {
		this.cp_no = cp_no;
	}
	
	
}
