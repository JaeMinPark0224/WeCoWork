package kh.spring.wcw.dept.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Dept {
	private int dept_no;
	private int cp_no;
	private String dept_name;
	private Date dept_date;
	private String active_yn;
	private int emp_no; // 부서 책임자인 사원 번호
	private String admin_name; // 부서 책임자인 사원 이름
	private String name; // 부서 내 사원 이름
	private int dept_upper_no; // 부모 부서의 부서 번호
	private String dept_upper_name; // 부모 부서의 부서 이름
	private int cnt; // 부서 내 직원 인원

	@Override
	public String toString() {
		return "Dept [dept_no=" + dept_no + ", cp_no=" + cp_no + ", dept_name=" + dept_name + ", dept_date=" + dept_date
				+ ", active_yn=" + active_yn + ", emp_no=" + emp_no + ", admin_name=" + admin_name + ", name=" + name
				+ ", dept_upper_no=" + dept_upper_no + ", dept_upper_name=" + dept_upper_name + ", cnt=" + cnt + "]";
	}

	public int getDept_no() {
		return dept_no;
	}

	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}

	public int getCp_no() {
		return cp_no;
	}

	public void setCp_no(int cp_no) {
		this.cp_no = cp_no;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public Date getDept_date() {
		return dept_date;
	}

	public void setDept_date(Date dept_date) {
		this.dept_date = dept_date;
	}

	public String getActive_yn() {
		return active_yn;
	}

	public void setActive_yn(String active_yn) {
		this.active_yn = active_yn;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDept_upper_no() {
		return dept_upper_no;
	}

	public void setDept_upper_no(int dept_upper_no) {
		this.dept_upper_no = dept_upper_no;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getDept_upper_name() {
		return dept_upper_name;
	}

	public void setDept_upper_name(String dept_upper_name) {
		this.dept_upper_name = dept_upper_name;
	}
	

}
