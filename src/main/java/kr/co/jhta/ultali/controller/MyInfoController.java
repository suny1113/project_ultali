package kr.co.jhta.ultali.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.ultali.dto.MyInfoDto;
import kr.co.jhta.ultali.service.MyInfoServiceInter;

@Controller
@RequestMapping("/myPage")
public class MyInfoController {
	
	@Autowired
	MyInfoServiceInter myInfoServiceInter;

	public void setMyInfoServiceInter(MyInfoServiceInter myInfoServiceInter) {
		this.myInfoServiceInter = myInfoServiceInter;
	}
	
	@RequestMapping("id")
	public String id() {
		return "myPage/id";
	}
	
	@RequestMapping("myInfo")
	public ModelAndView showInfo(@ModelAttribute("mem_id") String mem_id) {
		MyInfoDto myInfoDto = myInfoServiceInter.showInfo(mem_id);
		return new ModelAndView("myPage/myInfo","myInfoDto",myInfoDto);
	}
	
	@GetMapping("modify")
	public ModelAndView modify(@ModelAttribute("mem_id") String mem_id) {
    	 MyInfoDto myInfoDto = myInfoServiceInter.showInfo(mem_id);
		return new ModelAndView("myPage/myInfoModify","myInfoDto",myInfoDto);
	}
	
	@PostMapping("modify")
	public String modifyInfo(@ModelAttribute("dto") MyInfoDto dto) {
//		myInfoServiceInter.update(dto);
		return "redirect:/home";
	}
	
	@RequestMapping("delete")
	public String deleteOne(@ModelAttribute("mem_id") String mem_id) {
		myInfoServiceInter.delete(mem_id);
		// 경로 문제 수정
		return "redirect:/home";
	}
	
}
