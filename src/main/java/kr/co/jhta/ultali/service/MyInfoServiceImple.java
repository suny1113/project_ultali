package kr.co.jhta.ultali.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.ultali.dao.MyInfoDaoInter;
import kr.co.jhta.ultali.dto.MyInfoDto;

@Service
public class MyInfoServiceImple implements MyInfoServiceInter{

	@Autowired
	MyInfoDaoInter myInfoDaoInter;
	
	
	public void setMyInfoDaoInter(MyInfoDaoInter myInfoDaoInter) {
		this.myInfoDaoInter = myInfoDaoInter;
	}

	@Override
	public MyInfoDto showInfo(String id) {
		return myInfoDaoInter.selectOne(id);
	}

	@Override
	public int nicknameCheck(String new_nickname) {
		return myInfoDaoInter.nicknameCheck(new_nickname);
	}
	
	
	@Override
	public void update(MyInfoDto dto) {
		myInfoDaoInter.modify(dto);
	}

	@Override
	public void delete(String id) {
		myInfoDaoInter.deleteOne(id);
	}
	
	
}
