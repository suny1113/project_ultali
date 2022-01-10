package kr.co.jhta.ultali.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyInfoDto {
	private String mem_id;
	private String mem_name;
	private int rank_no;
	private String mem_phone;
	private String mem_pw;
	private String mem_email;
}
