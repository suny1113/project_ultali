package kr.co.jhta.ultali.service;

import java.util.List;

import kr.co.jhta.ultali.dto.InquireDto;

public interface InquireServiceInter {
	public InquireDto showOne(int p_inq_no);
	public List<InquireDto> showList(String mem_id);
	public void inquireWrite(InquireDto dto);
}
