package kr.co.jhta.ultali.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.ultali.dao.LoginDAO;
import kr.co.jhta.ultali.dto.MemberDTO;

@Service("loginServiceImple")
public class LoginServiceImple implements LoginService {

	@Autowired
	LoginDAO dao;
	
	
	@Override
	public boolean isExistAccount(Map<String, String> map) {
		return dao.checkLogin(map);
	}


	@Override
	public String findUserId(Map<String, String> map) {
		return dao.findId(map);
	}


//	@Override
//	public MemberDTO findPhoneNumber(String phone) {
//		return dao.checkPhoneNumber(phone);
//	}


	@Override
	public void modfiyPassword(Map<String, String> map) {
		dao.changePassword(map);
		
	}


	



	

}
