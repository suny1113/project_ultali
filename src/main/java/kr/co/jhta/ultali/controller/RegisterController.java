package kr.co.jhta.ultali.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jhta.ultali.dto.RegisterDTO;
import kr.co.jhta.ultali.service.RegisterService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	RegisterService service;
	
	public void setService(RegisterService service) {
		this.service = service;
	}
	
	@RequestMapping(value = {"/", "/register"})
	public String register() {
		return "register/register";
	}
	
	@PostMapping("/register")
	public String register(@ModelAttribute("dto")RegisterDTO dto, HttpServletRequest req) {
		System.out.println(" dto : " + dto);
		service.register(dto);
		return "redirect:/login/login";
	}
}
