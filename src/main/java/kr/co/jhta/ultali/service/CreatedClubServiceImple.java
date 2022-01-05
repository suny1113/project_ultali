package kr.co.jhta.ultali.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.ultali.dao.CreatedClubDaoInter;
import kr.co.jhta.ultali.dto.AppDto;
import kr.co.jhta.ultali.dto.MyClubDto;

@Service
public class CreatedClubServiceImple implements CreatedClubServiceInter{

	@Autowired
	CreatedClubDaoInter createdClubDaoInter;
	
	public void setCreatedClubDaoInter(CreatedClubDaoInter createdClubDaoInter) {
		this.createdClubDaoInter = createdClubDaoInter;
	}

	@Override
	public List<AppDto> showList(String mem_id) {
		return createdClubDaoInter.selectList(mem_id);
	}

	@Override
	public void applyApp(int app_no) {
		createdClubDaoInter.deleteApp(app_no);
	}

	@Override
	public void insertMyClub(MyClubDto myclubdto) {
		createdClubDaoInter.insertMyClub(myclubdto);
	}
	
}
