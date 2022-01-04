package kr.co.jhta.ultali.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {

	private int n_no;
	private String n_title;
	private String mem_id;
	private String n_regdate;
	private int n_hits;
	private String n_detail;
}
