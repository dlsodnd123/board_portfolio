package kr.spring.board_portfolio.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.spring.board_portfolio.vo.BoardVo;

public interface BoardDao {

	void insertBoard(@Param("board")BoardVo board);

	ArrayList<BoardVo> selectBoardList();

	BoardVo selectBoard(@Param("bo_num")int bo_num);

}
