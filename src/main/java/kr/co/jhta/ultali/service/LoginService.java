package kr.co.jhta.ultali.service;

import java.util.HashMap;

import kr.co.jhta.ultali.dto.MemberDTO;

public interface LoginService {
	
	boolean isExistAccount(HashMap<String, String> map);
	String findUserId(MemberDTO dto);
	MemberDTO findPhoneNumber(String phone);
	void modfiyPassword(HashMap<String, String> map);
}
