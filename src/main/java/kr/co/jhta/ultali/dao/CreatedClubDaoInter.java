package kr.co.jhta.ultali.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;

import kr.co.jhta.ultali.dto.AppDto;
import kr.co.jhta.ultali.dto.CNoStartEnd;
import kr.co.jhta.ultali.dto.MyClubDto;
import kr.co.jhta.ultali.dto.WishDTO;

public interface CreatedClubDaoInter {
	public List<AppDto> selectClubList(String mem_id);
	public List<AppDto> selectAppList(int cNo, int startNo, int endNo);
	public void deleteApp(int app_no);
	public void insertMyClub(MyClubDto myclubdto);
	public int applicantTotalPage(int c_no);
	public List<AppDto> selectWishList(String mem_id);
	public List<AppDto> myClubList(String mem_id);
//	public List<AppDto> recentList(HashMap<String , String> hm);
	public List<AppDto> recentList(List list);
	
	public void deleteClubList(String mem_id);
}
