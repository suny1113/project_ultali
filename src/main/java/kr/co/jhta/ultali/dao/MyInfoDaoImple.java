package kr.co.jhta.ultali.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.ultali.dto.MyInfoDto;

// kr.co.jhta.ultali

@Repository
public class MyInfoDaoImple implements MyInfoDaoInter{

	@Autowired
	SqlSession ss;
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}
	
	private final String namespace = "kr.co.jhta.ultali.myinfo";  
	
	@Override
	public MyInfoDto selectOne(String id) {
		System.out.println("Sql ss :"+ss);
		return ss.selectOne(namespace+".showInfo",id);
	}
	
	@Override
	public int nicknameCheck(String new_id) {
		return ss.selectOne(namespace+".nicknameChk",new_id);
	}

	@Override
	public void modify(MyInfoDto dto) {
		System.out.println("Sql ss :"+ss);
		ss.update(namespace+".modifyOne",dto);
	}

	@Override
	public void deleteOne(String id) {
		System.out.println("Sql ss :"+ss);
		ss.delete(namespace+".deleteOne",id);
	}
	
}
