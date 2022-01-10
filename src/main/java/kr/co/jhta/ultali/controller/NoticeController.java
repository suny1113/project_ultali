package kr.co.jhta.ultali.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.ultali.dto.NoticeDTO;
import kr.co.jhta.ultali.dto.PageUtil;
import kr.co.jhta.ultali.service.NoticeService;
import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Controller
@RequestMapping("/help")
public class NoticeController {

	@Autowired
	// @Qualifier("NoticeServiceBean")
	NoticeService service;
	
	public void setService(NoticeService service) {
		this.service = service;
	}
	
	@RequestMapping("/notice")
	public ModelAndView notice(Model model, 
		 @RequestParam(name = "currentPage", defaultValue = "1")int currentPage) {
		
		// 현재 페이지 번호
		// int currentPage = 1;
		
		// 총 게시물 수 
		int totalNumber = service.getTotal();
		
		// 한 페이지의 게시물수는 : 20
		// 총 몇 개의 페이지 계산 후 그 값을 notice.jsp로 보냄
		// 링크 개수 수정
		// 페이디당 게시물수 
		int countPerPage = 10;
		
		// 총 페이지수      500%10 == 0 ? 500/10 : 500?10+1
		
		Map<String, Object> map = PageUtil.getPageData(totalNumber, countPerPage, currentPage);
		 
		model.addAttribute("map", map);
		
		int startNo = (int) map.get("startNo");
		int endNo = (int) map.get("endNo");
		
		// StartEnd se = new StartEnd(startNo, endNo);
		return new ModelAndView("help/notice", "help/notice", service.readAll(startNo, endNo));
	}
	
		@GetMapping("/noticeWrite")
		public String noticeWrite(){
			return "noticeWrite";
	}
		
		@PostMapping("/noticeWrite")
		public String noticeWrite(@ModelAttribute("dto")NoticeDTO dto, HttpServletRequest req) {
			System.out.println(" dto : " + dto);
			dto.setMem_id(req.getRemoteAddr());
			service.noticeWrite(dto);
			return "redirect:/help/notice";
		}
		
		/* NoticeController.detail (dto) */
		
		@RequestMapping("/noticeDetail")
		public String noticeDetail(@RequestParam("n_no")int n_no, Model model) {
			
			NoticeDTO dto = service.readOne(n_no);
			model.addAttribute("dto", dto);
			return "noticeDetail";
		}
		
		@GetMapping("/noticeModify")
		public String noticeModify(@RequestParam("n_no")int n_no, Model model) {
			NoticeDTO dto = service.readOne(n_no);
			model.addAttribute("dto", dto);
			return "noticeModify";
		}
		
		@PostMapping("/noticeModify")
		public String noticeModifyOk(@ModelAttribute("dto")NoticeDTO dto) {
			service.noticeModify(dto);
			return "redirect:/help/notice";
		}
		
		@GetMapping("/delete")
		public String delete(@RequestParam("n_no")int n_no) {
			service.remove(n_no);
			return "redirect:/help/notice";
		}
		
		@RequestMapping("/faq")
		public String faq() {
			return "help/faq";
		}
}
