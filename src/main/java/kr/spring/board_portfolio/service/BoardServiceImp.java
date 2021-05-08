package kr.spring.board_portfolio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.board_portfolio.dao.BoardDao;

@Service
public class BoardServiceImp implements BoardService{
	
	@Autowired
	BoardDao boardDao;

}
