package kr.co.jhta.ultali.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.ultali.dto.AdminInquirePagingVO;
import kr.co.jhta.ultali.dto.InquireDto;
import kr.co.jhta.ultali.dto.StartEnd;

@Repository
public class InquireDaoImple implements InquireDaoInter{
	
	@Autowired
	SqlSession ss;
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public InquireDto selectOne(int p_inq_no) {
		return ss.selectOne("kr.co.jhta.ultali.inquire.selectOne",p_inq_no);
	}

	@Override
	public List<InquireDto> selectList(String mem_id) {
		return ss.selectList("kr.co.jhta.ultali.inquire.selectList", mem_id);
	}

	@Override
	public void insertInquire(InquireDto dto) {
		System.out.println("ss :"+ss);
		ss.insert("kr.co.jhta.ultali.inquire.insertInquire",dto);
	}
	
	//admin 전체조회
	@Override
	public List<InquireDto> selectBoard(AdminInquirePagingVO vo) {
		return ss.selectList("kr.co.jhta.ultali.inquire.selectBoar", vo);
	}
	
	// 총 게시글 수
	@Override
	public int countBoard() {
		return ss.selectOne("kr.co.jhta.ultali.inquire.countBoard");
	}
	
}
