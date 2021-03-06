package kr.spring.board_portfolio.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.board_portfolio.dao.BoardDao;
import kr.spring.board_portfolio.pagination.Criteria;
import kr.spring.board_portfolio.vo.BoardVo;
import kr.spring.board_portfolio.vo.CommentVo;

@Service
public class BoardServiceImp implements BoardService{
	
	@Autowired
	BoardDao boardDao;

	// DB에 게시글 등록하기
	@Override
	public void setBoard(BoardVo board) {
		boardDao.insertBoard(board);
	}

	// 게시글목록 가져오기
	@Override
	public ArrayList<BoardVo> getBoardList(Criteria cri) {
		return boardDao.selectBoardList(cri);
	}

	// 게시글 번호와 일치하는 게시글 가져오기
	@Override
	public BoardVo getBoard(int bo_num) {
		return boardDao.selectBoard(bo_num);
	}

	// 게시글 수정하기
	@Override
	public void modifyBoard(BoardVo board) {
		boardDao.updateBoard(board);
	}

	// 게시글 삭제여부 변경하기
	@Override
	public void delBoard(int bo_num) {
		boardDao.delBoard(bo_num);
	}

	// 게시글의 총개수 가져오기
	@Override
	public int getBoardCount(Criteria cri) {
		return boardDao.selectBoardCount(cri);
	}

	// 댓글 등록하기
	@Override
	public void setComment(CommentVo comment) {
		boardDao.insertComment(comment);
		// 댓글 등록 후 댓글 갯수 증가시켜주기
		int cnt = 1;
		boardDao.updateCommentCnt(cnt, comment.getCom_bo_num());
	}

	// 댓글 목록 가져오기
	@Override
	public ArrayList<CommentVo> getCommentList(int bo_num) {
		return boardDao.selectCommentList(bo_num);
	}

	// 댓글 수정하기
	@Override
	public void modifyComment(CommentVo comment) {
		boardDao.updateComment(comment);
	}

	// 댓글 삭제하기
	@Override
	public String delComment(CommentVo comment) {
		CommentVo checkComment = boardDao.selectComment(comment.getCom_num());
		if(checkComment == null) {
			return "noneComment";
		}else {
			boardDao.delComment(comment);
			//댓글 삭제 후 댓글 갯수 감소시키기
			int cnt = -1;
			boardDao.updateCommentCnt(cnt, checkComment.getCom_bo_num());
		}
		return "success";
	}

	// 등록한 댓글 바로 가져오기
	@Override
	public CommentVo getNewComment(int com_num) {
		return boardDao.selectComment(com_num);
	}

	// 조회수 증가 시키기
	@Override
	public void increaseView(int bo_num) {
		boardDao.updateView(bo_num);
	}

}
