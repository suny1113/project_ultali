package kr.co.jhta.ultali.service;

import java.util.List;


import kr.co.jhta.ultali.dto.AppDto;
import kr.co.jhta.ultali.dto.MyClubDto;

public interface CreatedClubServiceInter {
	public List<AppDto> showList(String mem_id);
	public void applyApp(int app_no);
	public void insertMyClub(MyClubDto myclubdto);
}
