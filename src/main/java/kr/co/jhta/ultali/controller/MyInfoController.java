package kr.co.jhta.ultali.controller;

import java.security.Principal;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.ultali.dto.MyInfoDto;
import kr.co.jhta.ultali.service.CreatedClubServiceInter;
import kr.co.jhta.ultali.service.InquireServiceInter;
import kr.co.jhta.ultali.service.MyInfoServiceInter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MyInfoController {
	
	@Autowired
	MyInfoServiceInter myInfoServiceInter;

	public void setMyInfoServiceInter(MyInfoServiceInter myInfoServiceInter) {
		this.myInfoServiceInter = myInfoServiceInter;
	}
	
	@Autowired
	InquireServiceInter inquireServiceInter;
	
	public void setInquireServiceInter(InquireServiceInter inquireServiceInter) {
		this.inquireServiceInter = inquireServiceInter;
	}
	
	@Autowired
	CreatedClubServiceInter createdClubServiceInter;

	public void setCreatedClubServiceInter(CreatedClubServiceInter createdClubServiceInter) {
		this.createdClubServiceInter = createdClubServiceInter;
	}

	@RequestMapping("idreq")
	public String id() {
		return "myPage/id";
	}
	
	@GetMapping("myPage/myInfo")
	public ModelAndView showInfoGet(HttpSession session, Principal principal) {
		String id = principal.getName();
		session.setAttribute("id", id);
		System.out.println(id);
		MyInfoDto myInfoDto = myInfoServiceInter.showInfo(id);
		return new ModelAndView("myPage/myInfo","myInfoDto",myInfoDto);
	}
	
	@PostMapping("myPage/myInfo")
	public ModelAndView showInfoPost(@ModelAttribute("mem_id") String mem_id, HttpSession session) {
		MyInfoDto myInfoDto = myInfoServiceInter.showInfo(mem_id);
		return new ModelAndView("myPage/myInfo","myInfoDto",myInfoDto);
	}
	
	@GetMapping("myPage/modify")
	public ModelAndView modify(@ModelAttribute("mem_id") String mem_id) {
    	 MyInfoDto myInfoDto = myInfoServiceInter.showInfo(mem_id);
		return new ModelAndView("myPage/myInfoModify","myInfoDto",myInfoDto);
	}
	
	// ajax 비동기 방식
	@ResponseBody
	@GetMapping("register/nicknameCheck")
	public String nicknameCheck(@RequestParam("new_id") String new_id) {
		
		log.info(""+new_id);
		int cnt =myInfoServiceInter.nicknameCheck(new_id);
		String result = (cnt==1)?"is_already":"is_ok";
		return result;
	}
	
	@PostMapping("myPage/modify")
	public String modifyInfo(@ModelAttribute("dto") MyInfoDto dto) {
		myInfoServiceInter.update(dto);
		return "redirect:/home";
	}
	
	@RequestMapping("myPage/delete")
	public String deleteOne(@ModelAttribute("mem_id") String mem_id,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
//		createdClubServiceInter.deleteClubList(mem_id);
//		inquireServiceInter.deleteInquiry(mem_id);
		myInfoServiceInter.delete(mem_id);
		
		Cookie cookies[] = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				c.setMaxAge(0);
				response.addCookie(c);
			}
		}
		
		session.invalidate();
		
		
		return "redirect:/home";
	}
	
}
