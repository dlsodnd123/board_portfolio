package kr.spring.board_portfolio.service;

import javax.servlet.http.HttpServletRequest;

import kr.spring.board_portfolio.vo.MemberVo;

public interface MemberService {

	String idCheck(String mb_id);

	String nicknameCheck(String mb_nickname);

	void signup(MemberVo member);

	String idPwCheck(MemberVo member);

	MemberVo getMemberId(String mb_id);

	MemberVo getMember(String id);
	
	void setKakaoMember(String string);

	MemberVo getRequestMember(HttpServletRequest request);

	void nicknameChange(String mb_nickname, String mb_id);


}
