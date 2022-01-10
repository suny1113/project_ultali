package kr.co.jhta.ultali.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.ultali.dto.ClubDTO;
import kr.co.jhta.ultali.dto.ClubInquiryAnswerDTO;
import kr.co.jhta.ultali.dto.ClubInquiryDTO;
import kr.co.jhta.ultali.dto.PagingDTO;
import kr.co.jhta.ultali.dto.WishDTO;
import kr.co.jhta.ultali.service.BoardService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/clubBoard")
public class Board2Controller {

	@Autowired
	BoardService service;
	
	@Autowired
	FileValidator fileValidator;
	
	public void setService(BoardService service) {
		this.service = service;
	}

	
//	울타리 게시판에서 c_no를받아 sql에 dto검색 후 boardDetail에서 보여줌 
	@GetMapping("/clubBoardDetail")
	public String boardDetailGet(@RequestParam("c_no") int c_no, Model model, HttpServletRequest request) {
		model.addAttribute("dto", service.selectOneClubService(c_no));
		
		// 임시 아이디세션 삭제해야됨
	    HttpSession session = request.getSession();
	    session.setAttribute("id", "dh");
	    
	    // 찜목록에 있는지 확인
	    WishDTO wdto = new WishDTO();
	    wdto.setMem_id((String) session.getAttribute("id"));
	    wdto.setC_no(c_no);

	    if(service.getWishService(wdto)) {
	    	model.addAttribute("wish","/resources/img/redheart.png");	    	
	    }else {
	    	model.addAttribute("wish","/resources/img/blackheart.png");	    	
	    }
	    
	    // 찜목록에 담겨있는지 확인
	    model.addAttribute("checkWish",service.getWishService(wdto));

	    
	    
		return "/clubBoard/clubBoardDetail";
	}
	
	@GetMapping("/clubModify")
	public String modifyGet(@ModelAttribute("dto") ClubDTO dto, Model model) {
		
		model.addAttribute("dto", dto);
		return "/clubBoard/clubModify";
	}
	
	@PostMapping("/clubModify")
	public ModelAndView modifyPost(@ModelAttribute("dto") ClubDTO dto, @RequestParam("date") String date, @RequestParam("date2") String date2, @ModelAttribute("uploadFile") UploadFile file, BindingResult result) {

		System.out.println("clubModifydtocontrol " + dto);
		return service.updateClubService(dto, date, date2, file, result);
	}
	
	
	@GetMapping("/clubRegister")
	public String registerGet() {
		return "/clubBoard/clubRegister";
	}
	
	@PostMapping("/clubRegister")
	
	public ModelAndView registerPost(@ModelAttribute("dto") ClubDTO dto, @RequestParam("date") String date, @RequestParam("date2") String date2,
							HttpServletRequest req, @ModelAttribute("uploadFile") UploadFile file, BindingResult result, Model model) {
		return service.insertClubService(dto, date, date2, file, result);
		
	}
	
	// 테스트용 게시판 하원이가 완성할거임
//	@GetMapping("/clubBoardList")
//	public String clubBoardListGet(Model model) {
//		model.addAttribute("clubList", service.selectAllClubService()); 
//		return "/clubBoard/clubBoardList";
//	}
	
	@GetMapping("/doQuestion")
	public String questionGet(@RequestParam("c_no") int c_no, Model model,
			@RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		// 모임장 답변
		ClubDTO cdto = service.selectOneClubService(c_no);
		
		int total = service.countInquiryService();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "2";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "2";
		}
		PagingDTO pdto = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		// 문의한 내용
		List<ClubInquiryDTO> viewsAll = service.selectInquiryService(pdto);
		
		// 답변 내용 페이지가 2페이지여서 2개씩 받아옴
		ClubInquiryAnswerDTO ciadto1 = service.getOneAnswerService(viewsAll.get(0).getC_inq_no());
		ClubInquiryAnswerDTO ciadto2 = service.getOneAnswerService(viewsAll.get(1).getC_inq_no());
			
		// 모임장 답글 넘기기
		
		// 페이징처리 dto
		model.addAttribute("paging", pdto);
		
		// 사용자 문의 가져오는 서비스
		model.addAttribute("viewAll", viewsAll);
		
		// 모임번호 
		model.addAttribute("c_no", c_no);
		
		// 모임장 dto
		model.addAttribute("cdto", cdto);
		
		// 모임장 답변
		model.addAttribute("ciadto1", ciadto1);
		model.addAttribute("ciadto2", ciadto2);
		
		
		return "/clubBoard/questionAnswer";
	}
	
	@GetMapping("/answerWrite")
	public String amswerWrite(@ModelAttribute("ciadto") ClubInquiryAnswerDTO ciadto,
			@RequestParam(value="nowPage", required=false)int nowPage
			, @RequestParam(value="cntPerPage", required=false)int cntPerPage, 
			@RequestParam("c_no") int c_no,
			HttpSession session) {
		
		// 아이디 값을 가져올때 이상하게 가져와져서 세션에 있는 아이디를 받아옴
		ciadto.setMem_id(((String) session.getAttribute("id")));
		System.out.println("ciadtoaaaaaaaaaaaaa:" + ciadto);
		
		
//		service.insertAnswerService(ciadto);
		
		return "redirect:/clubBoard/doQuestion?nowPage="+nowPage+"&cntPerPage="+cntPerPage+"&c_no="+c_no;
	}
	
	@RequestMapping("clubDelete")
	public String clubDelete(@RequestParam("c_no") int c_no) {
		service.deleteClubService(c_no);
		return "redirect:/clubBoard/clubBoardList";
	}
	
	@GetMapping("/questionWrite")
	public String questionWriteGet(@RequestParam("c_no") int c_no, Model model) {
		
		model.addAttribute("c_no", c_no);
		return "/clubBoard/questionWrite";
	}
	
	@PostMapping("/questionWrite")
	public String questionWritePost(@ModelAttribute("cidto") ClubInquiryDTO cidto, Model model, HttpSession session){
		
		cidto.setMem_id((String) session.getAttribute("id"));
		System.out.println("cidto:" + cidto);
		service.insertClubInquiryService(cidto);
		
		// doQuestion로 값을 넘길때 필요함
		model.addAttribute("c_no", cidto.getC_no());
		
		return "redirect:/clubBoard/doQuestion";
	}
	
	@RequestMapping("addOrDeleteWish")
	public String addWishOrDeleteWish(@RequestParam("checkWish") String checkWish, @RequestParam("c_no") int c_no, HttpSession session) {
		WishDTO wdto = new WishDTO();
		wdto.setC_no(c_no);
		wdto.setMem_id((String) session.getAttribute("id"));
		

		
		if(checkWish.equals("true")) {
			service.deleteWishService(wdto);
		}else if(checkWish.equals("false")) {
			service.insertWishService(wdto);
		}
		
		
		return "redirect:/clubBoard/clubBoardDetail?c_no="+c_no;
	}

}
