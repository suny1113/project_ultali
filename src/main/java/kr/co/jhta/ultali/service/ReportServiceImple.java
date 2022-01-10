package kr.co.jhta.ultali.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.ultali.dao.ReportDAO;
import kr.co.jhta.ultali.dto.ReportDTO;

@Service
public class ReportServiceImple implements ReportService{

	@Autowired
	ReportDAO dao;
	
	public void setDao(ReportDAO dao) {
		this.dao = dao;
	}

	@Override
	public void insertReportServce(ReportDTO dto) {
		dao.insertReport(dto);
	}

}
