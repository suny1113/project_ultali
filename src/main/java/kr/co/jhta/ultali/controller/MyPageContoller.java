package kr.co.jhta.ultali.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("myPage")
public class MyPageContoller {
	
//	@RequestMapping("myInfo")
//	public String myInfo() {
//		return "myInfo";
//	}
	
	@RequestMapping("wishList")		
	public String wishList() {
		return "myPage/wishList";
	}
	
	
	@RequestMapping("myClubList")
	public String myClubList() {
		return "myPage/myClubList";
	}
}
