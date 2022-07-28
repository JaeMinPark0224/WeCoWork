package kh.spring.wcw.notice.domain;

import java.sql.Date;

public class Notice {
//	NT_NO	NUMBER	
//	CP_NO	NUMBER	
//	NT_TITLE	VARCHAR2(300 BYTE)	
//	NT_CONTENT	VARCHAR2(1000 BYTE)
//	NT_DATE	DATE	
//	NT_CNT	NUMBER	
	
	private int nt_no;
	private int cp_no;
	private String nt_title;
	private String nt_content;
	private Date nt_date;
	private	int nt_cnt;
	private int rownum;
	
	@Override
	public String toString() {
		return "Notice [nt_no=" + nt_no + ", cp_no=" + cp_no + ", nt_title=" + nt_title + ", nt_content=" + nt_content
				+ ", nt_date=" + nt_date + ", nt_cnt=" + nt_cnt + ", rownum=" + rownum + "]";
	}
	
	public int getNt_no() {
		return nt_no;
	}
	public void setNt_no(int nt_no) {
		this.nt_no = nt_no;
	}
	public int getCp_no() {
		return cp_no;
	}
	public void setCp_no(int cp_no) {
		this.cp_no = cp_no;
	}
	public String getNt_title() {
		return nt_title;
	}
	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}
	public String getNt_content() {
		return nt_content;
	}
	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}
	public Date getNt_date() {
		return nt_date;
	}
	public void setNt_date(Date nt_date) {
		this.nt_date = nt_date;
	}
	public int getNt_cnt() {
		return nt_cnt;
	}
	public void setNt_cnt(int nt_cnt) {
		this.nt_cnt = nt_cnt;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	
}
