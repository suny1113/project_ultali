package kr.co.jhta.ultali.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageContoller {
	
	@RequestMapping("myClubList")
	public String myClubList() {
		return "myPage/myClubList";
	}
}
