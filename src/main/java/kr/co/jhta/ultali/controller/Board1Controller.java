package kr.co.jhta.ultali.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class Board1Controller {

	@GetMapping("/list")
	public String list() {
		return "/clubBoard/clubBoardList";
	}
	
}
