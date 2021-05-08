package kr.spring.board_portfolio.service;

import kr.spring.board_portfolio.vo.MemberVo;

public interface MemberService {

	String idCheck(String mb_id);

	String nicknameCheck(String mb_nickname);

	void signup(MemberVo member);

	String idPwCheck(MemberVo member);

	MemberVo getMemberId(String mb_id);

}
