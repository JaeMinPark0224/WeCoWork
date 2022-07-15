package kh.spring.wcw.hr.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.attendance.domain.Attendance;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.hrDao.HrDao;

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
	
	// 직원 상세 조회
	@Override
	public Employee selectEmployee(String emp_no, int cp_no) {
		return dao.selectEmployee(emp_no, cp_no);
	}
	
	// 부서 리스트 조회
	@Override
	public List<String> selectDeptList(int cp_no) {
		return dao.selectDeptList(cp_no);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/////////////////이진정//////////////////
	///근태조회
	public List<Attendance> selectAttendance(Attendance attendance){
		return dao.selectAttendance(attendance);
	}
	
}
