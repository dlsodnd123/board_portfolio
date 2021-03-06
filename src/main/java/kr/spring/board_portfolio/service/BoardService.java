package kr.spring.board_portfolio.service;

import java.util.ArrayList;

import kr.spring.board_portfolio.pagination.Criteria;
import kr.spring.board_portfolio.vo.BoardVo;
import kr.spring.board_portfolio.vo.CommentVo;

public interface BoardService {

	void setBoard(BoardVo board);

	ArrayList<BoardVo> getBoardList(Criteria cri);

	BoardVo getBoard(int bo_num);

	void modifyBoard(BoardVo board);

	void delBoard(int bo_num);

	int getBoardCount(Criteria cri);

	void setComment(CommentVo comment);

	ArrayList<CommentVo> getCommentList(int bo_num);

	void modifyComment(CommentVo comment);

	String delComment(CommentVo comment);

	CommentVo getNewComment(int com_num);

	void increaseView(int bo_num);

}
