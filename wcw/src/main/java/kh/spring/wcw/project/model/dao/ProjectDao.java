package kh.spring.wcw.project.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.project.domain.Project;

@Repository
public class ProjectDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int insertProject(Project project) {
		return sqlsession.insert("Project.insertProject", project);
	}
	
	public int insertProjectEmp(Project project) {
		return sqlsession.insert("Project.insertProjectEmp", project);
	}
	
	public List<Project> selectListProject(int emp_no) {
		return sqlsession.selectList("Project.selectListProject", emp_no);
	}
	
	public int insertFavoriteProject(Project project) {
		return sqlsession.insert("Project.insertFavoriteProject", project);
	}
	
	public int deleteFavoriteProject(Project project) {
		return sqlsession.delete("Project.deleteFavoriteProject", project);
	}
	
	public Project selectProject(int pr_no) {
		return sqlsession.selectOne("Project.selectProject", pr_no);
	}
	
	public Project selectEmpProject(Project project) {
		return sqlsession.selectOne("Project.selectEmpProject", project);
	}
	
	public List<Project> selectListBoardProject(Project project) {
		return sqlsession.selectList("Project.selectListBoardProject", project);
	}
	
	public List<Project> selectListBoardFixProject(Project project) {
		return sqlsession.selectList("Project.selectListBoardFixProject", project);
	}
	
	public int insertDoBoardProject(Project project) {
		return sqlsession.insert("Project.insertDoBoardProject", project);
	}
	
	public Project selectOneBoardProject(int pb_no) {
		return sqlsession.selectOne("Project.selectOneBoardProject", pb_no);
	}
	
	public int insertBoardFixProject(Project project) {
		return sqlsession.insert("Project.insertBoardFixProject", project);
	}
	
	public int deleteBoardFixProject(Project project) {
		return sqlsession.delete("Project.deleteBoardFixProject", project);
	}
}
