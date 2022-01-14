package kr.co.jhta.ultali.service;

import kr.co.jhta.ultali.dto.RegisterDTO;

public interface RegisterService {
	public void register(RegisterDTO dto);
	public int userIdCheck(String mem_id);
}
