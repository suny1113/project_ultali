package kr.co.jhta.ultali.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.ultali.dto.ClubDTO;
import kr.co.jhta.ultali.service.Board1Service;


@Controller
public class Board1Controller {
	
	@Autowired
	Board1Service service;
	
	
	public void setService(Board1Service service) {
		this.service = service;
	}

	@GetMapping("/clubBoard/clubBoardList")
	public String clubList(@RequestParam("major_no") int major_no, Model model) {
				
		List<ClubDTO> list = service.selectClubList_major(major_no);
		model.addAttribute("list", list);
		
		return "/clubBoard/clubBoardList";
	}
	
	@GetMapping("/clubBoard/clubBoardListSort")
	public String clubListSort(@RequestParam("sort") int sort, Model model) {
		
//		List<ClubDTO> list = service.selectClubCategory(sort);
//		model.addAttribute("list", list);
		
		return "redirect:/login/login";
	}
	
}
