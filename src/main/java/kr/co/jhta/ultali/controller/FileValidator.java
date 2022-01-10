package kr.co.jhta.ultali.controller;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;


// Validator가 해당 클래스에 대한 값 검증을 지원하는 지의 여부를 리턴
@Component
public class FileValidator implements Validator {

	// 객체에 대한 값 검증을 지원하는 지의 여부를 리턴한다
	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// target : 검사 대상 올린파일
		// errors : 발생하는 에러
		UploadFile file = (UploadFile)target;
		
		MultipartFile mf = file.getFile();
		
		int fileSize = 1024*1024*10;	// 10Mb
		
		// 파일을 선택하지 않고 전송한 경우
		if(mf.getSize() == 0) {
			errors.rejectValue("file", null, "파일을 선택해주세요");
		} else if(mf.getSize() > fileSize) {
			// errors.rejectValue(에러가 발생하는 곳, 에러코드, 메세지) 
			// form태그 <form:errors path="file"></form:errors>로 메세지를 넘겨줌
			errors.rejectValue("file", null, "10Mb 이하의 파일만 전송 가능합니다");
		}
		
	}

	
}
