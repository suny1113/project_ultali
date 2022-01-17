package kr.co.jhta.ultali.service;

import java.util.HashMap;
import java.util.List;


import kr.co.jhta.ultali.dto.AppDto;
import kr.co.jhta.ultali.dto.MyClubDto;

public interface CreatedClubServiceInter {
	public List<AppDto> showClubList(String mem_id);
	public List<AppDto> showAppList(int cNo, int startNo, int endNo);
	public void applyApp(int app_no);
	public void insertMyClub(MyClubDto myclubdto);
	public int applicantTotalPage(int c_no);
	public List<AppDto> showWishList(String mem_id);
	public List<AppDto> myClubList(String mem_id);
	public List<AppDto> recentList(List list);
	public void deleteClubList(String mem_id);
}
