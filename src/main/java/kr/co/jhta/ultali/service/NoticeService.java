package kr.co.jhta.ultali.service;

import java.util.List;

import kr.co.jhta.ultali.dto.NoticeDTO;

public interface NoticeService {
	public List<NoticeDTO> selectList(String mem_id, int startNo, int endNo);
	public void noticeWrite(NoticeDTO dto);
	public NoticeDTO readOne(int n_no);
	public void noticeModify(NoticeDTO dto);
	public void remove(int n_no);
	public int getTotal();
}
