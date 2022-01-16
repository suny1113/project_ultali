package kr.co.jhta.ultali.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.ultali.dto.InquireDto;
import kr.co.jhta.ultali.dto.InquirePageUtil;
import kr.co.jhta.ultali.service.InquireServiceInter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class InquireController {
	
	@Autowired
	InquireServiceInter inquireServiceInter;
	
	public void setInquireServiceInter(InquireServiceInter inquireServiceInter) {
		this.inquireServiceInter = inquireServiceInter;
	}

	@RequestMapping("myPage/inquire")
	public ModelAndView inquire(@RequestParam(name = "currentPage",defaultValue = "1")int currentPage,HttpSession session,Model model) {
		
		// 문의 게시판의 전체 리스트
		int totalInquireCount = inquireServiceInter.totalInquireCount((String)session.getAttribute("id"));
		log.info("totalInquireCount : "+totalInquireCount);
		// 기본적으로 보여줄 문의 갯수는 10개 // 페이지당 개시물 수
		int countPerPage = 10;
		
		// 페이징 개수는 5개
		
		Map<String, Object> map = InquirePageUtil.getPageData(totalInquireCount, countPerPage, currentPage);
		model.addAttribute("map",map);
		int startNo = (int)map.get("startNo");
		int endNo =(int)map.get("endNo");
		

		String mem_id = (String) session.getAttribute("id");
		return new ModelAndView("myPage/inquire","showList",inquireServiceInter.showList(mem_id,startNo,endNo)) ;
	}

	@GetMapping("myPage/inquireWrite")
	public String inquireWrite(Model model,HttpSession session) {
		model.addAttribute("mem_id",session.getAttribute("id"));
		return "myPage/inquireWrite";
	}
	
	@PostMapping("myPage/inquireWrite")
	public String makeInqure(@ModelAttribute("inquiredto")InquireDto inquiredto) {
		inquireServiceInter.inquireWrite(inquiredto);
		return "redirect:/myPage/inquire";
	}
	
	@RequestMapping("myPage/inquireDetail")
	public ModelAndView inquireDetail(@ModelAttribute("p_inq_no") int p_inq_no,Model model) {
		model.addAttribute("p_inq_no",p_inq_no);
		return new ModelAndView("myPage/inquireDetail","dto",inquireServiceInter.showOne(p_inq_no));
	}
	
	@RequestMapping("myPage/deleteInquire")
	public String inquireDelete(@RequestParam("p_inq_no")int p_inq_no) {
		inquireServiceInter.deleteInquiry(p_inq_no);
		return "redirect:/myPage/inquire";
	}
	
	
}
