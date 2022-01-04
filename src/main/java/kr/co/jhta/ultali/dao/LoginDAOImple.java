package kr.co.jhta.ultali.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.ultali.dto.MemberDTO;

@Repository
public class LoginDAOImple implements LoginDAO {

	@Autowired
	SqlSession ss;

	@Override
	public boolean checkLogin(HashMap<String, String> map) {
		return false;
	}

	@Override
	public String findId(MemberDTO dto) {
		return ss.selectOne("kr.co.jhta.ultali.login.findId", dto);
	}

	@Override
	public MemberDTO checkPhoneNumber(String phone) {
		return ss.selectOne("kr.co.jhta.ultali.login.findPhone",phone);
	}

	@Override
	public void changePassword(HashMap<String, String> map) {
		ss.update("kr.co.jhta.ultali.login.modifyPw", map);
		
	}

	
	

}
