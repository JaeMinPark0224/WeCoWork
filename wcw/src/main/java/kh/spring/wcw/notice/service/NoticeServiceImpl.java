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
	public List<Notice> selectNotice(){
		return dao.selectNotice();
	}
	
	

	
}
