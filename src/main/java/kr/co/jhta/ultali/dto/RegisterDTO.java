package kr.co.jhta.ultali.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // getters 생성기
@NoArgsConstructor // parameter 없는 constructor 생성기
@AllArgsConstructor // parameter 1개 있는 constructor 생성기
public class RegisterDTO {

	private String mem_id;
	private String mem_name;
	private String mem_phone;
	private String mem_pw;
	private String mem_email;

}
