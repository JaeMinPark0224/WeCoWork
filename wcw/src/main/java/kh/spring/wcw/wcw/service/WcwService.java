package kh.spring.wcw.wcw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.wcw.dao.WcwDao;

@Service
public class WcwService {

	@Autowired
	private WcwDao wcwdao;
}
