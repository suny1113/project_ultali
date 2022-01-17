package kr.co.jhta.ultali.service;

import java.util.Map;

import kr.co.jhta.ultali.dto.RegisterDTO;

public interface RegisterService {
	public void register(RegisterDTO dto);
	public void addAuth(Map<String, String> map);
	public int userIdCheck(String mem_id);
}
