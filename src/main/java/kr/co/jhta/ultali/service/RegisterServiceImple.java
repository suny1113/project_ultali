package kr.co.jhta.ultali.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.ultali.dao.RegisterDAO;
import kr.co.jhta.ultali.dto.RegisterDTO;

@Service
public class RegisterServiceImple implements RegisterService {

	@Autowired
	RegisterDAO dao;
	private SqlSessionTemplate memSqlSessin;


	// setter

	public void setDao(RegisterDAO dao) {
		this.dao = dao;
	}

	@Override
	public void register(RegisterDTO dto) {
		dao.insertOne(dto);
	}
	
	// 중복 아이디 체크
	public int userIdCheck(String mem_id) {

	dao = memSqlSessin.getMapper(RegisterDAO.class);

	return dao.checkOverId(mem_id);
		}

	@Override
	public void addAuth(Map<String, String> map) {
	
	dao.addOne(map);	
		
	}
	}
