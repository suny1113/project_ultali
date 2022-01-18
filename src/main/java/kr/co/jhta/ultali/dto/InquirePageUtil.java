package kr.co.jhta.ultali.dto;

import java.util.HashMap;
import java.util.Map;

public class InquirePageUtil {
	
	public static Map<String, Object> getPageData(int totalInquireCount, int countPerPage, int currentPage){
		
		Map<String , Object> map = new HashMap<String, Object>();
		
		// 총 페이지 수 // 나머지가 0 이면 그냥 나누고 0이 아니면 +1을 해준다.
		int totalPage = (totalInquireCount%countPerPage==0)?totalInquireCount/countPerPage:totalInquireCount/countPerPage+1 ;
		
		// 현재 페이지의 게시물 시작 번호
		int startNo = (currentPage-1)*countPerPage+1;
		
		// 현재 페이지의 게시물 끝 번호
		int endNo = (currentPage*countPerPage);
		
		// 시작 페이지 번호 // 이상한 부분
		int startPageNo = currentPage-5 <=0?1:(currentPage/5)*5+1;
				
		// 끝 페이지 번호
		int endPageNo = startPageNo+4 > totalPage?totalPage:startPageNo+4;
		
		// 이전
		boolean prev = currentPage > 5 ? true :false;
		
		// 다음
		boolean next = startPageNo+5> totalPage? false:true;
		
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
	
	
	public InquirePageUtil() {
		// TODO Auto-generated constructor stub
	}
}
