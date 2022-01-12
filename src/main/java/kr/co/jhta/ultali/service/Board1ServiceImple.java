package kr.co.jhta.ultali.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.ultali.dao.Board1DAO;
import kr.co.jhta.ultali.dto.ClubDTO;

@Service
public class Board1ServiceImple implements Board1Service {
	
	@Autowired
	Board1DAO dao;
	
	
	public void setDao(Board1DAO dao) {
		this.dao = dao;
	}

	@Override
	public List<ClubDTO> selectClubList_major(int major_no) {
		return dao.selectAll_major(major_no);
	}

}
