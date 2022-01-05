package kr.co.jhta.ultali.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.ultali.dto.MyInfoDto;
import kr.co.jhta.ultali.service.MyInfoServiceInter;

@Controller
public class MyInfoController {
	
	@Autowired
	MyInfoServiceInter myInfoServiceInter;

	public void setMyInfoServiceInter(MyInfoServiceInter myInfoServiceInter) {
		this.myInfoServiceInter = myInfoServiceInter;
	}
	
	@RequestMapping("idreq")
	public String id() {
		return "myPage/id";
	}
	
	@GetMapping("myPage/myInfo")
	public ModelAndView showInfoGet(HttpSession session) {
		String id = (String)session.getAttribute("mem_id");
		MyInfoDto myInfoDto = myInfoServiceInter.showInfo(id);
		return new ModelAndView("myPage/myInfo","myInfoDto",myInfoDto);
	}
	
	@PostMapping("myPage/myInfo")
	public ModelAndView showInfoPost(@ModelAttribute("mem_id") String mem_id, HttpSession session) {
		session.setAttribute("mem_id", mem_id);
		MyInfoDto myInfoDto = myInfoServiceInter.showInfo(mem_id);
		return new ModelAndView("myPage/myInfo","myInfoDto",myInfoDto);
	}
	
	@GetMapping("myPage/modify")
	public ModelAndView modify(@ModelAttribute("mem_id") String mem_id) {
    	 MyInfoDto myInfoDto = myInfoServiceInter.showInfo(mem_id);
    	 System.out.println("여기");
		return new ModelAndView("myPage/myInfoModify","myInfoDto",myInfoDto);
	}
	
	// ajax 비동기 방식
	@PostMapping("myPage/nicknameCheck")
	public int nicknameCheck(@RequestParam("new_nickname") String new_nickname) {
		int cnt = myInfoServiceInter.nicknameCheck(new_nickname);
		return cnt;
	}
	
	
	@PostMapping("myPage/modify")
	public String modifyInfo(@ModelAttribute("dto") MyInfoDto dto) {
//		myInfoServiceInter.update(dto);
		return "redirect:/home";
	}
	
	@RequestMapping("delete")
	public String deleteOne(@ModelAttribute("mem_id") String mem_id) {
		myInfoServiceInter.delete(mem_id);
		return "redirect:/home";
	}
	
}
