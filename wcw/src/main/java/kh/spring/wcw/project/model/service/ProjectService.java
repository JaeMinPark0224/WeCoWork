package kh.spring.wcw.project.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kh.spring.wcw.project.domain.Project;

/**
 * 
 * @author jaemin
 * 프로젝트 서비스 인터페이스
 *
 */
public interface ProjectService {
	
	public int insertProject(Project project);
	
	public int insertProjectEmp(Project project);
	
	public List<Project> selectListProject(int emp_no);
	
	public int insertFavoriteProject(Project project);
	
	public int deleteFavoriteProject(Project project);
	
	public Project selectProject(int pr_no);
	
	public Project selectEmpProject(Project project);
	
	public List<Project> selectListBoardProject(Project project);
	
	public List<Project> selectListBoardFixProject(Project project);
	
	public int insertDoBoardProject(Project project);
	
	public Project selectOneBoardProject(int pb_no);
	
	public int insertBoardFixProject(Project project);
	
	public int deleteBoardFixProject(Project project);
}
