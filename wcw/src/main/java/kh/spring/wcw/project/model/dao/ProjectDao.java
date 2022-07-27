package kh.spring.wcw.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	
	public int deleteProject(int pr_no) {
		return sqlsession.delete("Project.deleteProject", pr_no);
	}
	
	public List<Project> selectListProject(int emp_no) {
		return sqlsession.selectList("Project.selectListProject", emp_no);
	}
	
	public List<Project> selectListProject(int emp_no, RowBounds rowbounds) {
		return sqlsession.selectList("Project.selectListProject", emp_no, rowbounds);
	}
	
	public int selectCntProject(int emp_no) {
		return sqlsession.selectOne("Project.selectCntProject", emp_no);
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
	
	public int deleteBoardProject(int pb_no) {
		return sqlsession.delete("Project.deleteBoardProject", pb_no);
	}
	
	public int updateBoardProject(Project project) {
		return sqlsession.update("Project.updateBoardProject", project);
	}
	
	public int insertBoardFixProject(Project project) {
		return sqlsession.insert("Project.insertBoardFixProject", project);
	}
	
	public int deleteBoardFixProject(Project project) {
		return sqlsession.delete("Project.deleteBoardFixProject", project);
	}
	
	public int insertNoticeProject(Project project) {
		return sqlsession.insert("Project.insertNoticeProject", project);
	}
	
	public List<Project> selectListNoticeProject(Project project) {
		return sqlsession.selectList("Project.selectListNoticeProject", project);
	}
	
	public Project selectOneNoticeProject(Project project) {
		return sqlsession.selectOne("Project.selectOneNoticeProject", project);
	}
	
	public int insertWorkProject(Project project) {
		return sqlsession.insert("Project.insertWorkProject", project);
	}
	
	public List<Project> selectListWorkProject(Project project) {
		return sqlsession.selectList("Project.selectListWorkProject", project);
	}
	
	public List<Project> selectListSubWorkProject(int pw_no) {
		return sqlsession.selectList("Project.selectListSubWorkProject", pw_no);
	}
	
	public Project selectOneWorkProject(int pw_no) {
		return sqlsession.selectOne("Project.selectOneWorkProject", pw_no);
	}
	
	public int deleteWorkProject(int pw_no) {
		return sqlsession.delete("Project.deleteWorkProject", pw_no);
	}
	
	public int updateWorkProject(Project project) {
		return sqlsession.update("Project.updateWorkProject", project);
	}
	
	public int deleteWorkParticipantProject(int pw_no) {
		return sqlsession.delete("Project.deleteWorkParticipantProject", pw_no);
	}
	
	public int insertWorkParticipantProject(Project project) {
		return sqlsession.insert("Project.insertWorkParticipantProject", project);
	}
	
	public List<Project> selectListWorkEmpProject(int pw_no) {
		return sqlsession.selectList("Project.selectListWorkEmpProject", pw_no);
	}
	
	public List<Project> selectListParticipantProject(int pr_no, String authority) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pr_no", pr_no);
		map.put("pr_emp_authority", authority);
		return sqlsession.selectList("Project.selectListParticipantProject", map);
	}
	
	public List<String> selectListDeptProject(int pr_no, String authority) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pr_no", pr_no);
		map.put("pr_emp_authority", authority);
		return sqlsession.selectList("Project.selectListDeptProject", map);
	}
	
	public int insertParticipantProject(Project project) {
		return sqlsession.insert("Project.insertParticipantProject", project);
	}
	
	public int updateParticipantProject(Project project) {
		return sqlsession.update("Project.updateParticipantProject", project);
	}
	
	public int deleteParticipantProject(Project project) {
		return sqlsession.update("Project.deleteParticipantProject", project);
	}
	
	public List<Project> selectListTodoProject(Project project) {
		return sqlsession.selectList("Project.selectListTodoProject", project);
	}
	
	public int insertTodoProject(Project project) {
		return sqlsession.insert("Project.insertTodoProject", project);
	}
	
	public int updateTodoProject(Project project) {
		return sqlsession.update("Project.updateTodoProject", project);
	}
	
	public int deleteTodoProject(int pt_no) {
		return sqlsession.delete("Project.deleteTodoProject", pt_no);
	}
	
	public List<Project> selectListCalendarProject(Project project) {
		return sqlsession.selectList("Project.selectListCalendarProject", project);
	}
	
	public List<Project> selectListFolderProject(int pr_no) {
		return sqlsession.selectList("Project.selectListFolderProject", pr_no);
	}
	
	public int insertFolderProject(Project project) {
		return sqlsession.insert("Project.insertFolderProject", project);
	}
	
	public int updateFolderProject(Project project) {
		return sqlsession.insert("Project.updateFolderProject", project);
	}
	
	public List<Project> selectListFileProject(int no, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("type", type);
		return sqlsession.selectList("Project.selectListFileProject", map);
	}
	
	public int updateFileProject(Project project) {
		return sqlsession.update("Project.updateFileProject", project);
	}
	
	public int insertFileProject(Project project) {
		return sqlsession.insert("Project.insertFileProject", project);
	}
	
	public int deleteFileProject(Project project) {
		return sqlsession.delete("Project.deleteFileProject", project);
	}
	
	public int insertCommentProject(Project project) {
		return sqlsession.insert("Project.insertCommentProject", project);
	}
	
	public List<Project> selectListCommentProject(Project project) {
		return sqlsession.selectList("Project.selectListCommentProject", project);
	}
	
	public int deleteCommentProject(int pc_no) {
		return sqlsession.delete("Project.deleteCommentProject", pc_no);
	}
	
	public int updateCommentProject(Project project) {
		return sqlsession.update("Project.updateCommentProject", project);
	}
}
