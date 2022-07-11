package kh.spring.wcw.vacation.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.vacation.domain.Vacation;

@Repository
public class VacationDao {
	@Autowired
	private SqlSession sqlsession;
	
	public int insertVacation(Vacation vacation) {
		return sqlsession.insert("Vacation.insertVacation", vacation);
	}
	
	public List<Vacation> selectVacation(Vacation vacation){
		return sqlsession.selectList("Vacation.selectVacation", vacation);
	}
}
