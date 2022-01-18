package kr.co.jhta.ultali.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AppDto {
	private int app_no;
	private String mem_name;
	private String mem_id;
	private String gender;
	private String mem_phone;
	private String app_detail;
	private String c_no;
	private String c_name;
}
