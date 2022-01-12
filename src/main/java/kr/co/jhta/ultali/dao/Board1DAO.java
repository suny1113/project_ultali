package kr.co.jhta.ultali.dao;

import java.util.List;

import kr.co.jhta.ultali.dto.ClubDTO;

public interface Board1DAO {
	
	public List<ClubDTO> selectAll_major(int major_no);
	
}
