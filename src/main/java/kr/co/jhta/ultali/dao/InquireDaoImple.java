package kr.co.jhta.ultali.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.ultali.dto.IdStartEnd;
import kr.co.jhta.ultali.dto.AdminInquirePagingVO;
import kr.co.jhta.ultali.dto.InquireDto;
import kr.co.jhta.ultali.dto.StartEnd;

@Repository
public class InquireDaoImple implements InquireDaoInter{
	
	@Autowired
	SqlSession ss;
	String namespace = "kr.co.jhta.ultali.inquire";
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public InquireDto selectOne(int p_inq_no) {
		return ss.selectOne("kr.co.jhta.ultali.inquire.selectOne",p_inq_no);
	}

	@Override
	public List<InquireDto> selectList(String mem_id,int startNo, int endNo) {
		IdStartEnd idStartEnd = new IdStartEnd(mem_id, startNo, endNo);
		return ss.selectList("kr.co.jhta.ultali.inquire.selectList", idStartEnd);
	}

	@Override
	public void insertInquire(InquireDto dto) {
		System.out.println("ss :"+ss);
		ss.insert("kr.co.jhta.ultali.inquire.insertInquire",dto);
	}

	public int selectTotalInquireCount(String mem_id) {
		return ss.selectOne(namespace+".totalInquireCount",mem_id);
	}

	//admin 전체조회
	@Override
	public List<InquireDto> selectBoard(AdminInquirePagingVO vo) {
		return ss.selectList("kr.co.jhta.ultali.inquire.selectBoard", vo);
	}
	
	// 총 게시글 수
	@Override
	public int countBoard() {
		return ss.selectOne("kr.co.jhta.ultali.inquire.countBoard");
	}

	//adminInquire insert
	@Override
	public void adminUpdateOne(InquireDto dto) {
		ss.update("kr.co.jhta.ultali.inquire.adminUpdateInquire", dto);
	}
	
	@Override
	public void inquireDelete(int p_inq_no) {
		ss.delete(namespace+".deleteInquire",p_inq_no);
	}
	
	@Override
	public void inqireDelete(String mem_id) {
		ss.delete(namespace+".deleteInquiryById", mem_id);
	}

}
