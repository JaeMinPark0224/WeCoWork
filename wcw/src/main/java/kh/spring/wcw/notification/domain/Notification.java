package kh.spring.wcw.notification.domain;

import java.sql.Date;

public class Notification {
	
//	NOTI_NO      NOT NULL NUMBER         
//	EP_NO        NOT NULL NUMBER         
//	NOTI_TITLE   NOT NULL VARCHAR2(300)  
//	NOTI_CONTENT          VARCHAR2(1000) 
//	NOTI_DATE    NOT NULL DATE           
//	NOTI_STATUS  NOT NULL VARCHAR2(1)    
//	NOTI_SORT    NOT NULL VARCHAR2(1)
	
	private int noti_no;
	private int ep_no;
	private String noti_title;
	private String noti_content;
	private Date noti_date;
	private String noti_status;
	private String noti_sort;
	
	
	public int getNoti_no() {
		return noti_no;
	}


	public void setNoti_no(int noti_no) {
		this.noti_no = noti_no;
	}


	public int getEp_no() {
		return ep_no;
	}


	public void setEp_no(int ep_no) {
		this.ep_no = ep_no;
	}


	public String getNoti_title() {
		return noti_title;
	}


	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}


	public String getNoti_content() {
		return noti_content;
	}


	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}


	public Date getNoti_date() {
		return noti_date;
	}


	public void setNoti_date(Date noti_date) {
		this.noti_date = noti_date;
	}


	public String getNoti_status() {
		return noti_status;
	}


	public void setNoti_status(String noti_status) {
		this.noti_status = noti_status;
	}


	public String getNoti_sort() {
		return noti_sort;
	}


	public void setNoti_sort(String noti_sort) {
		this.noti_sort = noti_sort;
	}


	@Override
	public String toString() {
		return "Notification [noti_no=" + noti_no + ", ep_no=" + ep_no + ", noti_title=" + noti_title
				+ ", noti_content=" + noti_content + ", noti_date=" + noti_date + ", noti_status=" + noti_status
				+ ", noti_sort=" + noti_sort + "]";
	}
	
	

}
