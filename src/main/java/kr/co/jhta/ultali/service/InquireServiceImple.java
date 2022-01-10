package kr.co.jhta.ultali.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.ultali.dao.InquireDaoInter;
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
	public List<InquireDto> showList(String mem_id) {
		return inquireDaoInter.selectList(mem_id);
	}

	@Override
	public void inquireWrite(InquireDto dto) {
		inquireDaoInter.insertInquire(dto);
	}

}
