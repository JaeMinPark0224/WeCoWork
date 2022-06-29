package kh.spring.wcw.attendance.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.attendance.domain.Attendance;

@Repository
public class AttendanceDao {
	@Autowired
	private SqlSession sqlsession;
	
	public int insertAttendance(Attendance Attendance) {
		return sqlsession.insert("Attendance.insertAttendance", Attendance);
	}
}
