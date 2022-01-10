package kr.co.jhta.ultali.dao;

import java.util.List;


import kr.co.jhta.ultali.dto.ReportDTO;

public interface AdminReportDAO {

	public List<ReportDTO> selectAllReport();
	public ReportDTO selectOneReport(int rep_no);
	public void DeleteOne(int rep_no);
	
}
