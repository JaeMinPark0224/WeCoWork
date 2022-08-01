package kh.spring.wcw.project.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public int deleteProject(int pr_no) {
		return dao.deleteProject(pr_no);
	}
	
	@Override
	public int insertProjectEmp(Project project) {
		return dao.insertProjectEmp(project);
	}
	
	@Override
	public int updateProject(Project project) {
		return dao.updateProject(project);
	}
	
	@Override
	public int completeProject(int pr_no) {
		return dao.completeProject(pr_no);
	}

	@Override
	public List<Project> selectListProject(int emp_no) {
		return dao.selectListProject(emp_no);
	}
	
	@Override
	public List<Project> selectListProject(int emp_no, String option, String search, RowBounds rowbounds) {
		return dao.selectListProject(emp_no, option, search, rowbounds);
	}
	
	@Override
	public int selectCntProject(int emp_no, String option, String search) {
		return dao.selectCntProject(emp_no, option, search);
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
	public List<Project> selectListBoardProject(Project project, RowBounds rowbounds) {
		return dao.selectListBoardProject(project, rowbounds);
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
	public int deleteBoardProject(int pb_no) {
		return dao.deleteBoardProject(pb_no);
	}
	
	@Override
	public int updateBoardProject(Project project) {
		return dao.updateBoardProject(project);
	}

	@Override
	public int insertBoardFixProject(Project project) {
		return dao.insertBoardFixProject(project);
	}

	@Override
	public int deleteBoardFixProject(Project project) {
		return dao.deleteBoardFixProject(project);
	}

	@Override
	public int insertNoticeProject(Project project) {
		return dao.insertNoticeProject(project);
	}
	
	@Override
	public int deleteNoticeProject(int pn_no) {
		return dao.deleteNoticeProject(pn_no);
	}
	
	@Override
	public int updateNoticeProject(Project project) {
		return dao.updateNoticeProject(project);
	}

	@Override
	public List<Project> selectListNoticeProject(Project project) {
		return dao.selectListNoticeProject(project);
	}

	@Override
	public Project selectOneNoticeProject(Project project) {
		return dao.selectOneNoticeProject(project);
	}

	@Override
	public int insertWorkProject(Project project) {
		return dao.insertWorkProject(project);
	}

	@Override
	public List<Project> selectListWorkProject(Project project) {
		return dao.selectListWorkProject(project);
	}

	@Override
	public List<Project> selectListSubWorkProject(int pw_no) {
		return dao.selectListSubWorkProject(pw_no);
	}

	
	@Override
	public Project selectOneWorkProject(int pw_no) {
		return dao.selectOneWorkProject(pw_no);
	}
	
	@Override
	public int deleteWorkProject(int pw_no) {
		return dao.deleteWorkProject(pw_no);
	}
	
	@Override
	@Transactional
	public int updateWorkProject(Project project) {
		dao.deleteWorkParticipantProject(project.getPw_no());
		dao.insertWorkParticipantProject(project);
		return dao.updateWorkProject(project);
	}
	
	@Override
	public List<Project> selectListWorkEmpProject(int pw_no) {
		return dao.selectListWorkEmpProject(pw_no);
	}

	@Override
	public List<Project> selectListParticipantProject(int pr_no, String authority) {
		return dao.selectListParticipantProject(pr_no, authority);
	}
	
	@Override
	public List<Project> selectListParticipantProject(int pr_no) {
		return dao.selectListParticipantProject(pr_no);
	}

	@Override
	public List<String> selectListDeptProject(int pr_no, String authority) {
		return dao.selectListDeptProject(pr_no, authority);
	}

	@Override
	public int insertParticipantProject(Project project) {
		return dao.insertParticipantProject(project);
	}

	@Override
	public int updateParticipantProject(Project project) {
		return dao.updateParticipantProject(project);
	}

	@Override
	public int deleteParticipantProject(Project project) {
		return dao.deleteParticipantProject(project);
	}

	@Override
	public List<Project> selectListTodoProject(Project project) {
		return dao.selectListTodoProject(project);
	}

	@Override
	public int insertTodoProject(Project project) {
		return dao.insertTodoProject(project);
	}

	@Override
	@Transactional
	public int updateTodoProject(Project project) {
		return dao.updateTodoProject(project);
	}

	@Override
	public int deleteTodoProject(int pt_no) {
		return dao.deleteTodoProject(pt_no);
	}
	
	@Override
	public List<Project> selectListCalendarProject(Project project) {
		return dao.selectListCalendarProject(project);
	}

	@Override
	public List<Project> selectListFolderProject(int pr_no) {
		return dao.selectListFolderProject(pr_no);
	}

	@Override
	public int insertFolderProject(Project project) {
		return dao.insertFolderProject(project);
	}

	@Override
	public int updateFolderProject(Project project) {
		return dao.updateFolderProject(project);
	}

	@Override
	public List<Project> selectListFileProject(int no, String type) {
		return dao.selectListFileProject(no, type);
	}

	@Override
	public int updateFileProject(Project project) {
		return dao.updateFileProject(project);
	}

	@Override
	public int insertFileProject(Project project) {
		return dao.insertFileProject(project);
	}

	@Override
	public int deleteFileProject(Project project) {
		return dao.deleteFileProject(project);
	}

	@Override
	public int insertCommentProject(Project project) {
		return dao.insertCommentProject(project);
	}

	@Override
	public List<Project> selectListCommentProject(Project project) {
		return dao.selectListCommentProject(project);
	}

	@Override
	public int deleteCommentProject(int pc_no) {
		return dao.deleteCommentProject(pc_no);
	}

	@Override
	public int updateCommentProject(Project project) {
		return dao.updateCommentProject(project);
	}

	@Override
	public List<Project> selectListMyCalendarProject(int emp_no) {
		return dao.selectListMyCalendarProject(emp_no);
	}

	@Override
	public int selectCntBoardProject(int pr_no) {
		return dao.selectCntBoardProject(pr_no);
	}

	@Override
	public int selectCntWorkProject(int pr_no) {
		return dao.selectCntWorkProject(pr_no);
	}

	@Override
	public List<String> selectListUpperWorkProject(int pr_no, RowBounds rowbounds) {
		return dao.selectListUpperWorkProject(pr_no, rowbounds);
	}

}
