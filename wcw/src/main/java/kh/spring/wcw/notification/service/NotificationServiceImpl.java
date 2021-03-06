package kh.spring.wcw.notification.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.notification.dao.NotificationDao;
import kh.spring.wcw.notification.domain.Notification;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	private NotificationDao dao;
	
	@Override
	public List<Notification> selectNotification(){
		return dao.selectNotification();
	}

	@Override
	public int deleteNotification(List<String> deletecheckArr) {
		return dao.deleteNotification(deletecheckArr);
	}

	@Override
	public int checkNotification(List<String> checkArr) {
		return dao.checkNotification(checkArr);
	}
	
	
}
