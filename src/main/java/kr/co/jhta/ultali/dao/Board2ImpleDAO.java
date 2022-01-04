package kr.co.jhta.ultali.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.ultali.dto.ClubDTO;
import kr.co.jhta.ultali.dto.ReportDTO;

@Repository
public class Board2ImpleDAO implements Board2DAO{

	@Autowired
	SqlSession ss;
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public ClubDTO selectClub(int c_no) {
		return ss.selectOne("kr.co.jhta.boardDetailMapper.getOneClub", c_no);
	}

	@Override
	public void insertClub(ClubDTO dto) {
		ss.insert("kr.co.jhta.boardDetailMapper.insertClub", dto);
		
	}

	@Override
	public List<ClubDTO> selectAllClub() {
		return ss.selectList("kr.co.jhta.boardDetailMapper.getAllClub");
		
	}

	// 이미지파일 이름 중복처리를 위한 메서드
	@Override
	public int imgFileNameDedup() {
		return ss.selectOne("kr.co.jhta.boardDetailMapper.getClubColumnCount"); 
	}

	@Override
	public void deleteClub(int c_no) {
		ss.delete("kr.co.jhta.boardDetailMapper.deleteClub", c_no);
		
	}

	@Override
	public void updateClub(ClubDTO dto) {
		ss.update("kr.co.jhta.boardDetailMapper.modifyClub", dto);
		
	}

	
	


}
