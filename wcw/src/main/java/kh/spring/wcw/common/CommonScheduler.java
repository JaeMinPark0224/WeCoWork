package kh.spring.wcw.common;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class CommonScheduler {
	
	// 서유빈 - 기안 자동 부결
	@Scheduled
	public void draftAutoRejected() {
		
	}
	
	// 이진정 - 연차 자동 생성
	@Scheduled
	public void name() {
		
	}
}
