package kr.co.jhta.ultali.controller;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

// uploadform의 파일의 <input type="file" name="file" id="" /> name인 file과 일치해야 modelattribute로 올라감
@Data
public class UploadFile {
	private MultipartFile file;
	
}