package kr.co.jhta.ultali.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.ultali.dto.RegisterDTO;
import kr.co.jhta.ultali.service.RegisterService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RegisterController {

	@Autowired
	RegisterService service;

	public void setService(RegisterService service) {
		this.service = service;
	}

	@RequestMapping("/register/register")
	public String register() {
		return "register/register";
	}

	@PostMapping("/register/register")
	public String register(@ModelAttribute("dto") RegisterDTO dto, HttpServletRequest req) {
		System.out.println(" dto : " + dto);
		service.register(dto);
		return "redirect:/login/login";
	}

	
	
	// id 중복 체크 컨트롤러
	@RequestMapping(value = "/register/register/idCheck", method = RequestMethod.GET)
	@ResponseBody
		public int idCheck(@RequestParam("mem_Id") String mem_id) {
            log.info("userIdCheck 진입");
			return service.userIdCheck(mem_id);
		}
	
	
	
	// 다른 페이지로 이동하기

	@RequestMapping("/register/register/register")
	public String reregister() {
		return "redirect:/register/register";
	}

	@RequestMapping("/register/login/login")
	public String login() {
		return "redirect:/login/login";
	}

	@RequestMapping("/register/myPage/myInfo")
	public String mypage() {
		return "redirect:/myPage/myInfo";
	}

	@RequestMapping("/register/help/notice")
	public String rehelp() {
		return "redirect:/help/notice";
	}

	@RequestMapping("/register/admin/reportList?currentPage=1")
	public String admin() {
		return "redirect:/admin/reportList?currentPage=1";
	}
	
	@RequestMapping("/register/home")
	public String home() {
		return "redirect:/";
	}

}
