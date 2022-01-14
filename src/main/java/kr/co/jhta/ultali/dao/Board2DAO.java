package kr.co.jhta.ultali.dao;

import java.util.List;

import kr.co.jhta.ultali.dto.ClubDTO;
import kr.co.jhta.ultali.dto.ClubInquiryAnswerDTO;
import kr.co.jhta.ultali.dto.ClubInquiryDTO;
import kr.co.jhta.ultali.dto.PagingDTO;
import kr.co.jhta.ultali.dto.ReportDTO;
import kr.co.jhta.ultali.dto.WishDTO;

public interface Board2DAO {
	
	// board
	public ClubDTO selectClub(int c_no);
	public void insertClub(ClubDTO dto);
	public List<ClubDTO> selectAllClub();
	public int imgFileNameDedup();
	public void deleteClub(int c_no);
	public void updateClub(ClubDTO dto);
	
	public WishDTO getWish(WishDTO wdto);
	public void insertWish(WishDTO wdto);
	public void deleteWish(WishDTO wdto);
	
	public void insertClubInquiry(ClubInquiryDTO cidto);
	public List<ClubInquiryDTO> getAllClubInquiry(int c_no);
	
	public int countInquiry(int c_no);
	public List<ClubInquiryDTO> selectInquiry(PagingDTO dto);
	
	public void insertAnswer(ClubInquiryAnswerDTO ciadto);
	public ClubInquiryAnswerDTO getOneAnswer(int c_inq_no);
	public List<ClubInquiryAnswerDTO> getAnswer(ClubDTO dto);
	
	//헤더 search
	public List<ClubDTO> searchClub(String word);
	
	//search count
	public int countSearchClub(String word);
	
	//hits club
	public List<ClubDTO> hitsClub();
	public void increaseHits(int c_no);
	
	
}