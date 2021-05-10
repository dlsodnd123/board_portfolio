package kr.spring.board_portfolio.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.spring.board_portfolio.pagination.Criteria;
import kr.spring.board_portfolio.vo.BoardVo;

public interface BoardDao {

	void insertBoard(@Param("board")BoardVo board);

	ArrayList<BoardVo> selectBoardList(@Param("cri")Criteria cri);

	BoardVo selectBoard(@Param("bo_num")int bo_num);

	void updateBoard(@Param("board")BoardVo board);

	void delBoard(@Param("bo_num")int bo_num);

	int selectBoardCount();

}
