package kh.spring.wcw.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.notice.domain.Notice;

@Repository
public class NoticeDao {
	
	@Autowired
	private SqlSession sqlsession;
	 
	public List<Notice> selectNotice(){
		return sqlsession.selectList("Notice.selectNotice");
		
	}
	
}
