package kr.co.jhta.ultali.dao;

import java.util.Map;

import kr.co.jhta.ultali.dto.MemberDTO;

public interface LoginDAO {

	boolean checkLogin(Map<String, String> map);
	String findId(Map<String, String> map);
//	MemberDTO checkPhoneNumber(String phone);
	void changePassword(Map<String, String> map);
}
