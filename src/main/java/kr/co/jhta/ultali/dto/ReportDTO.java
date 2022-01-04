package kr.co.jhta.ultali.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReportDTO {
	private int rep_no;
	private String mem_id;
	private int c_no;
	private String rep_reason;
	private String rep_detail;
	
}
