package kr.co.jhta.ultali.controller;

import java.security.Principal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.ultali.dao.NoticeDAO;
import kr.co.jhta.ultali.dto.InquireDto;
import kr.co.jhta.ultali.dto.NoticeDTO;
import kr.co.jhta.ultali.dto.PageUtil;
import kr.co.jhta.ultali.service.NoticeService;
import kr.co.jhta.ultali.service.NoticeServiceImple;
import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Controller
public class NoticeController {

	@Autowired
	NoticeService service;
	
	public void setService(NoticeService service) {
		this.service = service;
	}
	
	@RequestMapping("/help/notice")
	public ModelAndView notice(@RequestParam(name = "currentPage", defaultValue = "1")int currentPage,HttpSession session, Model model) {
		

		// 총 게시물 수 
		int totalNumber = service.getTotal();
		log.info("totalNumber : "  + totalNumber);
		// 한 페이지의 게시물수는 : 20
		// 총 몇 개의 페이지 계산 후 그 값을 notice.jsp로 보냄
		// 링크 개수 수정
		// 페이디당 게시물수
		
		int countPerPage = 10;
		// 총 페이지수      500%10 == 0 ? 500/10 : 500?10+1
		
		Map<String, Object> map = PageUtil.getPageData(totalNumber, countPerPage, currentPage);
		 
		model.addAttribute("map", map);
		int startNo = (int)map.get("startNo");
		int endNo = (int)map.get("endNo");
		
		// StartEnd se = new StartEnd(startNo, endNo);
		String mem_id = (String) session.getAttribute("mem_id");
		return new ModelAndView("help/notice", "selectList", service.selectList(mem_id, startNo, endNo));
	}
	
		@GetMapping("/help/noticeWrite")
		public String noticeWrite(Model model, HttpSession session, Principal principal){
			model.addAttribute("mem_id",principal.getName());
			log.info("rincipal.getName()" + principal.getName());
			return "help/noticeWrite";
	}
		
		@PostMapping("/help/noticeWrite")
		public String makeNotice(@ModelAttribute("NoticeDTO")NoticeDTO NoticeDTO) {
			service.noticeWrite(NoticeDTO);
			return "redirect:/help/notice";
		}
		
		/* NoticeController.detail (dto) */
		
		@RequestMapping("/help/noticeDetail")
		public String noticeDetail(@RequestParam("n_no")int n_no, Model model) {
			
			NoticeDTO dto = service.readOne(n_no);
			model.addAttribute("dto", dto);
			return "/help/noticeDetail";
		}
		
		@GetMapping("/help/noticeModify")
		public String noticeModify(@RequestParam("n_no")int n_no, Model model, Principal principal) {
			NoticeDTO dto = service.readOne(n_no);
			log.info("dto" + dto);
			model.addAttribute("mem_id",principal.getName());
			model.addAttribute("dto", dto);
			log.info("model.addAttribute(\"dto\", dto)" + model.addAttribute("dto", dto));
			return "/help/noticeModify";
		}
		
		@PostMapping("/help/noticeModify")
		public String noticeModifyOk(@ModelAttribute("NoticeDTO")NoticeDTO NoticeDTO) {
			service.noticeModify(NoticeDTO);
			log.info("NoticeDTO" + NoticeDTO);
			return "redirect:/help/notice";
		}
		
		@GetMapping("/help/noticeDelete")
		public String delete(@RequestParam("n_no")int n_no) {
			service.remove(n_no);
			return "redirect:/help/notice";
		}
		
		// 타른 탭으로 이동하기
		
		@RequestMapping("/help/register/register")
		public String register() {
			return "redirect:/register/register";
		}
		
		@RequestMapping("/help/login/login")
		public String login() {
			return "redirect:/login/login";
		}
		
		@RequestMapping("/help/myPage/myInfo")
		public String mypage() {
			return "redirect:/myPage/myInfo";
		}
		
		@RequestMapping("/help/help/notice")
		public String rehelp() {
			return "redirect:/help/notice";
		}
		
		@RequestMapping("/help/admin/reportList?currentPage=1")
		public String admin() {
			return "redirect:/admin/reportList?currentPage=1";
		}
		
		@RequestMapping("/help/faq")
		public String faq() {
			return "/help/faq";
		}
	
}
