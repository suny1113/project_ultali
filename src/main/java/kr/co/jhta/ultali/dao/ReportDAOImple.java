package kr.co.jhta.ultali.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.ultali.dto.ReportDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ReportDAOImple implements ReportDAO{

	@Autowired
	SqlSession ss;
	
	
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public void insertReport(ReportDTO dto) {
//		log.info("rep_no:" + dto.getRep_no());
//		log.info("getMem_id:" + dto.getMem_id());
//		log.info("getC_no:" + dto.getC_no());
//		log.info("getRep_reason:" + dto.getRep_reason());
//		log.info("getRep_detail:" + dto.getRep_detail());
		ss.insert("kr.co.jhta.reportMapper.insertReport", dto);
		
	}
}
