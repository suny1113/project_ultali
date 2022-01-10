package kr.co.jhta.ultali.dao;

import java.util.List;

import kr.co.jhta.ultali.dto.AppDto;
import kr.co.jhta.ultali.dto.MyClubDto;

public interface CreatedClubDaoInter {
	public List<AppDto> selectList(String mem_id);
	public void deleteApp(int app_no);
	public void insertMyClub(MyClubDto myclubdto);
}
