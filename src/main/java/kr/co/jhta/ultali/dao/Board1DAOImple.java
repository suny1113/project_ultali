package kr.co.jhta.ultali.dao;

import java.util.List;	

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.ultali.dto.AppDto;
import kr.co.jhta.ultali.dto.ClubDTO;
import kr.co.jhta.ultali.dto.PagingDTO;

@Repository
public class Board1DAOImple implements Board1DAO {
	
	@Autowired
	SqlSession ss;
	
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

//	@Override
//	public List<ClubDTO> selectAll_major(int major_no) {
//		return ss.selectList("kr.co.jhta.ultali.board1.selectAll_major", major_no);
//	}

	@Override
	public int countInquiry(int c_no) {
		return ss.selectOne("kr.co.jhta.ultali.board1.countBoard", c_no);
	}

	@Override
	public List<ClubDTO> selectInquiry(PagingDTO dto) {
		return ss.selectList("kr.co.jhta.ultali.board1.selectBoard", dto);
	}

	@Override
	public void delete(String c_no) {
		ss.delete("kr.co.jhta.ultali.board1.deleteBoard", c_no);
	}

	@Override
	public void apply(AppDto dto) {
		ss.insert("kr.co.jhta.ultali.board1.insertApp", dto);
	}

	@Override
	public List<ClubDTO> selectTopClub(int major_no) {
		return ss.selectList("kr.co.jhta.ultali.board1.selectTop", major_no);
	}

	@Override
	public List<ClubDTO> selectClubList_top(PagingDTO dto) {
		return ss.selectList("kr.co.jhta.ultali.board1.selectListSort0", dto);
	}

}
