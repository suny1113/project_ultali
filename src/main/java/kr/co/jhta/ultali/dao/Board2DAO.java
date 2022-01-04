package kr.co.jhta.ultali.dao;

import java.util.List;

import kr.co.jhta.ultali.dto.ClubDTO;
import kr.co.jhta.ultali.dto.ReportDTO;

public interface Board2DAO {
	
	// board
	public ClubDTO selectClub(int c_no);
	public void insertClub(ClubDTO dto);
	public List<ClubDTO> selectAllClub();
	public int imgFileNameDedup();
	public void deleteClub(int c_no);
	public void updateClub(ClubDTO dto);
	
	
	

}
