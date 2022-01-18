package kr.co.jhta.ultali.service;

import java.util.List;

import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.ultali.controller.UploadFile;
import kr.co.jhta.ultali.dto.ClubDTO;
import kr.co.jhta.ultali.dto.ClubInquiryAnswerDTO;
import kr.co.jhta.ultali.dto.ClubInquiryDTO;
import kr.co.jhta.ultali.dto.PagingDTO;
import kr.co.jhta.ultali.dto.WishDTO;

public interface BoardService {
	public ClubDTO selectOneClubService(int c_no);
	public ModelAndView insertClubService(ClubDTO dto, String date, String date2, UploadFile file, BindingResult result, int major_no);
	public List<ClubDTO> selectAllClubService();
	public void deleteClubService(int c_no);
	public ModelAndView updateClubService(ClubDTO dto, String date, String date2, UploadFile file, BindingResult result, int c_no, int major_no);
	
	public boolean getWishService(WishDTO dto);
	public void insertWishService(WishDTO dto);
	public void deleteWishService(WishDTO dto);
	
	public void insertClubInquiryService(ClubInquiryDTO cidto);
	public List<ClubInquiryDTO> getAllClubInquiryService(int c_no);

	public int countInquiryService(int c_no);
	public List<ClubInquiryDTO> selectInquiryService(PagingDTO dto);
	
	public void insertAnswerService(ClubInquiryAnswerDTO ciadto);
	public List<ClubInquiryAnswerDTO> getAnswerService(String mem_id, int c_no);
	public ClubInquiryAnswerDTO getOneAnswerService(int c_inq_no);
	
	//헤더 search
	public List<ClubDTO> searchClub(String word);
	
	//search count
	public int countSearchClub(String word);
	
	//hits club
	public List<ClubDTO> hitsClub();
	
	public void increaseHitsService(int c_no);
}