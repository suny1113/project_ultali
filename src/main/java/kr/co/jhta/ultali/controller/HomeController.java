package kr.co.jhta.ultali.controller;

import java.security.Principal;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {


	@RequestMapping(value = {"/","/home"} )
	public String home(Principal principal,
					   HttpSession session) {
		if(principal != null) {
			session.setAttribute("id", principal.getName());
			
		}
		log.info((String)session.getAttribute("id"));
		return "home/home";
	}
}
