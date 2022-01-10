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
		int cnt =myInfoDaoInter.nicknameCheck(new_nickname);
		return cnt;
	}
	
	
	@Override
	public void update(String mem_id) {
		myInfoDaoInter.modify(mem_id);
	}

	@Override
	public void delete(String id) {
		myInfoDaoInter.deleteOne(id);
	}
	
	
}
