package kh.spring.wcw.notification.service;

import java.util.List;

import kh.spring.wcw.notification.domain.Notification;

public interface NotificationService {
	
	public List<Notification> selectNotification();

	public int deleteNotification(List<String> deletecheckArr);

	public int checkNotification(List<String> checkArr);
}
