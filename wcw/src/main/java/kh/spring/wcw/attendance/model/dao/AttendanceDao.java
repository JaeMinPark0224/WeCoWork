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
	
	public List<Attendance> selectAttendance(Attendance attendance){
		return sqlsession.selectList("Attendance.selectAttendance", attendance);
	}
	
	public int insertApprovalAttendance(Attendance attendance) {
		return sqlsession.insert("Attendance.insertApprovalAttendance", attendance);
	}
	
	public List<Attendance> selectApprovalAttendance(Attendance attendance){
		return sqlsession.selectList("Attendance.selectApprovalAttendance", attendance);
	}
	
	public List<Attendance> selectWeeklyAttendance(Attendance attendance){
		return sqlsession.selectList("Attendance.selectWeeklyAttendance", attendance);
	}
	
	
}
