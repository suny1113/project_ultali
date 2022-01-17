package kr.co.jhta.ultali.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.co.jhta.ultali.dto.RegisterDTO;

@Repository
public class RegisterDAO implements MemberDAO {

	// 자동으로 있으면 채워달라
	@Autowired
	// mapper와 transaction을 통제하기 위한 MyBatis
	private SqlSession ss;

	// 보존성을 주기 위한 setter 설정
	public void Setss(SqlSession ss) {
		this.ss = ss;
	}

	// abstract method

	@Override
	public void insertOne(RegisterDTO dto) {
		ss.insert("kr.co.jhta.ultali.register", dto);
		// 주어진 parameter로 들어가는 insert문
	}

	public int checkOverId(String mem_id) {
		return 0;
	}

	public void addOne(Map<String, String> map) {
		ss.insert("kr.co.jhta.ultali.addAuth", map);
	}
}