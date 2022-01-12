package kr.co.jhta.ultali.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.ultali.dao.NoticeDAO;
import kr.co.jhta.ultali.dto.NoticeDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoticeServiceImple implements NoticeService{

	// SpringFramework 지원, 타입으로 연결(안되면 이름), 프레임워크에 종속적
	@Autowired
	NoticeDAO dao;
	
	// setter 
	
	public void setDao(NoticeDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public List<NoticeDTO> selectList(String mem_id, int startNo, int endNo) {
		log.info("dao : " + dao); // dao를 실행 여부를 위한 log
		log.info("startNo : " + startNo); // startNO 전송을 테스트하기 위한 log
		log.info("endNo : " + endNo); // endNO 전송을 테스트하기 위한 log
		return dao.selectList(mem_id, startNo, endNo);
	}

	@Override
	public void noticeWrite(NoticeDTO dto) {
		dao.insertOne(dto);
	}

	@Override
	public NoticeDTO readOne(int n_no) {
		// 트랙잭션 처리 시작
		
		dao.raiseHits(n_no);
		
		NoticeDTO dto = dao.selectOne(n_no);
		
		// 트랜잭선 처리 종료
		
		return dto;
	}

	@Override
	public void noticeModify(NoticeDTO dto) {
		dao.updateOne(dto);
	}

	@Override
	public void remove(int n_no) {
		dao.deleteOne(n_no);
	}

	@Override
	public int getTotal() {
		return dao.getTotal();
	}

}
