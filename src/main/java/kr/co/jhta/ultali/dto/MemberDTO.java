package kr.co.jhta.ultali.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.net.aso.p;

@Data
@NoArgsConstructor
public class MemberDTO {
	private String mem_id;
	private String mem_name;
	private int rank_no;
	private String mem_phone;
	private String mem_pw;
	private String mem_email;
	private String enabled;
}
