package kr.co.jhta.ultali.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.ultali.dao.LoginDAO;
import kr.co.jhta.ultali.dto.MemberDTO;
import kr.co.jhta.ultali.service.FindIdResult;
import kr.co.jhta.ultali.service.LoginMessageService;
import kr.co.jhta.ultali.service.LoginService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/login")
public class LoginController {
	
//	pull request 테스트용으로 수정함
	
	// pull request 두번째 테스트

	@Autowired
	LoginService service;
	
	@Autowired
	LoginMessageService messageService;
	
	@Autowired
	FindIdResult result;
	
	
	@GetMapping("/login")
	public String login(String error, String logout, Model model) {
		if(error != null) {
			model.addAttribute("error", "로그인오류!");
			log.info("error : "+error);
		}else if(logout!=null) {
			model.addAttribute("logout", "로그아웃됨");
			
		}
		return "/login/login";
	}
	
	@PostMapping("/login")
	public String loginOk() {
		
		return "redirect:/";
	}
	
	@RequestMapping("/find")
	public String find() {
		return "/login/find_id_password";
	}
	
	@RequestMapping("/findId")
	public String findId(@RequestParam("phone1") String phone1,
						 @RequestParam("phone2") String phone2,
						 @RequestParam("phone3") String phone3,
						 @RequestParam("emailId") String emailId,
						 @RequestParam("url") String url,
						 Model model){
		
		String phoneNum = phone1+phone2+phone3;
		String email = emailId+"@"+url;
		log.info("phoneNum : "+phoneNum);
		log.info("eamil : "+email);
		
		MemberDTO dto = new MemberDTO();
		dto.setMem_phone(phoneNum);
		dto.setMem_email(email);
		
		String id = result.idResult(service.findUserId(dto));
		log.info("id : "+id);

		model.addAttribute("id", id);
		
		return "/login/findIdResult";

	}
	
	@RequestMapping("/getMessage")
	@ResponseBody
	public String getMessage(@RequestParam("phoneNum") String phoneNum) {
		String randomNum = String.valueOf((int)(Math.random()*8999)+1000);
		log.info(phoneNum);
		// ��ȿ���˻�
		// �Է��� ��ȣ�� db�� �����ϴ��� ���ϴ��� �˻�
		String data = "";
		
		if(service.findPhoneNumber(phoneNum) != null) {
			messageService.sendMessage(phoneNum, randomNum);
			data = randomNum;
		}else {
			data = "error";
		}
		return data;
	}
	
	@RequestMapping("/checkNum")
	public void checkNumber() {
		
	}
	
	
	@RequestMapping("/findPassword")
	public String findPwd(@RequestParam("id") String id, Model model) {
		model.addAttribute("id", id);
		return "/login/findPasswordResult";
	}
	
	@PostMapping("/changePw")
	public String changePw(@RequestParam("id") String id,
						   @RequestParam("pw") String password) {
		log.info("id : "+id);
		log.info("pwd : "+password);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mem_id", id);
		map.put("mem_pw", password);
		service.modfiyPassword(map);
		
		return "redirect:/";
	}
	
}
