package kh.spring.wcw.hrDao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.dept.domain.Dept;
import kh.spring.wcw.attendance.domain.Attendance;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.notice.domain.Notice;
import kh.spring.wcw.vacation.domain.Vacation;

@Repository
public class HrDao {
	
	@Autowired
	private SqlSession sqlsession;
	 
	// 직원 리스트 조회
	public List<Employee> selectEmployeeList(int cp_no) {
		return sqlsession.selectList("hrMapper.selectEmployeeList", cp_no);
	}
	
	public List<Employee> selectEmployeeListFilter(String selectVal, RowBounds rowBounds, int cp_no) {
		HashMap<String, Object> map= new HashMap<>();
		map.put("selectVal", selectVal);
		map.put("cp_no", cp_no);
		return sqlsession.selectList("hrMapper.selectEmployeeListFilter", map, rowBounds);
	}
	
	// 특정 부서에 해당하는 직원 리스트
	public List<Employee> selectDeptEmployeeList(int cp_no, String dept_name) {
		HashMap<String, Object> map= new HashMap<>();
		map.put("dept_name", dept_name);
		map.put("cp_no", cp_no);
		return sqlsession.selectList("hrMapper.selectDeptEmployeeList", map);
	}
	
	// 직원 상세 조회
	public Employee selectEmployee(String emp_no, int cp_no) {
		HashMap<String, Object> map= new HashMap<>();
		map.put("emp_no", emp_no);
		map.put("cp_no", cp_no);
		return sqlsession.selectOne("hrMapper.selectEmployee", map);
	}
	
	// 부서 이름 리스트 조회
	public List<String> selectDeptList(int cp_no) {
		return sqlsession.selectList("hrMapper.selectDeptList", cp_no);
	}
	
	// 부서 이름 리스트 조회(사원이 존재하는 부서만)
	public List<String> selectAdminDeptList(int cp_no) {
		return sqlsession.selectList("hrMapper.selectAdminDeptList", cp_no);
	}
	
	// 부서 모든 정보 리스트 조회
	public List<Dept> selectDeptAllList(int cp_no) {
		return sqlsession.selectList("hrMapper.selectDeptAllList", cp_no);
	}
	
	// 직위 리스트 조회
	public List<String> selectJobList(int cp_no) {
		return sqlsession.selectList("hrMapper.selectJobList", cp_no);
	}	
	
	// 직원 정보 업데이트
	public int updateEmployee(int cp_no, int e_no, String dept_name, String job_title, String intl_no, String resign_yn) {
		HashMap<String, Object> map= new HashMap<>();
		map.put("cp_no", cp_no);
		map.put("emp_no", e_no);
		map.put("dept_name", dept_name);
		map.put("job_title", job_title);
		map.put("intl_no", intl_no);
		map.put("resign_yn", resign_yn);
		int result1 = sqlsession.update("hrMapper.updateEmployee1", map);
		System.out.println("result1: " + result1);
		int result2 = sqlsession.update("hrMapper.updateEmployee2", map);
		System.out.println("result2: " + result2);
		int result3 = sqlsession.update("hrMapper.updateEmployee3", map);
		System.out.println("result3: " + result3);
		
		int result = result1 + result2 + result3;
		return result;
	}

	// 직원 계정 생성
	public int insertEmployee(HashMap<String, Object> map) {
		return sqlsession.insert("hrMapper.insertEmployee", map);
	}
	
	// 관리자(인사팀 직원) 리스트 조회
	public List<Employee> selectAdminList(int cp_no) {
		return sqlsession.selectList("hrMapper.selectAdminList", cp_no);
	}
	
	// 관리자 부서 설정 업데이트
	public int updateAdmin(int cp_no, String dept_name) {
		HashMap<String, Object> map= new HashMap<>();
		map.put("cp_no", cp_no);
		map.put("dept_name", dept_name);
		
		int result = -1;
		result = sqlsession.update("hrMapper.updateAdmin1", cp_no);
		System.out.println("result1: " + result);
		result = sqlsession.update("hrMapper.updateAdmin2", map);
		System.out.println("result2: " + result);
		
		return result;
	}
	
	// 부서 상세 조회 (1개)
	public Dept selectOneDepartment(int cp_no, int dept_no) {
		HashMap<String, Object> map= new HashMap<>();
		map.put("cp_no", cp_no);
		map.put("dept_no", dept_no);
		
		return sqlsession.selectOne("hrMapper.selectOneDepartment", map);
	}
	
	// 부서 생성
	public int insertDepartment(int cp_no, String dept_name, int dept_upper_no) {
		
		HashMap<String, Object> map= new HashMap<>();
		map.put("cp_no", cp_no);
		map.put("dept_name", dept_name);
		map.put("dept_upper_no", dept_upper_no);
		
		return sqlsession.insert("hrMapper.insertDepartment", map);
	}
	
	// 부서 업데이트
	public int updateDepartment(int cp_no, String dept_name, int emp_no, String dept_upper_name, String active_yn, int dept_no) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cp_no", cp_no);
		map.put("dept_name", dept_name);
		map.put("emp_no", emp_no);
		map.put("dept_upper_name", dept_upper_name);
		map.put("active_yn", active_yn);
		map.put("dept_no", dept_no);
		
		return sqlsession.update("hrMapper.updateDepartment", map);
	}
	
	// 공지사항 리스트
	public List<Notice> selectListNotice(int cp_no, RowBounds rowBounds) {
		return sqlsession.selectList("hrMapper.selectListNotice", cp_no, rowBounds);
	}
	
	// 공지사항 작성
	public int insertNotice(Notice notice) {
		return sqlsession.insert("hrMapper.insertNotice", notice);
	}
	
	// 공지사항 상세보기
	public Notice selectNotice(int cp_no, String nt_no) {
		Integer.parseInt(nt_no);
		HashMap<String, Object> map = new HashMap<>();
		map.put("cp_no", cp_no);
		map.put("nt_no", nt_no);
		return sqlsession.selectOne("hrMapper.selectNotice", map);
	}
	
	// 공지사항 업데이트
	public int updateNotice(Notice notice) {
		return sqlsession.update("hrMapper.updateNotice", notice);
	}
	
	// 공지사항 삭제
	public int deleteNotice(int cp_no, String nt_no) {
		Integer.parseInt(nt_no);
		HashMap<String, Object> map = new HashMap<>();
		map.put("cp_no", cp_no);
		map.put("nt_no", nt_no);
		return sqlsession.delete("hrMapper.deleteNotice", map);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//////////이진정 //////////////
	//근태전체조회
	public List<Attendance> selectAttendance(Attendance attendance){
		return sqlsession.selectList("hrMapper.selectAttendance", attendance);
	}
	
	public List<Attendance> selectApprovalAttendance(Attendance attendance){
		return sqlsession.selectList("hrMapper.selectApprovalAttendance", attendance);
	}
	
	//주간근태조회
	public List<Attendance> selectWeeklyAttendance(Attendance attendance){
		return sqlsession.selectList("hrMapper.selectWeeklyAttendance", attendance);
	}
	
	//부서, 직원명 선택
	public List<Employee> selectDept(int cp_no) {
		return sqlsession.selectList("hrMapper.selectDept", cp_no);
	}
	public List<Employee> selectEmp(int cp_no) {
		return sqlsession.selectList("hrMapper.selectEmp", cp_no);
	}
	
	//휴가내역 조회
	public List<Vacation> selectVacation(Vacation vacation) {
		return sqlsession.selectList("hrMapper.selectVacation", vacation);
	}
	
	//휴가 승인반려
	public int updateVacation(Vacation vacation) {
		return sqlsession.update("hrMapper.updateVacation", vacation);
	}
	
	//월간 근태 조회
	public List<Attendance> selectMonthlyAttendance(Attendance attendance){
		return sqlsession.selectList("hrMapper.selectMonthlyAttendance", attendance);
	}
}
