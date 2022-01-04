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

import kr.co.jhta.ultali.controller.FileValidator;
import kr.co.jhta.ultali.controller.UploadFile;
import kr.co.jhta.ultali.dao.Board2DAO;
import kr.co.jhta.ultali.dto.ClubDTO;
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
	public ModelAndView insertClubService(ClubDTO dto, String date, String date2, UploadFile file, BindingResult result) {
		ModelAndView mav = new ModelAndView();
		Model model;

		fileValidator.validate(file, result);
		
		// 이미지파일 이름 중복제거를 위한 메서드 만약 after라는 이미지파일이 존재하는데
		// 다른 사용자가 after이름을 가진 이미지 파일을 올리면 img폴더에 저장이 되지않고
		// 모임을 생성했을때 자신이 넣은 이미지가 아니라 다른사람이 넣은 이미지로 보일것이다.
		// 그래서 중복방지를 위해 imgFileNameDedup()메서드를 사용한다. 
		// (Club 테이블을 count(*)해서 이미지파일 이름 앞에 번호를 붙여줌)
		int imgDedup = dao.imgFileNameDedup();
		
		// aws에 올릴때 경로 바꿔야함
		String filePath = "D:\\dev\\project_ultali\\project_ultali\\src\\main\\webapp\\resources\\img";
		
		System.out.println("파일이 업로드되는 진짜 경로 : " + filePath);
		
		MultipartFile mfile = file.getFile();

		// 파일의 이름
		String fileName = mfile.getOriginalFilename();
		
		// 파일 객체
		// 실제 경로에 저장되는 객체 예:  filePath: /resources/img/ 
		// imgDedup + fileName: 15after.PNG
		File f = new File(filePath + "/" + imgDedup + fileName);
		
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
		
		log.info("registerPost dto:" + dto); 
		dao.insertClub(dto);
		return mav;
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
	public void updateClubService(ClubDTO dto, String date, String date2) {
		dto.setC_date(date+"/"+date2);
		dao.updateClub(dto);
		
	}



}
