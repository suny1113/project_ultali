package kr.co.jhta.ultali.service;

import java.util.List;

import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.ultali.controller.UploadFile;
import kr.co.jhta.ultali.dto.ClubDTO;

public interface BoardService {
	public ClubDTO selectOneClubService(int c_no);
	public ModelAndView insertClubService(ClubDTO dto, String date, String date2, UploadFile file, BindingResult result);
	public List<ClubDTO> selectAllClubService();
	public void deleteClubService(int c_no);
	public void updateClubService(ClubDTO dto, String date, String date2);
}
