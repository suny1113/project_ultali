package kr.co.jhta.ultali.service;

import java.util.List;

import kr.co.jhta.ultali.dto.ReportDTO;

public interface AdminReportService {

	public List<ReportDTO> selectAllReportService();
	public ReportDTO selectOneReportService(int rep_no);
	public void DeleteOne(int rep_no);
	
}
