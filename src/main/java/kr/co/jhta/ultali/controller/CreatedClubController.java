package kr.co.jhta.ultali.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.ultali.dto.MyClubDto;
import kr.co.jhta.ultali.service.CreatedClubServiceInter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("myPage")
public class CreatedClubController {
	
	@Autowired
	CreatedClubServiceInter createdClubServiceInter;
	
	public void setCreatedClubServiceInter(CreatedClubServiceInter createdClubServiceInter) {
		this.createdClubServiceInter = createdClubServiceInter;
	}
	
	@RequestMapping("createdClub")
	public ModelAndView createdClub(HttpSession session) {
		log.info("controller 도달");
		return new ModelAndView("myPage/createdClub","showClubList",createdClubServiceInter.showClubList((String)session.getAttribute("mem_id")));
	}
	
	// 버전 3
	@RequestMapping("applicantList")
	public ModelAndView applicantList(@ModelAttribute("c_no") int c_no) {
		System.out.println("controller");
		System.out.println(c_no);
		return new ModelAndView("myPage/applicantList","showAppList",createdClubServiceInter.showAppList(c_no));
	}
	
	// 버전2
//	@RequestMapping("applicantList")
//	public ModelAndView applicantList(HttpSession session) {
//		System.out.println(session.getAttribute("mem_id"));
//		return new ModelAndView("myPage/applicantList","showAppList",createdClubServiceInter.showAppList((String)session.getAttribute("mem_id")));
//	}
	
	@RequestMapping("approveApp")
	public String approveApp(@ModelAttribute("app_no")int app_no, @ModelAttribute("myclub")MyClubDto myclub) {
		System.out.println(app_no);
		System.out.println(myclub);
		createdClubServiceInter.applyApp(app_no);
		createdClubServiceInter.insertMyClub(myclub);
		return "redirect:applicantList";
	}
	
	
}
