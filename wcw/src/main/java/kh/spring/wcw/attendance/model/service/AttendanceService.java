package kh.spring.wcw.attendance.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.attendance.domain.Attendance;
import kh.spring.wcw.attendance.model.dao.AttendanceDao;

@Service
public class AttendanceService {
	
	@Autowired
	private AttendanceDao dao;
	
	public int insertAttendance(Attendance attendance) {
		return dao.insertAttendance(attendance);
	}
	
	public int updateAttendance(Attendance attendance) {
		return dao.updateAttendance(attendance);
	}
	
	public List<Attendance> readAttendance(Attendance attendance){
		return dao.readAttendance(attendance);
	}
}
