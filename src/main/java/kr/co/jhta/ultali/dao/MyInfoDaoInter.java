package kr.co.jhta.ultali.dao;
import kr.co.jhta.ultali.dto.MyInfoDto;

public interface MyInfoDaoInter {
	// 정보 불러오기 (select)
	public MyInfoDto selectOne(String id);
	
	// 정보 수정하기 (modify)
	public void modify(String mem_id);
	
	// 회원 탈퇴하기 (delete)
	public void deleteOne(String id);
}
