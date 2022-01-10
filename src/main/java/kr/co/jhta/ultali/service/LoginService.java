package kr.co.jhta.ultali.service;

import java.util.Map;

import kr.co.jhta.ultali.dto.MemberDTO;

public interface LoginService {
	
	boolean isExistAccount(Map<String, String> map);
	String findUserId(Map<String, String> map);
//	MemberDTO findPhoneNumber(String phone);
	void modfiyPassword(Map<String, String> map);
}
