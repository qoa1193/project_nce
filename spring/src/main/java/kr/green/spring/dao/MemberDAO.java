package kr.green.spring.dao;


import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Param;

import kr.green.spring.vo.MemberVO;
 
public interface MemberDAO {

	MemberVO getMember(@Param("id")String id); 
	//항상 메소드 생성후엔 @Param 붙여줄것 하고 맵퍼스로 가서 셀렉트
	void signup(@Param("user")MemberVO user);
	int updateMember(@Param("user")MemberVO dbUser);
	ArrayList<MemberVO> getMemberByEmail(@Param("email")String email);
	void keeplogin(@Param("id")String id, @Param("session_id")String session_id, @Param("session_limit")Date session_limit);
	MemberVO getMemberBySessionId(@Param("session_id")String session_id); 
}


