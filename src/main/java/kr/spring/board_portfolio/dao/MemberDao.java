package kr.spring.board_portfolio.dao;

import org.apache.ibatis.annotations.Param;

import kr.spring.board_portfolio.vo.MemberVo;

public interface MemberDao {

	String idCheck(@Param("mb_id")String mb_id);

	String nicknmaeCheck(@Param("mb_nickname")String mb_nickname);

	void insertMember(@Param("member")MemberVo member);

	MemberVo selectMemberId(@Param("mb_id")String mb_id);

}
