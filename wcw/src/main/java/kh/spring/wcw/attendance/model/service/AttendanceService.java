package kh.spring.wcw.attendance.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.attendance.domain.Attendance;
import kh.spring.wcw.attendance.model.dao.AttendanceDao;

@Service
public class AttendanceService {
	
	@Autowired
	private AttendanceDao dao;
	
	public int insertAttendance(Attendance Attendance) {
		return dao.insertAttendance(Attendance);
	}
}
