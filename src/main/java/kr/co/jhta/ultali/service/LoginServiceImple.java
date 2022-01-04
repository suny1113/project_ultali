package kr.co.jhta.ultali.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.jhta.ultali.dao.LoginDAO;
import kr.co.jhta.ultali.dto.MemberDTO;

@Service("loginServiceImple")
public class LoginServiceImple implements LoginService {

	@Autowired
	LoginDAO dao;
	
	
	@Override
	public boolean isExistAccount(HashMap<String, String> map) {
		return dao.checkLogin(map);
	}


	@Override
	public String findUserId(MemberDTO dto) {
		return dao.findId(dto);
	}


	@Override
	public MemberDTO findPhoneNumber(String phone) {
		return dao.checkPhoneNumber(phone);
	}


	@Override
	public void modfiyPassword(HashMap<String, String> map) {
		dao.changePassword(map);
		
	}


	



	

}
