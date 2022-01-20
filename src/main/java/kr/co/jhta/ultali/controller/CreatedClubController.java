package kr.co.jhta.ultali.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.ultali.dto.CNoStartEnd;
import kr.co.jhta.ultali.dto.InquirePageUtil;
import kr.co.jhta.ultali.dto.MyClubDto;
import kr.co.jhta.ultali.dto.PageUtil;
import kr.co.jhta.ultali.service.CreatedClubServiceInter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CreatedClubController {

	@Autowired
	CreatedClubServiceInter createdClubServiceInter;

	public void setCreatedClubServiceInter(CreatedClubServiceInter createdClubServiceInter) {
		this.createdClubServiceInter = createdClubServiceInter;
	}

	@RequestMapping("myPage/createdClub")
	public ModelAndView createdClub(HttpSession session) {
		log.info("controller 도달");
		return new ModelAndView("myPage/createdClub","showClubList",createdClubServiceInter.showClubList((String)session.getAttribute("id")));
	}


	//	@RequestMapping("myPage/applicant")
	//	public ModelAndView applicant(@ModelAttribute("c_no") int c_no,@RequestParam(name="currentPage",defaultValue = "1")int currentPage,Model model,HttpSession session) {
	//		
	//		// 여기 안에 선언을 해도 다시 불러오면 0 값이 되어버려서
	//		session.setAttribute("c_no", c_no);
	//		int totalPage = createdClubServiceInter.applicantTotalPage(c_no);
	//		int countPerPage = 4;
	//		
	//		// 다시 여기부터
	//		Map<String, Object> map  = InquirePageUtil.getPageData(totalPage, countPerPage, currentPage);
	//		model.addAttribute("map", map);
	//		
	//		int startNo = (int)map.get("startNo");
	//		int endNo = (int)map.get("endNo");
	//		System.out.println(startNo);
	//		System.out.println(endNo);
	//		
	//		return new ModelAndView("myPage/applicantList","showAppList",createdClubServiceInter.showAppList(c_no, startNo,endNo));
	//	}

	// 버전 3
	@RequestMapping("myPage/applicantList")
	public ModelAndView applicantList(@ModelAttribute("c_no") int c_no, HttpSession session, @RequestParam(name="currentPage",defaultValue = "1")int currentPage,Model model) {

		model.addAttribute("c_no",c_no);
		int totalPage = createdClubServiceInter.applicantTotalPage(c_no);
		int countPerPage = 4;

		Map<String, Object> map  = InquirePageUtil.getPageData(totalPage, countPerPage, currentPage);
		model.addAttribute("map", map);

		int startNo = (int)map.get("startNo");
		int endNo = (int)map.get("endNo");

		return new ModelAndView("myPage/applicantList","showAppList",createdClubServiceInter.showAppList(c_no, startNo,endNo));
	}

	// 버전2
	//	@RequestMapping("applicantList")
	//	public ModelAndView applicantList(HttpSession session) {
	//		System.out.println(session.getAttribute("mem_id"));
	//		return new ModelAndView("myPage/applicantList","showAppList",createdClubServiceInter.showAppList((String)session.getAttribute("mem_id")));
	//	}

	@RequestMapping("myPage/approveApp")
	public String approveApp(@ModelAttribute("myclub") MyClubDto myclub) {
		createdClubServiceInter.applyApp(myclub.getMy_no());
		createdClubServiceInter.insertMyClub(myclub);
		System.out.println("등록됨");
		return "redirect:createdClub";
	}

	// wishList
	@RequestMapping("myPage/wishList")
	public ModelAndView showWish(HttpSession session) {
		return new ModelAndView("myPage/wishList","showClubList",createdClubServiceInter.showWishList((String)session.getAttribute("id")));
	}

	@RequestMapping("myPage/myClubList")
	public ModelAndView myClubList(HttpSession session) {
		return new ModelAndView("myPage/myClubList","showClubList",createdClubServiceInter.myClubList((String)session.getAttribute("id")));
	}

	// recentClubList
	@RequestMapping("myPage/recentClub")
	public ModelAndView recent(HttpServletRequest request,HttpServletResponse response ) {
		Cookie []cookies = request.getCookies();
		List<Integer> list = new ArrayList();
		if(cookies.length>1) {
			for(Cookie c : cookies) {
				if(!c.getName().equals("JSESSIONID")) {
					System.out.println(c.getValue());
					list.add(Integer.parseInt(c.getValue()));
				}
			}
			return new ModelAndView("myPage/recentClubList","showClubList",	createdClubServiceInter.recentList(list));	
		}else {
			return new ModelAndView("myPage/recentClubList");
		}
	}

}
