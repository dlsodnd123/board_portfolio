package kr.spring.board_portfolio.conrtoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board_portfolio.service.BoardService;
import kr.spring.board_portfolio.vo.BoardVo;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	// 게시글 목록 페이지 담당
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public ModelAndView boardListGet(ModelAndView mv) {
		
		mv.setViewName("/board/boardList");
		return mv;
	}
	
	// 게시글 등록 페이지 담당
	@RequestMapping(value = "/board/register", method = RequestMethod.GET)
	public ModelAndView boardRegisterGet(ModelAndView mv) {
		
		mv.setViewName("/board/boardRegister");
		return mv;
	}
	
	// 게시글을 DB 등록을 담당
	@RequestMapping(value = "/board/register", method = RequestMethod.POST)
	public ModelAndView boardRegisterPost(ModelAndView mv, BoardVo board) {
		boardService.setBoard(board);
		
		mv.setViewName("redirect:/board/list");
		return mv;
	}
	
}