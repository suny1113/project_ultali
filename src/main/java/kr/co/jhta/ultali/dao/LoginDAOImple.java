package kr.co.jhta.ultali.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.ultali.dto.MemberDTO;

@Repository
public class LoginDAOImple implements LoginDAO {

	@Autowired
	SqlSession ss;

	@Override
	public boolean checkLogin(Map<String, String> map) {
		return false;
	}

	@Override
	public String findId(Map<String, String> map) {
		return ss.selectOne("kr.co.jhta.ultali.login.findId", map);
	}

//	@Override
//	public MemberDTO checkPhoneNumber(String phone) {
//		return ss.selectOne("kr.co.jhta.ultali.login.findPhone",phone);
//	}

	@Override
	public void changePassword(Map<String, String> map) {
		ss.update("kr.co.jhta.ultali.login.modifyPw", map);
		
	}

	
	

}
