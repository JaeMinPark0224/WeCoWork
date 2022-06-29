package kh.spring.wcw.company.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Company {
	private int cp_no;
	private String cp_name;
	private String cp_url;
	private Date cp_date;
	private String cp_join_name;
	private String cp_join_email;
	private String cp_join_phone;
	private String cp_appr_yn;
	private String cp_pwd;
	
	@Override
	public String toString() {
		return "Company [cp_no=" + cp_no + ", cp_name=" + cp_name + ", cp_url=" + cp_url + ", cp_date=" + cp_date
				+ ", cp_join_name=" + cp_join_name + ", cp_join_email=" + cp_join_email + ", cp_join_phone="
				+ cp_join_phone + ", cp_appr_yn=" + cp_appr_yn + ", cp_pwd=" + cp_pwd + "]";
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

	public String getCp_url() {
		return cp_url;
	}

	public void setCp_url(String cp_url) {
		this.cp_url = cp_url;
	}

	public Date getCp_date() {
		return cp_date;
	}

	public void setCp_date(Date cp_date) {
		this.cp_date = cp_date;
	}

	public String getCp_join_name() {
		return cp_join_name;
	}

	public void setCp_join_name(String cp_join_name) {
		this.cp_join_name = cp_join_name;
	}

	public String getCp_join_email() {
		return cp_join_email;
	}

	public void setCp_join_email(String cp_join_email) {
		this.cp_join_email = cp_join_email;
	}

	public String getCp_join_phone() {
		return cp_join_phone;
	}

	public void setCp_join_phone(String cp_join_phone) {
		this.cp_join_phone = cp_join_phone;
	}

	public String getCp_appr_yn() {
		return cp_appr_yn;
	}

	public void setCp_appr_yn(String cp_appr_yn) {
		this.cp_appr_yn = cp_appr_yn;
	}

	public String getCp_pwd() {
		return cp_pwd;
	}

	public void setCp_pwd(String cp_pwd) {
		this.cp_pwd = cp_pwd;
	}
}
