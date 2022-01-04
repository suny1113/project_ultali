package kr.co.jhta.ultali.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClubDTO {
	private int c_no;
	private int major_no;
	private int sub_no;
	private String mem_id;
	private String c_name;
	private String c_loc;
	private String c_place;
	private String c_date;
	private String c_time;
	private int c_price;
	private int c_count;
	private String c_image;
	private String c_detail;
	private int c_hits;
}
