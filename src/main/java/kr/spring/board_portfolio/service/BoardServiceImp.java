package kr.spring.board_portfolio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.board_portfolio.dao.BoardDao;
import kr.spring.board_portfolio.vo.BoardVo;

@Service
public class BoardServiceImp implements BoardService{
	
	@Autowired
	BoardDao boardDao;

	// DB에 게시글 등록하기
	@Override
	public void setBoard(BoardVo board) {
		boardDao.insertBoard(board);
	}

}
