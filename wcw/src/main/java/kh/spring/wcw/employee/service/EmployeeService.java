package kh.spring.wcw.employee.service;

import java.util.List;

import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.notice.domain.Notice;

public interface EmployeeService {
	public Employee selectEmployee(String id, String password);

}
