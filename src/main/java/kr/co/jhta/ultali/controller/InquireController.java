package kr.co.jhta.ultali.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.ultali.dto.InquireDto;
import kr.co.jhta.ultali.service.InquireServiceInter;

@Controller
@RequestMapping("myPage")
public class InquireController {
	
	@Autowired
	InquireServiceInter inquireServiceInter;
	
	public void setInquireServiceInter(InquireServiceInter inquireServiceInter) {
		this.inquireServiceInter = inquireServiceInter;
	}

	@RequestMapping("inquire")
	public ModelAndView inquire(HttpSession session) {
		String mem_id = (String) session.getAttribute("mem_id");
		return new ModelAndView("myPage/inquire","showList",inquireServiceInter.showList(mem_id)) ;
	}

	@GetMapping("inquireWrite")
	public String inquireWrite(Model model,HttpSession session) {
		model.addAttribute("mem_id",session.getAttribute("mem_id"));
		return "myPage/inquireWrite";
	}
	
	@PostMapping("inquireWrite")
	public String makeInqure(@ModelAttribute("inquiredto")InquireDto inquiredto) {
		inquireServiceInter.inquireWrite(inquiredto);
		return "redirect:/myPage/inquire";
	}
	
	@RequestMapping("inquireDetail")
	public ModelAndView inquireDetail(@ModelAttribute("p_inq_no") int p_inq_no) {
		return new ModelAndView("myPage/inquireDetail","dto",inquireServiceInter.showOne(p_inq_no));
	}
}
