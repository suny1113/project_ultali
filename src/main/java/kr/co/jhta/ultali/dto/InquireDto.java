package kr.co.jhta.ultali.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InquireDto {
	private int p_inq_no;
	private String p_inq_title;
	private String mem_id;
	private String p_inq_detail;
	private String p_inq_answer;
	private int p_inq_status;
	private String regdate;
}
