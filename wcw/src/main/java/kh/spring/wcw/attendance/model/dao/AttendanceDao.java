package kh.spring.wcw.attendance.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.attendance.domain.Attendance;

@Repository
public class AttendanceDao {
	@Autowired
	private SqlSession sqlsession;
	
	public int insertAttendance(Attendance attendance) {
		return sqlsession.insert("Attendance.insertAttendance", attendance);
	}
	
	public int updateAttendance(Attendance attendance) {
		return sqlsession.update("Attendance.updateAttendance", attendance);
	}
	
	public List<Attendance> readAttendance(Attendance attendance){
		return sqlsession.selectList("Attendance.readAttendance", attendance);
	}
	
	public int insertApprovalAttendance(Attendance attendance) {
		return sqlsession.insert("Attendance.insertApprovalAttendance", attendance);
	}
	
	public List<Attendance> readApprovalAttendance(Attendance attendance){
		return sqlsession.selectList("Attendance.readApprovalAttendance", attendance);
	}
}
