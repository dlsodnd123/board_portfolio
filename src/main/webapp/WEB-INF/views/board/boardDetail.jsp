<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글상세</title>
<style type="text/css">
	.boardDetail-box{
		margin-top: 25px;
		margin-bottom: 30px;
	}
	.boardDetail-btn-box{
		margin-top: 15px;
		padding-bottom: 15px;
		border-bottom: 1px solid #dee2e6;
	}
	.boardDetail-list-btn{
		float: right;
	}
	.table{
		margin-bottom: 5px;
	}
	.table thead th{
		border: none;
		font-size: 18px;
	}
	.table tbody td{
		font-size: 12px;
	}
	#bo_content{
		resize: none;
		width: 100%;
		border: none;
		border-top: 1px solid #dee2e6;
		padding: 10px 12px;
		font-size: 12px;
	}
	#bo_content:focus {
		outline: none;
	}
	.boardDetail-comment-box{
		border-top: 1px solid #dee2e6;
		font-size: 12px;
		background-color: lightgray;
		padding-bottom: 15px; 
	}
	.comment-info-box{
		padding: 10px 0;
		margin: 0 10px;
		border-bottom: 1px solid #707070;
	}
	.comment-wirter,
	.comment-registerDate{
		display: inline-block;
	}
	.comment-wirter{
		margin-right: 20px;
		font-weight: 700;
	}
	.boardDetail-commentReg-box{
		margin: 12px 0 12px 10px;
	}
	.comment-content{
		margin-top: 10px;
	}
	.commentReg-content{
		width: 90%;
		vertical-align: middle;
		resize: none;
	}
	.commentReg-content:focus {
		outline: none;
	}
	.commentReg-btn{
	 	padding: 25px 10px;
	}
</style>
</head>
<body>
	<div class="container col-10 boardDetail-box">		
		<table class="table">
			<thead>
				<tr>
					<th>${board.bo_title}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>작성자: ${board.bo_mb_nickname}</td>
					<td>등록일: ${board.bo_registerDate}</td>
					<td>조회수: ${board.bo_view}</td>
				</tr>
			</tbody>
		</table>
		<textarea rows="13" id="bo_content" class="bo_content" readonly>${board.bo_content}</textarea>
		<div class="boardDetail-comment-box">
			<div class="comment-info-box">
				<div class="comment-wirter">아이디</div>
				<div class="comment-registerDate">2021.05.09 13:31:49</div>
				<div class="comment-content">댓글내용</div>				
			</div>
			<div class="boardDetail-commentReg-box">
				<textarea rows="4" class="commentReg-content"></textarea>
				<button type="button" class="btn btn-light commentReg-btn">등록</button>
			</div>
		</div>
		<div class="boardDetail-btn-box">
			<a href="#"><button type="button" class="btn btn-info boardDetail-modify-btn">수정</button></a>
			<a href="#"><button type="button" class="btn btn-secondary boardDetail-delete-btn">삭제</button></a>
			<a href="<%=request.getContextPath()%>/board/list"><button type="button" class="btn btn-light boardDetail-list-btn">목록</button></a>
		</div>
	</div>
</body>
</html>