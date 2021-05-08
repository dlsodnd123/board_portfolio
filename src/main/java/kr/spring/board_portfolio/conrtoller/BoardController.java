package kr.spring.board_portfolio.conrtoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board_portfolio.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	// 게시글 목록 페이지 담당
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public ModelAndView homeGet(ModelAndView mv) {
		
		mv.setViewName("/boardList");
		return mv;
	}
}
