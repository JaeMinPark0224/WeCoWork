package kh.spring.wcw.notice.service;

import java.util.List;

import kh.spring.wcw.notice.domain.Notice;

public interface NoticeService {
	
	public List<Notice> selectNotice(int currentPage,int pageSize);
	public Notice readNotice(int nt_no);
}
