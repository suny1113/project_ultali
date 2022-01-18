package kr.co.jhta.ultali.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.ultali.service.FindIdResult;
import kr.co.jhta.ultali.service.LoginMessageService;
import kr.co.jhta.ultali.service.LoginService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/login")
public class LoginController {
	

	@Autowired
	LoginService service;
	
	@Autowired
	LoginMessageService messageService;
	
	@Autowired
	FindIdResult result;
	
	
	// 스프링 시큐리티 커스텀 로그인 매핑
	@GetMapping("/login")
	public String login(String error, String logout,
						Model model){

		if(error != null) {
			model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}else if(logout!=null) {
			model.addAttribute("logout", "로그아웃");	
		}

		
		return "/login/login";
	}
	
	
	
	@RequestMapping("/find")
	public String find() {
		return "/login/find_id";
	}
	
	@PostMapping("/checkAuthNumId")
	@ResponseBody
	public String checkAuthNumId(@RequestParam Map<String, String> map ){
		
		String randomNum = String.valueOf((int)(Math.random()*8999)+1000);	
		String text = "";
		String id = service.findUserId(map);
		
		if(id != null) {
			messageService.sendMessage(map.get("mem_phone"), randomNum);
			text = randomNum;
		}else {
			text = "error";
		}
		return text;
	}
	
	@PostMapping("/checkAuthNumPw")
	@ResponseBody
	public String checkAuthNumPw(@RequestParam Map<String, String> map ){
		
		String randomNum = String.valueOf((int)(Math.random()*8999)+1000);	
		String text = "";
		String id = service.findUserId(map);
		
		if(id != null && id.equals(map.get("mem_id"))) {
			messageService.sendMessage(map.get("mem_phone"), randomNum);
			text = randomNum;
		}else {
			text = "error";
		}
		return text;
	}
	
	
	
	@PostMapping("/findIdResult")
	public String findIdResult(@RequestParam("mem_name") String mem_name,
							   @RequestParam("mem_phone") String mem_phone,
							   Model model) {

		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mem_name", mem_name);
		map.put("mem_phone", mem_phone);
		
		String id = result.idResult(service.findUserId(map));
		log.info("id : "+id);
		
		model.addAttribute("id", id);
		
		return "/login/findIdResult";
	}
	
	
	@RequestMapping("/findPassword")
	public String findPwd() {
		return "/login/find_password";
	}
	
	@PostMapping("/findPasswordResult")
	public String findPwResult(@RequestParam("mem_id") String mem_id,
							   Model model) {
		model.addAttribute("mem_id", mem_id);
		
		return "/login/findPasswordResult";
	}
	
	@PostMapping("/changePw")
	public String changePw(@RequestParam("mem_id") String mem_id,
						   @RequestParam("mem_pw") String mem_pw) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mem_id", mem_id);
		map.put("mem_pw", mem_pw);
		service.modfiyPassword(map);
		
		return "redirect:/";
	}
	
}
