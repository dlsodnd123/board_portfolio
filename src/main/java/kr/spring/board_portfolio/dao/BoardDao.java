package kr.spring.board_portfolio.dao;

import org.apache.ibatis.annotations.Param;

import kr.spring.board_portfolio.vo.BoardVo;

public interface BoardDao {

	void insertBoard(@Param("board")BoardVo board);

}
