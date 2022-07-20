package kh.spring.wcw.draft.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Draft {
	private int dr_no;
	private int ep_no;
	private int dr_sort;
	private int dr_result;
	private String dr_title;
	private String dr_content;
	private String dr_purpose;
	private Date dr_date;
	private Date dr_due_date;
	private String dr_comment;
	private String dr_expect_date;
	private String dr_amount;
	private int dr_tier;
	
	private String spend_sort;
	private String spend_purpose;
	private String spend_conetent;
	private int spend_amount;
	private String spend_conetent_prvt;
	private int spend_amount_prvt;
	private int spend_sum;
	
	private int appr_no_1;
	private int appr_no_2;
	private int appr_no_3;
	private String emp_no_1;
	private String emp_no_2;
	private String emp_no_3;
	private int appr_order_1;
	private int appr_order_2;
	private int appr_order_3;
	private int appr_result_1;
	private int appr_result_2;
	private int appr_result_3;
	private Date appr_date_1;
	private Date appr_date_2;
	private Date appr_date_3;
	
	@Override
	public String toString() {
		return "Draft [dr_no=" + dr_no + ", ep_no=" + ep_no + ", dr_sort=" + dr_sort + ", dr_result=" + dr_result
				+ ", dr_title=" + dr_title + ", dr_content=" + dr_content + ", dr_purpose=" + dr_purpose + ", dr_date="
				+ dr_date + ", dr_due_date=" + dr_due_date + ", dr_comment=" + dr_comment + ", dr_expect_date="
				+ dr_expect_date + ", dr_amount=" + dr_amount + ", dr_tier=" + dr_tier + ", spend_sort=" + spend_sort
				+ ", spend_purpose=" + spend_purpose + ", spend_conetent=" + spend_conetent + ", spend_amount="
				+ spend_amount + ", spend_conetent_prvt=" + spend_conetent_prvt + ", spend_amount_prvt="
				+ spend_amount_prvt + ", spend_sum=" + spend_sum + ", appr_no_1=" + appr_no_1 + ", appr_no_2="
				+ appr_no_2 + ", appr_no_3=" + appr_no_3 + ", emp_no_1=" + emp_no_1 + ", emp_no_2=" + emp_no_2
				+ ", emp_no_3=" + emp_no_3 + ", appr_order_1=" + appr_order_1 + ", appr_order_2=" + appr_order_2
				+ ", appr_order_3=" + appr_order_3 + ", appr_result_1=" + appr_result_1 + ", appr_result_2="
				+ appr_result_2 + ", appr_result_3=" + appr_result_3 + ", appr_date_1=" + appr_date_1 + ", appr_date_2="
				+ appr_date_2 + ", appr_date_3=" + appr_date_3 + "]";
	}

	public int getDr_no() {
		return dr_no;
	}

	public void setDr_no(int dr_no) {
		this.dr_no = dr_no;
	}

	public int getEp_no() {
		return ep_no;
	}

	public void setEp_no(int ep_no) {
		this.ep_no = ep_no;
	}

	public int getDr_sort() {
		return dr_sort;
	}

	public void setDr_sort(int dr_sort) {
		this.dr_sort = dr_sort;
	}

	public int getDr_result() {
		return dr_result;
	}

	public void setDr_result(int dr_result) {
		this.dr_result = dr_result;
	}

	public String getDr_title() {
		return dr_title;
	}

	public void setDr_title(String dr_title) {
		this.dr_title = dr_title;
	}

	public String getDr_content() {
		return dr_content;
	}

	public void setDr_content(String dr_content) {
		this.dr_content = dr_content;
	}

	public String getDr_purpose() {
		return dr_purpose;
	}

	public void setDr_purpose(String dr_purpose) {
		this.dr_purpose = dr_purpose;
	}

	public Date getDr_date() {
		return dr_date;
	}

	public void setDr_date(Date dr_date) {
		this.dr_date = dr_date;
	}

	public Date getDr_due_date() {
		return dr_due_date;
	}

	public void setDr_due_date(Date dr_due_date) {
		this.dr_due_date = dr_due_date;
	}

	public String getDr_comment() {
		return dr_comment;
	}

	public void setDr_comment(String dr_comment) {
		this.dr_comment = dr_comment;
	}

	public String getDr_expect_date() {
		return dr_expect_date;
	}

	public void setDr_expect_date(String dr_expect_date) {
		this.dr_expect_date = dr_expect_date;
	}

	public String getDr_amount() {
		return dr_amount;
	}

	public void setDr_amount(String dr_amount) {
		this.dr_amount = dr_amount;
	}

	public int getDr_tier() {
		return dr_tier;
	}

	public void setDr_tier(int dr_tier) {
		this.dr_tier = dr_tier;
	}

	public String getSpend_sort() {
		return spend_sort;
	}

	public void setSpend_sort(String spend_sort) {
		this.spend_sort = spend_sort;
	}

	public String getSpend_purpose() {
		return spend_purpose;
	}

	public void setSpend_purpose(String spend_purpose) {
		this.spend_purpose = spend_purpose;
	}

	public String getSpend_conetent() {
		return spend_conetent;
	}

	public void setSpend_conetent(String spend_conetent) {
		this.spend_conetent = spend_conetent;
	}

	public int getSpend_amount() {
		return spend_amount;
	}

	public void setSpend_amount(int spend_amount) {
		this.spend_amount = spend_amount;
	}

	public String getSpend_conetent_prvt() {
		return spend_conetent_prvt;
	}

	public void setSpend_conetent_prvt(String spend_conetent_prvt) {
		this.spend_conetent_prvt = spend_conetent_prvt;
	}

	public int getSpend_amount_prvt() {
		return spend_amount_prvt;
	}

	public void setSpend_amount_prvt(int spend_amount_prvt) {
		this.spend_amount_prvt = spend_amount_prvt;
	}

	public int getSpend_sum() {
		return spend_sum;
	}

	public void setSpend_sum(int spend_sum) {
		this.spend_sum = spend_sum;
	}

	public int getAppr_no_1() {
		return appr_no_1;
	}

	public void setAppr_no_1(int appr_no_1) {
		this.appr_no_1 = appr_no_1;
	}

	public int getAppr_no_2() {
		return appr_no_2;
	}

	public void setAppr_no_2(int appr_no_2) {
		this.appr_no_2 = appr_no_2;
	}

	public int getAppr_no_3() {
		return appr_no_3;
	}

	public void setAppr_no_3(int appr_no_3) {
		this.appr_no_3 = appr_no_3;
	}

	public String getEmp_no_1() {
		return emp_no_1;
	}

	public void setEmp_no_1(String emp_no_1) {
		this.emp_no_1 = emp_no_1;
	}

	public String getEmp_no_2() {
		return emp_no_2;
	}

	public void setEmp_no_2(String emp_no_2) {
		this.emp_no_2 = emp_no_2;
	}

	public String getEmp_no_3() {
		return emp_no_3;
	}

	public void setEmp_no_3(String emp_no_3) {
		this.emp_no_3 = emp_no_3;
	}

	public int getAppr_order_1() {
		return appr_order_1;
	}

	public void setAppr_order_1(int appr_order_1) {
		this.appr_order_1 = appr_order_1;
	}

	public int getAppr_order_2() {
		return appr_order_2;
	}

	public void setAppr_order_2(int appr_order_2) {
		this.appr_order_2 = appr_order_2;
	}

	public int getAppr_order_3() {
		return appr_order_3;
	}

	public void setAppr_order_3(int appr_order_3) {
		this.appr_order_3 = appr_order_3;
	}

	public int getAppr_result_1() {
		return appr_result_1;
	}

	public void setAppr_result_1(int appr_result_1) {
		this.appr_result_1 = appr_result_1;
	}

	public int getAppr_result_2() {
		return appr_result_2;
	}

	public void setAppr_result_2(int appr_result_2) {
		this.appr_result_2 = appr_result_2;
	}

	public int getAppr_result_3() {
		return appr_result_3;
	}

	public void setAppr_result_3(int appr_result_3) {
		this.appr_result_3 = appr_result_3;
	}

	public Date getAppr_date_1() {
		return appr_date_1;
	}

	public void setAppr_date_1(Date appr_date_1) {
		this.appr_date_1 = appr_date_1;
	}

	public Date getAppr_date_2() {
		return appr_date_2;
	}

	public void setAppr_date_2(Date appr_date_2) {
		this.appr_date_2 = appr_date_2;
	}

	public Date getAppr_date_3() {
		return appr_date_3;
	}

	public void setAppr_date_3(Date appr_date_3) {
		this.appr_date_3 = appr_date_3;
	}
	
}
