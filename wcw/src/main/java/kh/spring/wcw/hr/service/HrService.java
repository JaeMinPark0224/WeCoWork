package kh.spring.wcw.hr.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import kh.spring.wcw.dept.domain.Dept;
import kh.spring.wcw.attendance.domain.Attendance;
import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.notice.domain.Notice;
import kh.spring.wcw.vacation.domain.Vacation;

/**
 *   직원 서비스 
 *   */
public interface HrService {
	/**
	 * @param 회사 번호
	 * @return 직원 리스트
	 * @author ybseo
	 */
	public List<Employee> selectEmployeeList(int cp_no);
	
	/**
	 * @param filter value, RowBounds, 회사 번호
	 * @return filter에 맞는 직원 리스트
	 * @author ybseo
	 */
	public List<Employee> selectEmployeeListFilter(String selectVal, RowBounds rowBounds, int cp_no);

	/**
	 * @param 부서 이름
	 * @return 가져온 부서에 해당하는 직원 리스트
	 * @author ybseo
	 */
	public List<Employee> selectDeptEmployeeList(int cp_no, String dept_name);
	
	/**
	 * @param 사원 번호, 회사 번호
	 * @return 직원 상세 정보
	 * @author ybseo
	 */
	public Employee selectEmployee(String emp_no, int cp_no);
	
	/**
	 * @param 회사 번호
	 * @return 부서명 리스트
	 * @author ybseo
	 */
	public List<String> selectDeptList(int cp_no);
	
	/**
	 * @param 회사 번호
	 * @return 부서명 리스트
	 * @author ybseo
	 */
	public List<String> selectAdminDeptList(int cp_no);
	
	/**
	 * @param 회사 번호
	 * @return 부서 모든 정보 리스트
	 * @author ybseo
	 */
	public List<Dept> selectDeptAllList(int cp_no);
	
	/**
	 * @param 회사 번호
	 * @return 직위 리스트
	 * @author ybseo
	 */
	public List<String> selectJobList(int cp_no);
	
	/**
	 * @param 회사 번호, 사원 번호, 부서명, 직급, 내선번호, 퇴사 여부
	 * @return 업데이트 결과값 (성공 여부)
	 * @author ybseo
	 */
	public int updateEmployee(int cp_no, int e_no, String dept_name, String job_title, String intl_no, String resign_yn);
	
	/**
	 * @param Map (이름, 비밀번호, 이메일, 전화번호, 부서 이름, 직급, 내선 번호, 회사 번호)
	 * @return insert 결과값 (성공 여부)
	 * @author ybseo
	 */
	public int insertEmployee(HashMap<String, Object> map);
	
	/**
	 * @param 회사 번호
	 * @return 관리자 권한이 'Y'인 직원 리스트
	 * @author ybseo
	 */
	public List<Employee> selectAdminList(int cp_no);
	
	/**
	 * @param 회사 번호, 부서 이름
	 * @return update 결과값 (성공 여부)
	 * @author ybseo
	 */
	public int updateAdmin(int cp_no, String dept_name);
	
	/**
	 * @param 회사 번호, 부서 번호
	 * @return 가져온 부서 번호에 해당하는 부서 정보
	 * @author ybseo
	 */
	public Dept selectOneDepartment(int cp_no, int dept_no);
	
	/**
	 * @param 회사 번호, 부서명, 부서 번호(부모 부서 번호)
	 * @return update 결과값 (성공 여부)
	 * @author ybseo
	 */
	public int insertDepartment(int cp_no, String dept_name, int dept_upper_no);
	
	/**
	 * @param 회사 번호, 부서명, 사원 번호(부서 담장자), 부서명(부모 부서 부서명), 부서 활성화 여부
	 * @return 가update 결과값 (성공 여부)
	 * @author ybseo
	 */
	public int updateDepartment(int cp_no, String dept_name, int emp_no, String dept_upper_name, String active_yn, int dept_no);
	
	/**
	 * @param 회사 번호, RowBounds
	 * @return 회사 공지사항 리스트 (작성일 순)
	 * @author ybseo
	 */
	public List<Notice> selectListNotice(int cp_no, RowBounds rowBounds);
	
	/**
	 * @param 회사 번호, 공지사항 정보
	 * @return 공지사항
	 * @author ybseo
	 */
	public int insertNotice(Notice notice);
	
	/**
	 * @param 회사 번호, 공지사항 번호
	 * @return 공지사항 정보
	 * @author ybseo
	 */
	public Notice selectNotice(int cp_no, String nt_no);
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * @param Attendance
	 * @return 근태 정보 리스트
	 * @author Jinjeong Lee
	 */
	public List<Attendance> selectAttendance(Attendance attendance);
	
	/**
	 * @param Attendance
	 * @return 근태 정보 수정 요청 리스트
	 * @author Jinjeong Lee
	 */
	public List<Attendance> selectApprovalAttendance(Attendance attendance);
	
	/**
	 * @param Attendance
	 * @return 주간 근태 정보 리스트
	 * @author Jinjeong Lee
	 */
	public List<Attendance> selectWeeklyAttendance(Attendance attendance);

	/**
	 * @param cp_no
	 * @return 부서명 리스트
	 * @author Jinjeong Lee
	 */
	public List<Employee> selectDept(int cp_no);
	/**
	 * @param cp_no
	 * @return 직원명 리스트
	 * @author Jinjeong Lee
	 */
	public List<Employee> selectEmp(int cp_no);
	
	/**
	 * @param cp_no
	 * @return 인사팀용 휴가 신청 리스트
	 * @author Jinjeong Lee
	 */
	public List<Vacation> selectVacation(Vacation vacation);
	
	/**
	 * @param 회사 번호, 사원 번호
	 * @return 업데이트 결과값 (성공 여부)
	 * @author Jinjeong Lee
	 */
	public int updateVacation(Vacation vacation);
	
	/**
	 * @param 회사 번호
	 * @return 근태, 휴가 정보 리스트
	 * @author Jinjeong Lee
	 */
	public List<Attendance> selectMonthlyAttendance(Attendance attendance);
	
	
}
