package kr.co.jhta.ultali.service;

import java.util.List;


import kr.co.jhta.ultali.dto.AppDto;
import kr.co.jhta.ultali.dto.CNoStartEnd;
import kr.co.jhta.ultali.dto.MyClubDto;
import kr.co.jhta.ultali.dto.WishDTO;

public interface CreatedClubServiceInter {
	public List<AppDto> showClubList(String mem_id);
	public List<AppDto> showAppList(int cNo, int startNo, int endNo);
	public void applyApp(int app_no);
	public void insertMyClub(MyClubDto myclubdto);
	public int applicantTotalPage(int c_no);
	public List<WishDTO> showWishList(String mem_id);
}
