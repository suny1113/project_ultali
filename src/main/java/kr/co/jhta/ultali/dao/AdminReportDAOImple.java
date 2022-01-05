package kr.co.jhta.ultali.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.ultali.dto.ReportDTO;

@Repository
public class AdminReportDAOImple implements AdminReportDAO{

	@Autowired
	SqlSession ss;
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public List<ReportDTO> selectAllReport() {
		return ss.selectList("kr.co.jhta.ultali.adminReport.selectAllReport");
	}

	@Override
	public ReportDTO selectOneReport(int rep_no) {
		return ss.selectOne("kr.co.jhta.ultali.adminReport.selectOneReport", rep_no);
	}

	@Override
	public void DeleteOne(int rep_no) {
		ss.delete("kr.co.jhta.ultali.adminReport.deleteOneReport", rep_no);
	}

}
