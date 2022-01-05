package kr.co.jhta.ultali.dao;

import java.util.List;

import kr.co.jhta.ultali.dto.InquireDto;

public interface InquireDaoInter {
	public InquireDto selectOne(int p_inq_no);
	public List<InquireDto> selectList(String mem_id);
	public void insertInquire(InquireDto dto);
}