package kh.spring.wcw.employee.service;

import java.sql.Date;
import java.util.List;

import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.notice.domain.Notice;

/**
 *   직원 서비스 
 *   */
public interface EmployeeService {
	/**
	 * @param id(email), pwd
	 * @return 직원 정보
	 * @author ybseo
	 */
	public Employee selectEmployee(String id, String password);
	
	/**
	 * @param id(email), 세션id, 세션 유효기간
	 * @return 자동 로그인 세션 및 유효기간 UPDATE 후 결과값 - 성공 여부(int)
	 * @author ybseo
	 */
	public int autologin(String uid, String sessionId, Date next);
	
	/**
	 * @param 세션id
	 * @return 직원 정보
	 * @author ybseo
	 */
	// 유효기간이 넘지 않은 세션을 가지고 있는지 체크
	public Employee checkSessionKey(String sessionId);
	
	/**
	 * @param id(email)
	 * @return 난수 INSERT 후 결과값 - 성공 여부(int)
	 * @author ybseo
	 */
	public int insertRandomNum(String email);
	
	/**
	 * @param id(email)
	 * @return 난수 UPDATE 후 결과값 - 성공 여부(int)
	 * @author ybseo
	 */
	public int updateRandomNum(String email);
	
	/**
	 * @param id(email)
	 * @return 이메일에 맞는 난수 값
	 * @author ybseo
	 */
	public String selectRandomNum(String email);
	
	/**
	 * @param cp_name(회사명), id(email), name(성명)
	 * @return 직원 비밀번호 정보
	 * @author ybseo
	 */
	public String selectEmployeePwd(String cp_name, String email, String name);
	
	

}
