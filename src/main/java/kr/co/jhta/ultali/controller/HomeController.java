package kr.co.jhta.ultali.controller;

import java.security.Principal;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.ultali.service.BoardService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {

	@Autowired
	BoardService boardService;
	
	
	@RequestMapping(value = {"/","/home"} )
	public String home(Principal principal,
					   HttpSession session, Model model) {
		if(principal != null) {
			session.setAttribute("id", principal.getName());
			
		}
		log.info((String)session.getAttribute("id"));
		
		model.addAttribute("dto", boardService.hitsClub());
		
		return "home/home";
	}
	
	@RequestMapping("home/home")
	public String home2() {
		return "redirect:/home";
	}
	
	@RequestMapping(value = {"termsOfUse", "home/termsOfUse"})
	public String use() {
		return "home/termsOfUse";
	}
	
	@RequestMapping(value = {"service", "home/service"})
	public String service() {
		return "home/service";
	}
	
	@RequestMapping(value = {"intro", "home/intro"})
	public String intro() {
		return "home/intro";
	}
	
	// 컨트롤러 별 매핑 추가
	// 예) admin/search, help/search, ...
	@GetMapping(value = {"search", "home/search", "admin/search", "help/search", "myPage/search", "clubBoard/search"})
	public String search(@RequestParam("word")String word, Model model) {
		model.addAttribute("word", word);
		model.addAttribute("dto", boardService.searchClub(word));
		model.addAttribute("cnt", boardService.countSearchClub(word));
		return "home/search";
	}
	
}
