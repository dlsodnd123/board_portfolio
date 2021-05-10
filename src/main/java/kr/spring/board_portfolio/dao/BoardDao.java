package kr.spring.board_portfolio.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.spring.board_portfolio.pagination.Criteria;
import kr.spring.board_portfolio.vo.BoardVo;
import kr.spring.board_portfolio.vo.CommentVo;

public interface BoardDao {

	void insertBoard(@Param("board")BoardVo board);

	ArrayList<BoardVo> selectBoardList(@Param("cri")Criteria cri);

	BoardVo selectBoard(@Param("bo_num")int bo_num);

	void updateBoard(@Param("board")BoardVo board);

	void delBoard(@Param("bo_num")int bo_num);

	int selectBoardCount();

	void insertComment(@Param("comment")CommentVo comment);

	ArrayList<CommentVo> selectCommentList(@Param("bo_num")int bo_num);

	void updateComment(@Param("comment")CommentVo comment);

	CommentVo selectComment(@Param("com_num")int com_num);

	void delComment(@Param("comment")CommentVo comment);

}
