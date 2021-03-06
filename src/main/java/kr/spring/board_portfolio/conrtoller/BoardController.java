package kr.spring.board_portfolio.conrtoller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board_portfolio.pagination.Criteria;
import kr.spring.board_portfolio.pagination.PageMaker;
import kr.spring.board_portfolio.service.BoardService;
import kr.spring.board_portfolio.vo.BoardVo;
import kr.spring.board_portfolio.vo.CommentVo;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	// 게시글 목록 페이지 담당
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public ModelAndView boardListGet(ModelAndView mv, Criteria cri) {
		// 게시글목록 가져오기
		ArrayList<BoardVo> boardList = boardService.getBoardList(cri);		
		int totalCount = boardService.getBoardCount(cri);
		int displayPageNum = 10;
		PageMaker pageMaker = new PageMaker(cri, displayPageNum, totalCount);
				
		mv.addObject("pageMaker", pageMaker);
		mv.addObject("boardList", boardList);
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
	
	// 게시글상세 페이지 담당
	@RequestMapping(value = "/board/detail", method = RequestMethod.GET)
	public ModelAndView boardDeatilGet(ModelAndView mv, int bo_num) {
		//조회수 증가 시키기
		boardService.increaseView(bo_num);
		BoardVo board = boardService.getBoard(bo_num);
		ArrayList <CommentVo> commentList = boardService.getCommentList(bo_num);
		
		mv.addObject("commentList", commentList);
		mv.addObject("board", board);
		mv.setViewName("/board/boardDetail");
		return mv;
	}
	
	// 게시글수정 페이지 담당
	@RequestMapping(value = "/board/modify", method = RequestMethod.GET)
	public ModelAndView boardModifyGet(ModelAndView mv, int bo_num) {
		BoardVo board = boardService.getBoard(bo_num);
		
		mv.addObject("board", board);
		mv.setViewName("/board/boardModify");
		return mv;
	}
	
	// 게시글 수정을 담당
	@RequestMapping(value = "/board/modify", method = RequestMethod.POST)
	public ModelAndView boardModifyPost(ModelAndView mv, BoardVo board) {
		boardService.modifyBoard(board);
		
		mv.setViewName("redirect:/board/detail?bo_num=" + board.getBo_num());
		return mv;
	}
	
	// 게시글 삭제 담당
	@RequestMapping(value = "/board/del", method = RequestMethod.POST)
	@ResponseBody
	public String boardDelPost(int bo_num) {
		boardService.delBoard(bo_num);
		return "success";
	}
	
	// 댓글 동록 담당
	@RequestMapping(value = "/comment/register", method = RequestMethod.POST)
	@ResponseBody
	public Object commentRegisterPost(@RequestBody CommentVo comment) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		boardService.setComment(comment);
		CommentVo newComment = boardService.getNewComment(comment.getCom_num());
		
		map.put("newComment", newComment);
		return map;
	}
	
	// 댓글 수정 담당
	@RequestMapping(value = "/comment/modify", method = RequestMethod.POST)
	@ResponseBody
	public Object commentModifyPost(@RequestBody CommentVo comment) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		boardService.modifyComment(comment);
		
		map.put("result", "success");
		return map;
	}
	
	// 댓글 삭제 담당
	@RequestMapping(value = "/comment/del", method = RequestMethod.POST)
	@ResponseBody
	public Object commentDelPost(@RequestBody CommentVo comment) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String result = boardService.delComment(comment);
		
		map.put("result", result);
		return map;
	}
}
