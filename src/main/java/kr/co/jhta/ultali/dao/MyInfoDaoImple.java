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

	@Override
	public MyInfoDto selectOne(String id) {
		System.out.println("Sql ss :"+ss);
		return ss.selectOne("kr.co.jhta.ultali.showInfo",id);
	}

	@Override
	public void modify(String id) {
		System.out.println("Sql ss :"+ss);
		ss.update("kr.co.jhta.ultali.modifyOne",id);
	}

	@Override
	public void deleteOne(String id) {
		System.out.println("Sql ss :"+ss);
		ss.delete("kr.co.jhta.ultali.deleteOne",id);
	}
	
}
