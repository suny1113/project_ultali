package kr.co.jhta.ultali.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.ultali.dto.NoticeDTO;
import kr.co.jhta.ultali.dto.StartEnd;

@Repository
public class NoticeDetailDAO implements NoticeDAO{

	// 자동으로 있으면 채워달라
	@Autowired
	private SqlSession ss;
	
	// 보존성을 주기 위한 setter 설정
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	// abstract method
	
	@Override
	public List<NoticeDTO> selectAll(int startNo, int endNo) {
		StartEnd se = new StartEnd(startNo, endNo);
		System.out.println(" ss : " + ss);
		return ss.selectList("kr.co.jhta.ultali.selectAll", se);
	}


	@Override
	public void InsertOne(NoticeDTO dto) {
		ss.insert("kr.co.jhta.ultali.addOne", dto);
	}

	@Override
	public NoticeDTO selectOne(int n_no) {
		return ss.selectOne("kr.co.jhta.ultali.selectOne", n_no);
	}

	@Override
	public void updateOne(NoticeDTO dto) {
		ss.update("kr.co.jhta.ultali.updateOne", dto);
	}

	@Override
	public void deleteOne(int n_no) {
		ss.delete("kr.co.jhta.ultali.deleteOne", n_no);
	}

	@Override
	public int getTotal() {
		return ss.selectOne("kr.co.jhta.ultali.getTotal");
	}

	@Override
	public void raiseHits(int n_no) {
		ss.update("kr.co.jhta.ultali.raiseHits", n_no);
	}

	
}
