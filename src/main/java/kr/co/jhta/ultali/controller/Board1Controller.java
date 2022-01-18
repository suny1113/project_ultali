package kr.co.jhta.ultali.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.jhta.ultali.dto.AppDto;
import kr.co.jhta.ultali.dto.ClubDTO;
import kr.co.jhta.ultali.dto.PagingDTO;
import kr.co.jhta.ultali.dto.RegisterDTO;
import kr.co.jhta.ultali.service.Board1Service;
import lombok.extern.slf4j.Slf4j;


@Controller
public class Board1Controller {
	
	@Autowired
	Board1Service service;
	
	
	public void setService(Board1Service service) {
		this.service = service;
	}
	
	// 카테고리 클릭 후, 모임 리스트 출력
	@GetMapping("/clubBoard/clubBoardList")
	public String clubList(@RequestParam("major_no") int major_no, Model model,
							PagingDTO pdto, 
							@RequestParam(value="nowPage", required=false)String nowPage
							, @RequestParam(value="cntPerPage", required=false)String cntPerPage,
							@RequestParam(value="sort", required=false) String sort) {
		
		int sort_num = 3;
		
		if(sort == null) {
		} else if(sort != null) {
			sort_num = Integer.parseInt(sort);
		}
		
		int total = service.countClubService(major_no);
	    if (nowPage == null && cntPerPage == null) {
	        nowPage = "1";
	        cntPerPage = "8";
	    } else if (nowPage == null) {
	        nowPage = "1";
	    } else if (cntPerPage == null) { 
	        cntPerPage = "8";
	    }
	    cntPerPage = "8";
	    pdto = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	    pdto.setMajor_no(major_no);


	    model.addAttribute("paging", pdto);
	    model.addAttribute("viewAll", service.selectClubService(pdto));
	    model.addAttribute("major_no", major_no);
	    
	    List<ClubDTO> top_list = service.selectTopClub(major_no);
		model.addAttribute("top_list", top_list);
	    model.addAttribute("paging", pdto);
	    
	    // 인기순
 		if(sort_num == 0) {
	 		model.addAttribute("viewAll", service.selectTopSort(pdto));
 		} 
 		else {
 			model.addAttribute("viewAll", service.selectClubService(pdto));
 		}
	    
	    model.addAttribute("major_no", major_no);
	    
		
		return "/clubBoard/clubBoardList";
	}
	
	// 모임 삭제(관리자 권한)
	@RequestMapping("/clubBoard/clubDelete2")
	public String clubDelete(@RequestParam("major_no") int major_no, RedirectAttributes redirect,
								HttpServletRequest request) {
		//System.out.println(major_no);
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		
		for(int i = 0; i < size; i++) {
			service.deleteClub(ajaxMsg[i]);
		}
				
		redirect.addAttribute("major_no", major_no);
		
		return "redirect:/clubBoard/clubBoardList";
	}
	

	// 모임 신청 폼으로 
	@GetMapping("/clubBoard/doApply")
	public String clubApplyForm(@RequestParam("c_no") int c_no, Model model) {
		
		model.addAttribute("c_no", c_no);
		
		return "/clubBoard/applicationForm";
	}
	
	// 모임 신청하기
	@PostMapping("/clubBoard/doApply")
	public String clubDoApply(@ModelAttribute("dto") AppDto dto, @RequestParam("c_no") int c_no,
								RedirectAttributes redirect) {
		
		service.insertApply(dto);
		redirect.addAttribute("c_no", c_no);
		
		return "redirect:/clubBoard/clubBoardDetail";
	}
	
}
