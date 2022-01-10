package kr.co.jhta.ultali.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClubInquiryAnswerDTO {
	private int a_no;
	private String mem_id;
	private int c_no;
	private int c_inq_no;
	private String c_inq_answer_regdate;
	private String c_inq_answer_answer;
}
