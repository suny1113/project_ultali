package kr.co.jhta.ultali.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.ultali.dao.AdminReportDAO;
import kr.co.jhta.ultali.dto.ReportDTO;

@Service
public class AdminReportServiceImple implements AdminReportService{

	@Autowired
	AdminReportDAO dao;
	
	public void setDao(AdminReportDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<ReportDTO> selectAllReportService() {
		return dao.selectAllReport();
	}

	@Override
	public ReportDTO selectOneReportService(int rep_no) {
		return dao.selectOneReport(rep_no);
	}


	@Override
	public void DeleteOne(int rep_no) {
		dao.DeleteOne(rep_no);
	}

}
