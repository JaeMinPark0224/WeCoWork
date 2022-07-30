package kh.spring.wcw.wcw.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WcwDao {
	
	@Autowired
	private SqlSession sqlsession;
}
