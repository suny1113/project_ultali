package kr.co.jhta.ultali.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.ultali.dao.Board1DAO;
import kr.co.jhta.ultali.dto.AppDto;
import kr.co.jhta.ultali.dto.ClubDTO;
import kr.co.jhta.ultali.dto.PagingDTO;

@Service
public class Board1ServiceImple implements Board1Service {
	
	@Autowired
	Board1DAO dao;
	
	
	public void setDao(Board1DAO dao) {
		this.dao = dao;
	}

//	@Override
//	public List<ClubDTO> selectClubList_major(int major_no) {
//		return dao.selectAll_major(major_no);
//	}

	@Override
	public int countClubService(int c_no) {
		return dao.countInquiry(c_no);
	}

	@Override
	public List<ClubDTO> selectClubService(PagingDTO dto) {
		return dao.selectInquiry(dto);
	}

	@Override
	public void deleteClub(String c_no) {
		dao.delete(c_no);
	}

	@Override
	public void insertApply(AppDto dto) {
		dao.apply(dto);
	}

	@Override
	public List<ClubDTO> selectTopClub(int major_no) {
		return dao.selectTopClub(major_no);
	}

	@Override
	public List<ClubDTO> selectTopSort(PagingDTO dto) {
		return dao.selectClubList_top(dto);
	}

}
