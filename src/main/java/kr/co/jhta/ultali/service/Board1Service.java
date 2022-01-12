package kr.co.jhta.ultali.service;

import java.util.List;	

import kr.co.jhta.ultali.dto.ClubDTO;

public interface Board1Service {

	public List<ClubDTO> selectClubList_major(int major_no);
	
}
