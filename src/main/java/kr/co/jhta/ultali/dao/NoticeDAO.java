package kr.co.jhta.ultali.dao;

import java.util.List;

import kr.co.jhta.ultali.dto.NoticeDTO;

public interface NoticeDAO {
	public List<NoticeDTO> selectAll(int startNo, int endNo);
	public void InsertOne(NoticeDTO dto);
	public NoticeDTO selectOne(int n_no);
	public void updateOne(NoticeDTO dto);
	public void deleteOne(int n_no);
	public int getTotal();
	public void raiseHits(int n_no);
	
}
