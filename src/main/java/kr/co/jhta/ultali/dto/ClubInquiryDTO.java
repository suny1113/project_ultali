package kr.co.jhta.ultali.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClubInquiryDTO {
	private int c_inq_no;
	private int c_no;
	private String mem_id;
	private String c_inq_regdate;
	private String c_inq_detail;
	private int c_inq_secretinq;
}
