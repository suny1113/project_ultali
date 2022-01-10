package kr.co.jhta.ultali.dao;

import java.util.HashMap;

import kr.co.jhta.ultali.dto.MemberDTO;

public interface LoginDAO {

	boolean checkLogin(HashMap<String, String> map);
	String findId(MemberDTO dto);
	MemberDTO checkPhoneNumber(String phone);
	void changePassword(HashMap<String, String> map);
}
