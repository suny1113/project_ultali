package kr.co.jhta.ultali.dao;

import java.util.List;	

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.ultali.dto.ClubDTO;

@Repository
public class Board1DAOImple implements Board1DAO {
	
	@Autowired
	SqlSession ss;
	
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public List<ClubDTO> selectAll_major(int major_no) {
		return ss.selectList("kr.co.jhta.ultali.board1.selectAll_major", major_no);
	}

}
