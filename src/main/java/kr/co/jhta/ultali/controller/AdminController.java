package kr.co.jhta.ultali.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.ultali.dto.AdminInquirePagingVO;
import kr.co.jhta.ultali.dto.InquireDto;
import kr.co.jhta.ultali.service.AdminReportService;
import kr.co.jhta.ultali.service.BoardService;
import kr.co.jhta.ultali.service.InquireServiceInter;

@Controller
public class AdminController {
	
	@Autowired
	AdminReportService adminReportService;
	
	@Autowired
	InquireServiceInter inquireServiceInter;
	
	@Autowired
	BoardService boardService;
	
//	@RequestMapping("admin/home")
//	public String main() {
//		return "redirect:/home";
//	}
	
	@RequestMapping("admin/reportList")
	public String reportList(Model model) {
		model.addAttribute("dto", adminReportService.selectAllReportService());
		return "admin/reportList";
	}
	
	@RequestMapping("admin/reportDetail")
	public String reportDetail(@RequestParam("rep_no")int rep_no, Model model) {
		model.addAttribute("dto", adminReportService.selectOneReportService(rep_no));
		return "admin/reportDetail";
	}
	
	@RequestMapping("admin/meetingDelete")
	public String meetingDelete(@RequestParam("c_no")int c_no, @RequestParam("rep_no")int rep_no) {
	
		//게시판 글 삭제 서비스 사용
		boardService.deleteClubService(c_no);
		
		return "redirect:/admin/reportList";
	}
	
	@GetMapping("admin/Inquire")
	public String boardList(AdminInquirePagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = inquireServiceInter.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new AdminInquirePagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", inquireServiceInter.selectBoard(vo));
		
		return "admin/manageInquire";
	}
	
	@RequestMapping("admin/manageInquireDetail")
	public String inquireDetail(@RequestParam("p_inq_no")int p_inq_no, Model model) {
		model.addAttribute("dto", inquireServiceInter.showOne(p_inq_no));
		return "admin/manageInquireDetail";
	}
	
	@PostMapping("admin/answerInquire")
	public String answerInquire(@ModelAttribute("dto")InquireDto dto, @RequestParam("p_inq_no")int p_inq_no, Model model) {
		inquireServiceInter.adminUpdateOne(dto);
		return "redirect:manageInquireDetail?p_inq_no=" + p_inq_no;
	}
	
	
}
