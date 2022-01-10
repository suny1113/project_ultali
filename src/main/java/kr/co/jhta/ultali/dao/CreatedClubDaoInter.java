package kr.co.jhta.ultali.dao;

import java.util.List;

import kr.co.jhta.ultali.dto.AppDto;
import kr.co.jhta.ultali.dto.MyClubDto;

public interface CreatedClubDaoInter {
	public List<AppDto> selectClubList(String mem_id);
	public List<AppDto> selectAppList(int c_no);
	public void deleteApp(int app_no);
	public void insertMyClub(MyClubDto myclubdto);
}
