package kr.co.jhta.ultali.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jdk.internal.org.jline.utils.Log;
import kr.co.jhta.ultali.controller.FileValidator;
import kr.co.jhta.ultali.controller.PageThread;
import kr.co.jhta.ultali.controller.TargetThread;
import kr.co.jhta.ultali.controller.UploadFile;
import kr.co.jhta.ultali.dao.Board2DAO;
import kr.co.jhta.ultali.dto.ClubDTO;
import kr.co.jhta.ultali.dto.ClubInquiryAnswerDTO;
import kr.co.jhta.ultali.dto.ClubInquiryDTO;
import kr.co.jhta.ultali.dto.PagingDTO;
import kr.co.jhta.ultali.dto.WishDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImple implements BoardService{

	@Autowired
	Board2DAO dao;
	
	@Autowired
	FileValidator fileValidator;
	
	public void setDao(Board2DAO dao) {
		this.dao = dao;
	}
	
	@Override
	public ClubDTO selectOneClubService(int c_no) {
		return dao.selectClub(c_no);
	}


	@Override
	public ModelAndView insertClubService(ClubDTO dto, String date, String date2, UploadFile file, BindingResult result, int major_no) {
		ModelAndView mav = new ModelAndView();
		Model model;
		File f;
		fileValidator.validate(file, result);
		String name = "0";
		
		// 이미지파일 이름 중복제거를 위한 메서드 만약 after라는 이미지파일이 존재하는데
		// 다른 사용자가 after이름을 가진 이미지 파일을 올리면 img폴더에 저장이 되지않고
		// 모임을 생성했을때 자신이 넣은 이미지가 아니라 다른사람이 넣은 이미지로 보일것이다.
		// 그래서 중복방지를 위해 imgFileNameDedup()메서드를 사용한다. 
		// (Club 테이블을 count(*)해서 이미지파일 이름 앞에 번호를 붙여줌)
		int imgDedup = dao.imgFileNameDedup();
		
		// aws에 올릴때 경로 바꿔야함
		String filePath = "C:\\Users\\gkwls\\OneDrive\\바탕 화면\\final\\final_project_ultali\\final_project\\src\\main\\webapp\\resources\\img";

    
//		System.out.println("파일이 업로드되는 진짜 경로 : " + filePath);
		
		MultipartFile mfile = file.getFile();

		// 파일의 이름
		String fileName = mfile.getOriginalFilename();
		
		if(fileName == null || fileName == " " || fileName == "") {
			if(major_no == 1) {
//				f = new File(filePath + "/" + "아웃도어.jpg");
				name = "아웃도어.jpg";
			}else if(major_no == 2) {
//				f = new File(filePath + "/" + "스포츠.jfif");
				name = "스포츠.jpg";
			}else if(major_no == 3) {
//				f = new File(filePath + "/" + "쿠킹.jpg");
				name = "쿠킹.jpg";
			}else if(major_no == 4) {
//				f = new File(filePath + "/" + "공예.jfif");
				name = "공예.jpg";
			}else  if(major_no == 5) {
//				f = new File(filePath + "/" + "피트니스.jpg");
				name = "피트니스.jpg";
			}else if(major_no == 6) {
//				f = new File(filePath + "/" + "자기계발.jfif");
				name = "자기계발.jpg";
			}else if(major_no == 7) {
//				f = new File(filePath + "/" + "기타");
				name = "기타.png";
			}
			
			
			f = new File(filePath + "/" + name);
//			try {
//				mfile.transferTo(f);
//			} catch (IllegalStateException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
			
			
			mav.addObject("fileName", f.getName());
			mav.addObject("filePath", "../data/" + f.getName());
			
			
			
			mav.setViewName("redirect:/clubBoard/clubBoardList");
			
			// 데이터베이스에 저장되는 경로
			String imgPath = "/resources/img/" + name;
			
			// 모임일정을 받는 날짜가 두개여서 하나의 문자열로 만든 다음 dto에 추가 
			dto.setC_date(date+"/"+date2); 
			
			// 이미지파일 경로
			dto.setC_image(imgPath);
			
//		log.info("registerPost dto:" + dto); 
			dao.insertClub(dto);
			return mav;
			
			
		}else {
			f = new File(filePath + "/" + imgDedup + fileName);
			// 파일 객체
			// 실제 경로에 저장되는 객체 예:  filePath: /resources/img/ 
			// imgDedup + fileName: 15after.PNG
			
			// 임시 경로에 보관 중인 파일을 실제 위치에 저장
			try {
				mfile.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
			mav.addObject("fileName", f.getName());
			mav.addObject("filePath", "../data/" + f.getName());
			
			
			
			mav.setViewName("redirect:/clubBoard/clubBoardList");
			
			// 데이터베이스에 저장되는 경로
			String imgPath = "/resources/img/" + imgDedup + mfile.getOriginalFilename();
			
			// 모임일정을 받는 날짜가 두개여서 하나의 문자열로 만든 다음 dto에 추가 
			dto.setC_date(date+"/"+date2); 
			
			// 이미지파일 경로
			dto.setC_image(imgPath);
			
//		log.info("registerPost dto:" + dto); 
			dao.insertClub(dto);
			PageThread pt = new PageThread(new TargetThread());

			pt.run();
			return mav;

		}
		
		
	} 

	@Override
	public List<ClubDTO> selectAllClubService() {
		return dao.selectAllClub();
	}

	@Override
	public void deleteClubService(int c_no) {
		dao.deleteClub(c_no);
	}

	@Override
	public ModelAndView updateClubService(ClubDTO dto, String date, String date2, UploadFile file, BindingResult result, int c_no, int major_no) {
		ModelAndView mav = new ModelAndView();
		Model model;
		File f;
		fileValidator.validate(file, result);
		String name = "0";
		
		int imgDedup = dao.imgFileNameDedup();
		

		String filePath = "C:\\Users\\gkwls\\OneDrive\\바탕 화면\\final\\final_project_ultali\\final_project\\src\\main\\webapp\\resources\\img";	
		
		MultipartFile mfile = file.getFile();

		// 파일의 이름
		String fileName = mfile.getOriginalFilename();
		

		if(fileName == null || fileName == " " || fileName == "") {
			if(major_no == 1) {
//				f = new File(filePath + "/" + "아웃도어.jpg");
				name = "아웃도어.jpg";
			}else if(major_no == 2) {
//				f = new File(filePath + "/" + "스포츠.jfif");
				name = "스포츠.jpg";
			}else if(major_no == 3) {
//				f = new File(filePath + "/" + "쿠킹.jpg");
				name = "쿠킹.jpg";
			}else if(major_no == 4) {
//				f = new File(filePath + "/" + "공예.jfif");
				name = "공예.jpg";
			}else  if(major_no == 5) {
//				f = new File(filePath + "/" + "피트니스.jpg");
				name = "피트니스.jpg";
			}else if(major_no == 6) {
//				f = new File(filePath + "/" + "자기계발.jfif");
				name = "자기계발.jpg";
			}else if(major_no == 7) {
//				f = new File(filePath + "/" + "기타");
				name = "기타.png";
			}
			
			
			f = new File(filePath + "/" + name);

			
			mav.addObject("fileName", f.getName());
			mav.addObject("filePath", "../data/" + f.getName());
			mav.setViewName("redirect:/clubBoard/clubBoardDetail?c_no="+c_no);
			
			// 데이터베이스에 저장되는 경로
			String imgPath = "/resources/img/" + name;
			
			// 모임일정을 받는 날짜가 두개여서 하나의 문자열로 만든 다음 dto에 추가 
			dto.setC_date(date+"/"+date2); 
			
			// 이미지파일 경로
			dto.setC_image(imgPath);
			
//		log.info("registerPost dto:" + dto); 
			dao.updateClub(dto);
			return mav;
			
			
		}else {
			f = new File(filePath + "/" + imgDedup + fileName);
			// 파일 객체
			// 실제 경로에 저장되는 객체 예:  filePath: /resources/img/ 
			// imgDedup + fileName: 15after.PNG
			
			// 임시 경로에 보관 중인 파일을 실제 위치에 저장
			try {
				mfile.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
			mav.addObject("fileName", f.getName());
			mav.addObject("filePath", "../data/" + f.getName());
			mav.setViewName("redirect:/clubBoard/clubBoardDetail?c_no="+c_no);
			
			String imgPath = "/resources/img/" + imgDedup + mfile.getOriginalFilename();
			
			dto.setC_date(date+"/"+date2); 
			dto.setC_image(imgPath);	
			
			dao.updateClub(dto);
			
			PageThread pt = new PageThread(new TargetThread());
			pt.run();
			return mav;
		}	
	}

	@Override
	public boolean getWishService(WishDTO dto) {
		WishDTO wdto = dao.getWish(dto);
		
//		c_no가 널이 아니면 찜목록에 있으니까 true
		if(wdto.getC_no() != 0) {
			return true;
		}
		return false;
	}

	@Override
	public void insertWishService(WishDTO dto) {
		dao.insertWish(dto);

	}

	@Override
	public void deleteWishService(WishDTO dto) {
		dao.deleteWish(dto);

	}

	@Override
	public void insertClubInquiryService(ClubInquiryDTO cidto) {
		dao.insertClubInquiry(cidto);		
	}

	@Override
	public List<ClubInquiryDTO> getAllClubInquiryService(int c_no) {
		return dao.getAllClubInquiry(c_no);
	}

	@Override
	public int countInquiryService(int c_no) {
		return dao.countInquiry(c_no);
	}

	@Override
	public List<ClubInquiryDTO> selectInquiryService(PagingDTO dto) {
		return dao.selectInquiry(dto);
	}

	@Override
	public void insertAnswerService(ClubInquiryAnswerDTO ciadto) {
		dao.insertAnswer(ciadto);
	}

	@Override
	public List<ClubInquiryAnswerDTO> getAnswerService(String mem_id, int c_no) {
		ClubDTO cdto = new ClubDTO();
		cdto.setMem_id(mem_id);
		cdto.setC_no(c_no);
		return dao.getAnswer(cdto);
	}

	@Override
	public ClubInquiryAnswerDTO getOneAnswerService(int c_inq_no) {
		return dao.getOneAnswer(c_inq_no);
	}

	@Override
	public void increaseHitsService(int c_no) {
		dao.increaseHits(c_no);
		
	}


	// 헤더 search
	@Override
	public List<ClubDTO> searchClub(String word) {
		return dao.searchClub(word);
	}

	// search count
	@Override
	public int countSearchClub(String word) {
		return dao.countSearchClub(word);
	}

	// hits 내림차순 리스트
	@Override
	public List<ClubDTO> hitsClub() {
		return dao.hitsClub();
	}
	

}