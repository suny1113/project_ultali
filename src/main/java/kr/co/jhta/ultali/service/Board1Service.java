package kr.co.jhta.ultali.service;

import java.util.List;

import kr.co.jhta.ultali.dto.AppDto;
import kr.co.jhta.ultali.dto.ClubDTO;
import kr.co.jhta.ultali.dto.PagingDTO;

public interface Board1Service {

//	public List<ClubDTO> selectClubList_major(int major_no);
	public int countClubService(int c_no);
    public List<ClubDTO> selectClubService(PagingDTO dto);
    public void deleteClub(String c_no);
    public void insertApply(AppDto dto);
    public List<ClubDTO> selectTopClub(int major_no);
    public List<ClubDTO> selectTopSort(PagingDTO dto);
	
}
