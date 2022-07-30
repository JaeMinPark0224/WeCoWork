package kh.spring.wcw.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kh.spring.wcw.draft.dao.DraftDao;

@Component
public class CommonScheduler {
	@Autowired
	private DraftDao dao;
	
	// 서유빈 - 기안 자동 부결
	@Scheduled(cron = "*/60 * * * * *")
	public void draftAutoRejected() {
		System.out.println("기안 자동 부결 스케줄러 작동");
		dao.draftAutoRejected();
	}
	
	// 이진정 - 연차 자동 생성
//	@Scheduled
//	public void name() {
//		
//	}
}
