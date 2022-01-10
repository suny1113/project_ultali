package kr.co.jhta.ultali.controller;

import org.springframework.stereotype.Controller;	
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


//@Slf4j
@Controller
@RequestMapping("/clubBoard")
public class Board1Controller {

	@GetMapping("/clubBoardList")
	public String list(/* @RequestParam("major_no") int no, Model model */) {
		//model.addAttribute("dto", service.selectClubList);
		return "/clubBoard/clubBoardList";
	}
	
}
