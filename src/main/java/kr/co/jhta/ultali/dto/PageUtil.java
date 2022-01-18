package kr.co.jhta.ultali.dto;

import java.util.HashMap;
import java.util.Map;

import javax.crypto.Mac;

public class PageUtil {

	public static Map<String, Object> getPageData(int totalNumber, int countPerPage, int currentPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 총 페이지수      500%10 == 0 ? 500/10 : 500?10+1
		int totalPage = (totalNumber%countPerPage==0)? totalNumber/countPerPage:totalNumber/countPerPage+1;
		
		// 현재 페이지의 게시물 시작번호
		int startNo = (currentPage-1)*countPerPage+1; // (3-1)*10+1
		
		// 현재 페이지의 게시물 끝번호
		int endNo = (currentPage)*countPerPage; // 3*10
		
		// 시작 페이지 번호 3-5 <=0 ? 1 :
		int startPageNo = currentPage-5<= 0? 1:currentPage-5;
		
		// 끝 페이지 번호 38 + 10 > 40 ? 40 : 38+10 
		int endPageNo = startPageNo+10 >= totalPage? totalPage : startPageNo+10;
		
		// 이전
		boolean prev = currentPage >5 ? true : false;
		
		// 다음
		boolean next = currentPage+5>=totalPage ? false:true;
		
		// 맵 객체에 담기
		map.put("totalPage", totalPage);
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		map.put("startPageNo", startPageNo);
		map.put("endPageNo", endPageNo);
		map.put("prev", prev);
		map.put("next", next);
		
		return map;
	}
}