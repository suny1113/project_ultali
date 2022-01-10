package kr.co.jhta.ultali.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.ultali.dto.AppDto;
import kr.co.jhta.ultali.dto.MyClubDto;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CreatedClubDaoImple implements CreatedClubDaoInter {

	@Autowired
	SqlSession ss;
	
	@Override
	public List<AppDto> selectClubList(String mem_id) {
		return ss.selectList("kr.co.jhta.ultali.createdclub.selectClubList",mem_id);
	}

	@Override
	public List<AppDto> selectAppList(int c_no) {
		log.info("dao 도달");
		return ss.selectList("kr.co.jhta.ultali.createdclub.selectAppList",c_no);
	}

	@Override
	public void deleteApp(int app_no) {
		ss.delete("kr.co.jhta.ultali.createdclub.deleteOne",app_no);
	}

	@Override
	public void insertMyClub(MyClubDto myclubdto) {
		// TODO Auto-generated method stub
		ss.insert("kr.co.jhta.ultali.createdclub.insertMyClub",myclubdto);
	}
	
}
