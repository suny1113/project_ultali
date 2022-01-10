package kr.co.jhta.ultali.service;

import org.springframework.stereotype.Service;

// 찾은 아이디 결과에서 뒤의 두 글자를 *로 표시
@Service
public class FindIdResult {

	public String idResult(String id) {
		char[] id2 = new char[id.length()];
		
		for(int i = 0; i < id.length(); i++) {
			id2[i] = id.charAt(i);
			if(id.length()-i == 2 || id.length()-i == 1) {
				id2[i] = '*'; 
			}
		}
		return String.valueOf(id2);
	}
}
