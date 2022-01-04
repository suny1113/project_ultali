package kr.co.jhta.ultali.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.ultali.dto.ClubDTO;
import kr.co.jhta.ultali.service.BoardService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/clubBoard")
public class Board2Controller {

	@Autowired
	BoardService service;
	
	@Autowired
	FileValidator fileValidator;
	
	public void setService(BoardService service) {
		this.service = service;
	}

	
//	울타리 게시판에서 c_no를받아 sql에 dto검색 후 boardDetail에서 보여줌 
	@GetMapping("/clubBoardDetail")
	public String boardDetailGet(@RequestParam("c_no") int cno, Model model) {
		model.addAttribute("dto", service.selectOneClubService(cno));
		
		return "/clubBoard/clubBoardDetail";
	}
	
	@GetMapping("/clubModify")
	public String modifyGet(@ModelAttribute("dto") ClubDTO dto, Model model) {
		
		model.addAttribute("dto", dto);
		return "/clubBoard/clubModify";
	}
	
	@PostMapping("/clubModify")
	public String modifyPost(@ModelAttribute("dto") ClubDTO dto) {
//		service.updateClubService(dto, date, date2);
		System.out.println("date " + dto.getC_date());
//		System.out.println("date2: " + date2);
		return "redirect:/clubBoardDetail";
	}
	
	
	@GetMapping("/clubRegister")
	public String registerGet() {
		return "/clubBoard/clubRegister";
	}
	
	@PostMapping("/clubRegister")
	
	public ModelAndView registerPost(@ModelAttribute("dto") ClubDTO dto, @RequestParam("date") String date, @RequestParam("date2") String date2,
							HttpServletRequest req, @ModelAttribute("uploadFile") UploadFile file, BindingResult result, Model model) {
		return service.insertClubService(dto, date, date2, file, result);
		
	}
	
	// 테스트용 게시판 하원이가 완성할거임
	@GetMapping("/clubBoardList")
	public String clubBoardListGet(Model model) {
		model.addAttribute("clubList", service.selectAllClubService()); 
		return "/clubBoard/clubBoardList";
	}
	
	@GetMapping("/doQuestion")
	public String questionGet(@RequestParam("c_no") int c_no, @RequestParam("mem_id") String mem_id, Model model) {
		
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("c_no", c_no);
		return "/clubBoard/questionAnswer";
	}
	
	@PostMapping("answerWrite")
	public String amswerWrite() {
		
		return "redirect:/clubBoard/doQuestion";
	}
	
	@RequestMapping("clubDelete")
	public String clubDelete(@RequestParam("c_no") int c_no) {
		service.deleteClubService(c_no);
		return "redirect:/clubBoard/clubBoardList";
	}

}
