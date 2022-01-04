package kr.co.jhta.ultali.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.ultali.dao.RegisterDAO;
import kr.co.jhta.ultali.dto.RegisterDTO;

@Service
public class RegisterServiceImple implements RegisterService {

	@Autowired
	RegisterDAO dao;

	// setter

	public void setDao(RegisterDAO dao) {
		this.dao = dao;
	}

	@Override
	public void register(RegisterDTO dto) {
		dao.insertOne(dto);
	}

}
