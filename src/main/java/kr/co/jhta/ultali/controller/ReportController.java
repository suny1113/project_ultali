package kr.co.jhta.ultali.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.ultali.dto.ReportDTO;
import kr.co.jhta.ultali.service.BoardService;
import kr.co.jhta.ultali.service.ReportService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/clubBoard")
public class ReportController {
	
	@Autowired
	ReportService service;

	@Autowired
	BoardService boardService;
	
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	public void setService(ReportService service) {
		this.service = service;
	}
	
	@GetMapping("/doReport")
	public String doReport(@RequestParam("c_no") int c_no, Model model) {
		model.addAttribute("boardDTO", boardService.selectOneClubService(c_no)); 
		return "/clubBoard/report";
	}
	
	@PostMapping("/doReport")
	public String doReportPost(@ModelAttribute("reportDto") ReportDTO reportDto) {
		System.out.println("reportDtoaaaaaaaa:"+reportDto);
		service.insertReportServce(reportDto);
		return "/clubBoard/doReportClose";
	}
	
	// 신고하기 눌렀을 경우 다른곳으로 넘어가기 때문에 창종료 메서드를 만듬
//	@RequestMapping("/doReportClose")
//	public void doReportClose() {
//		return "/clubBoard/doReportClose";
//	}
}
