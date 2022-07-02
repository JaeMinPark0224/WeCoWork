package kh.spring.wcw.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.notice.dao.NoticeDao;
import kh.spring.wcw.notice.domain.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao dao;
	
	
	@Override
	public List<Notice> selectNotice(int currentPage, int pageSize){
		return dao.selectNotice(currentPage,pageSize);
	}
	
	@Override
	public Notice readNotice(int nt_no) {
		
		return dao.readNotice(nt_no);
	}

	@Override
	public int countNotice(int nt_no) {
		return dao.countNotice(nt_no);
	}
	
	

	
}
