package kr.co.jhta.ultali.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.util.NestedServletException;

import kr.co.jhta.ultali.dto.ClubDTO;
import kr.co.jhta.ultali.dto.ClubInquiryAnswerDTO;
import kr.co.jhta.ultali.dto.ClubInquiryDTO;
import kr.co.jhta.ultali.dto.PagingDTO;
import kr.co.jhta.ultali.dto.ReportDTO;
import kr.co.jhta.ultali.dto.WishDTO;

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
	
	@Override
	public WishDTO getWish(WishDTO wdto) {
		if(ss.selectOne("kr.co.jhta.wish.getWish", wdto) == null) {
			return new WishDTO();
		}else {
			return ss.selectOne("kr.co.jhta.wish.getWish", wdto);
		}
		
		// 예외 처리를 하려고 했으나 try문에서 해결 불가능한 에러임
//		try {
//			return ss.selectOne("kr.co.jhta.wish.getWish", dto);
//		} catch (NullPointerException e) {
//			return new WishDTO();
//		} catch (NestedServletException e) {
//			return new WishDTO();
//		}
	}

	@Override
	public void insertWish(WishDTO wdto) {
		ss.insert("kr.co.jhta.wish.insertWish", wdto);
	}

	@Override
	public void deleteWish(WishDTO wdto) {
		ss.delete("kr.co.jhta.wish.deleteWish", wdto);
	}

	@Override
	public void insertClubInquiry(ClubInquiryDTO cidto) {
		ss.insert("kr.co.jhta.ClubInquiry.insertClubInquiry", cidto);
	}

	@Override
	public List<ClubInquiryDTO> getAllClubInquiry(int c_no) {
		return ss.selectList("kr.co.jhta.ClubInquiry.getAllClubInqiury", c_no);
	}

	@Override
	public int countInquiry(int c_no) {
		return ss.selectOne("kr.co.jhta.ClubInquiryAnswer.countInquiry", c_no);
	}

	@Override
	public List<ClubInquiryDTO> selectInquiry(PagingDTO dto) {
		return ss.selectList("kr.co.jhta.ClubInquiryAnswer.selectInquiry", dto);
	}

	@Override
	public void insertAnswer(ClubInquiryAnswerDTO ciadto) {
		ss.insert("kr.co.jhta.ClubInquiryAnswer.insertAnswer", ciadto);
	}

	@Override
	public List<ClubInquiryAnswerDTO> getAnswer(ClubDTO dto) {
		return ss.selectList("kr.co.jhta.ClubInquiryAnswer.getAnswer", dto);
	}

	@Override
	public ClubInquiryAnswerDTO getOneAnswer(int c_inq_no) {
		return ss.selectOne("kr.co.jhta.ClubInquiryAnswer.getOneAnswer", c_inq_no);
	}

	//헤더 search 메서드
	@Override
	public List<ClubDTO> searchClub(String word) {
		SearchWord sw = new SearchWord(word);
		return ss.selectList("kr.co.jhta.boardDetailMapper.searchClub", sw);
	}
	
	@Override
	public void increaseHits(int c_no) {
		ss.update("kr.co.jhta.boardDetailMapper.increaseHits", c_no);		
	}

	//search count
	@Override
	public int countSearchClub(String word) {
		SearchWord sw = new SearchWord(word);
		return ss.selectOne("kr.co.jhta.boardDetailMapper.countSearchClub", sw);
	}

	//hits club
	@Override
	public List<ClubDTO> hitsClub() {
		return ss.selectList("kr.co.jhta.boardDetailMapper.hitsClub");
	}


}