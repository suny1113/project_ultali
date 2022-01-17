package kr.co.jhta.ultali.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.ultali.dao.InquireDaoInter;
import kr.co.jhta.ultali.dto.AdminInquirePagingVO;
import kr.co.jhta.ultali.dto.InquireDto;

@Service
public class InquireServiceImple implements InquireServiceInter{

	@Autowired
	InquireDaoInter inquireDaoInter;
	
	public void setInquireDaoInter(InquireDaoInter inquireDaoInter) {
		this.inquireDaoInter = inquireDaoInter;
	}

	@Override
	public InquireDto showOne(int p_inq_no) {
		return inquireDaoInter.selectOne(p_inq_no);
	}

	@Override
	public List<InquireDto> showList(String mem_id, int startNo, int endNo) {
		return inquireDaoInter.selectList(mem_id,startNo, endNo);
	}

	@Override
	public void inquireWrite(InquireDto dto) {
		inquireDaoInter.insertInquire(dto);
	}

	@Override
	public int totalInquireCount(String mem_id) {
		return inquireDaoInter.selectTotalInquireCount(mem_id);
	}
	
	@Override
	public int countBoard() {
		return inquireDaoInter.countBoard();
	}

	@Override
	public List<InquireDto> selectBoard(AdminInquirePagingVO vo) {
		return inquireDaoInter.selectBoard(vo);
	}

	@Override
	public void adminUpdateOne(InquireDto dto) {
		inquireDaoInter.adminUpdateOne(dto);
	}
	
	@Override
	public void deleteInquiry(int p_inq_no) {
		inquireDaoInter.inquireDelete(p_inq_no);
	}
	
	@Override
	public void deleteInquiry(String mem_id) {
		inquireDaoInter.inqireDelete(mem_id);
	}

}
