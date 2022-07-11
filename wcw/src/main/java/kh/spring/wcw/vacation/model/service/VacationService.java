package kh.spring.wcw.vacation.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.vacation.domain.Vacation;
import kh.spring.wcw.vacation.model.dao.VacationDao;


@Service
public class VacationService {
	@Autowired
	private VacationDao dao;
	
	public int insertVacation(Vacation vacation) {
		return dao.insertVacation(vacation);
	}
	
	public List<Vacation> selectVacation(Vacation vacation){
		return dao.selectVacation(vacation);
	}
}
