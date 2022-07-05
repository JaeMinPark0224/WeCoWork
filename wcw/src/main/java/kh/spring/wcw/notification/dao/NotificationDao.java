package kh.spring.wcw.notification.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.notification.domain.Notification;

@Repository
public class NotificationDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<Notification> selectNotification(){
		return sqlsession.selectList("Notification.selectNotification");
	}
	
	public int deleteNotification(List<String> deletecheckArr) {
		return sqlsession.delete("Notification.deleteNotification",deletecheckArr);
	}
	
	public int checkNotification(List<String> checkArr) {
		return sqlsession.update("Notification.checkNotification",checkArr);
	}
	

}
