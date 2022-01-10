package kr.co.jhta.ultali.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.ultali.dto.AppDto;
import kr.co.jhta.ultali.dto.MyClubDto;

@Repository
public class CreatedClubDaoImple implements CreatedClubDaoInter {

	@Autowired
	SqlSession ss;
	
	@Override
	public List<AppDto> selectList(String mem_id) {
		return ss.selectList("kr.co.jhta.ultali.createdclub.selectList",mem_id);
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
