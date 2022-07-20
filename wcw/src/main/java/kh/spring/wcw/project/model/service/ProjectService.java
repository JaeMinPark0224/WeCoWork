package kh.spring.wcw.project.model.service;

import java.util.List;

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
	
	public int insertNoticeProject(Project project);
	
	public List<Project> selectListNoticeProject(Project project);
	
	public Project selectOneNoticeProject(Project project);
	
	public int insertWorkProject(Project project);
	
	public List<Project> selectListWorkProject(Project project);
	
	public List<Project> selectListSubWorkProject(int pw_no);
	
	public Project selectOneWorkProject(int pw_no);
	
	public List<Project> selectListWorkEmpProject(int pw_no);
	
	public List<Project> selectListParticipantProject(int pr_no, String authority);
	
	public int insertParticipantProject(Project project);
	
	public List<String> selectListDeptProject(int pr_no, String authority);
	
	public int updateParticipantProject(Project project);
	
	public int deleteParticipantProject(Project project);
	
	public List<Project> selectListTodoProject(Project project);
	
	public int insertTodoProject(Project project);
	
	public int updateTodoProject(Project project);
	
	public List<Project> selectListCalendarProject(Project project);
	
	public List<Project> selectListFolderProject(int pr_no);
	
	public int insertFolderProject(Project project);
	
	public int updateFolderProject(Project project);
	
	public List<Project> selectListFileProject(int no, String type);
	
	public int updateFileProject(Project project);
}
