package kr.co.jhta.ultali.service;

import java.util.List;

import kr.co.jhta.ultali.dto.AdminInquirePagingVO;
import kr.co.jhta.ultali.dto.InquireDto;

public interface InquireServiceInter {
	public InquireDto showOne(int p_inq_no);
	public List<InquireDto> showList(String mem_id,int startNo, int endNo);
	public void inquireWrite(InquireDto dto);
	public int totalInquireCount();

	// 게시물 총 갯수
	public int countBoard();

	// 페이징 처리 게시글 조회
	public List<InquireDto> selectBoard(AdminInquirePagingVO vo);
}
