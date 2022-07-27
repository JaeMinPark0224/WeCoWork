package kh.spring.wcw.hr.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.dept.domain.Dept;
import kh.spring.wcw.attendance.domain.Attendance;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.hrDao.HrDao;
import kh.spring.wcw.notice.domain.Notice;
import kh.spring.wcw.vacation.domain.Vacation;

@Service
public class HrServiceImpl implements HrService {
	
	@Autowired
	private HrDao dao;
	
	// 직원 리스트 조회
	@Override
	public List<Employee> selectEmployeeList(int cp_no) {
		return dao.selectEmployeeList(cp_no);
	};

	@Override
	public List<Employee> selectEmployeeListFilter(String selectVal, RowBounds rowBounds, int cp_no){
		return dao.selectEmployeeListFilter(selectVal, rowBounds, cp_no);
	}
	
	// 특정 부서에 해당하는 직원 리스트
	public List<Employee> selectDeptEmployeeList(int cp_no, String dept_name) {
		return dao.selectDeptEmployeeList(cp_no, dept_name);
	}
	
	// 직원 상세 조회
	@Override
	public Employee selectEmployee(String emp_no, int cp_no) {
		return dao.selectEmployee(emp_no, cp_no);
	}
	
	// 부서 이름 리스트 조회
	@Override
	public List<String> selectDeptList(int cp_no) {
		return dao.selectDeptList(cp_no);
	}
	
	// 부서 이름 리스트 조회(사원이 존재하는 부서만)
	@Override
	public List<String> selectAdminDeptList(int cp_no) {
		return dao.selectAdminDeptList(cp_no);
	}

	
	// 부서 모든 정보 리스트 조회
	@Override
	public List<Dept> selectDeptAllList(int cp_no) {
		return dao.selectDeptAllList(cp_no);
	}
	

	// 직위 리스트 조회
	@Override
	public List<String> selectJobList(int cp_no) {
		return dao.selectJobList(cp_no);
	}
	
	// 직원 정보 업데이트
	@Override
	public int updateEmployee(int cp_no, int e_no, String dept_name, String job_title, String intl_no, String resign_yn) {
		return dao.updateEmployee(cp_no, e_no, dept_name, job_title, intl_no, resign_yn);
	}
	
	// 직원 계정 생성
	@Override
	public int insertEmployee(HashMap<String, Object> map) {
		return dao.insertEmployee(map);
	}
	
	// 관리자(인사팀 직원) 리스트 조회
	@Override
	public List<Employee> selectAdminList(int cp_no) {
		return dao.selectAdminList(cp_no);
	}
	
	// 관리자 부서 설정 업데이트
	@Override
	public int updateAdmin(int cp_no, String dept_name) {
		return dao.updateAdmin(cp_no, dept_name);
	}
	
	@Override
	// 부서 상세 정보 (1개)
	public Dept selectOneDepartment(int cp_no, int dept_no) {
		return dao.selectOneDepartment(cp_no, dept_no);
	}
	
	// 부서 생성
	@Override
	public int insertDepartment(int cp_no, String dept_name, int dept_upper_no) {
		return dao.insertDepartment(cp_no, dept_name, dept_upper_no);
	}
	
	// 부서 업데이트
	@Override
	public int updateDepartment(int cp_no, String dept_name, int emp_no, String dept_upper_name, String active_yn, int dept_no) {
		return dao.updateDepartment(cp_no, dept_name, emp_no, dept_upper_name, active_yn, dept_no);
	}
	
	// 공지사항 리스트
	@Override
	public List<Notice> selectListNotice(int cp_no, RowBounds rowBounds) {
		return dao.selectListNotice(cp_no, rowBounds);
	}
	
	// 공지사항 작성
	public int insertNotice(Notice notice) {
		return dao.insertNotice(notice);
	}
	
	// 공지사항 상세보기
	public Notice selectNotice(int cp_no, String nt_no) {
		return dao.selectNotice(cp_no, nt_no);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/////////////////이진정//////////////////
	///근태조회
	@Override
	public List<Attendance> selectAttendance(Attendance attendance){
		return dao.selectAttendance(attendance);
	}
	
	//근태 조정 신청내역 조회
	@Override
	public List<Attendance> selectApprovalAttendance(Attendance attendance){
		return dao.selectApprovalAttendance(attendance);
	}
	
	//주간근태조회
	@Override
	public List<Attendance> selectWeeklyAttendance(Attendance attendance){
		return dao.selectWeeklyAttendance(attendance);
	}
	
	//부서명, 직원명 조회
	@Override
	public List<Employee> selectDept(int cp_no) {
		return dao.selectDept(cp_no);
	}
	@Override
	public List<Employee> selectEmp(int cp_no) {
		return dao.selectEmp(cp_no);
	};
	
	//휴가신청내역 조회
	@Override
	public List<Vacation> selectVacation(Vacation vacation) {
		return dao.selectVacation(vacation);
	};
	
	//휴가 승인,반려
	@Override
	public int updateVacation(Vacation vacation) {
		return dao.updateVacation(vacation);
	}
	
	//월간근태 조회
	@Override
	public List<Attendance> selectMonthlyAttendance(Attendance attendance) {
		return dao.selectMonthlyAttendance(attendance);
	}
	
	
}
