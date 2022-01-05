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
	public int nicknameCheck(String new_nickname) {
		int cnt = ss.selectOne(namespace+".",new_nickname);
		return 0;
	}

	@Override
	public void modify(String id) {
		System.out.println("Sql ss :"+ss);
		ss.update(namespace+".modifyOne",id);
	}

	@Override
	public void deleteOne(String id) {
		System.out.println("Sql ss :"+ss);
		ss.delete(namespace+".deleteOne",id);
	}
	
}
