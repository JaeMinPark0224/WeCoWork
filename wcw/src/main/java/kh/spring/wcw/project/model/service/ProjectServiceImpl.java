package kh.spring.wcw.project.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.project.domain.Project;
import kh.spring.wcw.project.model.dao.ProjectDao;

@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	private ProjectDao dao;
		
	@Override
	public int insertProject(Project project) {
		return dao.insertProject(project);
	}

	@Override
	public int insertProjectEmp(Project project) {
		return dao.insertProjectEmp(project);
	}

	@Override
	public List<Project> selectListProject(int emp_no) {
		return dao.selectListProject(emp_no);
	}

	@Override
	public int insertFavoriteProject(Project project) {
		return dao.insertFavoriteProject(project);
	}

	@Override
	public int deleteFavoriteProject(Project project) {
		return dao.deleteFavoriteProject(project);
	}

	@Override
	public Project selectProject(int pr_no) {
		return dao.selectProject(pr_no);
	}

	@Override
	public Project selectEmpProject(Project project) {
		return dao.selectEmpProject(project);
	}

	@Override
	public List<Project> selectListBoardProject(Project project) {
		return dao.selectListBoardProject(project);
	}
	
	@Override
	public List<Project> selectListBoardFixProject(Project project) {
		return dao.selectListBoardFixProject(project);
	}

	@Override
	public int insertDoBoardProject(Project project) {
		return dao.insertDoBoardProject(project);
	}

	@Override
	public Project selectOneBoardProject(int pb_no) {
		return dao.selectOneBoardProject(pb_no);
	}

	@Override
	public int insertBoardFixProject(Project project) {
		return dao.insertBoardFixProject(project);
	}

	@Override
	public int deleteBoardFixProject(Project project) {
		return dao.deleteBoardFixProject(project);
	}

}
