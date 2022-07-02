package kh.spring.wcw.notice.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.notice.domain.Notice;

@Repository
public class NoticeDao {
	
	@Autowired
	private SqlSession sqlsession;
	 
	public List<Notice> selectNotice(int currentPage, int pageSize){
		return sqlsession.selectList("Notice.selectNotice", null, new RowBounds((currentPage-1)*pageSize,pageSize));
		
	}
	
	public Notice readNotice(int nt_no) {
		return sqlsession.selectOne("Notice.readNotice",nt_no);
	}
	
	public int countNotice(int nt_no) {
		return sqlsession.update("Notice.countNotice",nt_no);
	}
	
}
