package kr.spring.board_portfolio.service;

import java.util.ArrayList;

import kr.spring.board_portfolio.vo.BoardVo;

public interface BoardService {

	void setBoard(BoardVo board);

	ArrayList<BoardVo> getBoardList();

}
