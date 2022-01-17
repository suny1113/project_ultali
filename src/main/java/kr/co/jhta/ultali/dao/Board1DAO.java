package kr.co.jhta.ultali.dao;

import java.util.List;

import kr.co.jhta.ultali.dto.ClubDTO;
import kr.co.jhta.ultali.dto.ClubInquiryDTO;
import kr.co.jhta.ultali.dto.PagingDTO;

public interface Board1DAO {
	
	public List<ClubDTO> selectAll_major(int major_no);
	public int countInquiry(int c_no);
    public List<ClubDTO> selectInquiry(PagingDTO dto);
    public void delete(String c_no);
	
}
