<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글목록</title>
<style type="text/css">
	.boardList-main-title{
		margin: 20px 0 15px 0;
	}
	.boardList-title{
		color: black;
	}
	.writing-btn{
		float: right;
	}
	.table{
		border-bottom: 1px solid #dee2e6;
	}
	.boardList-btn-box:after {
		content: '';
		clear: both;
		display: block;
	}
</style>
</head>
<body>
	<div class="container">
	  	<h3 class="boardList-main-title"><i class="far fa-list-alt"></i> 게시글목록</h3>
	  	<table class="table">
	    	<thead>
	      		<tr>
			        <th>번호</th>
			        <th>제목</th>
			        <th>작성자</th>
			        <th>작성일</th>
			        <th>조회수</th>
	      		</tr>
	    	</thead>
	    	<tbody>
	      		<tr>
			        <td>1</td>
			        <td><a href="#" class="boardList-title">게시글제목</a></td>
			        <td>홍길동</td>
			        <td>2021.05.08 21:51:13</td>
			        <td>2</td>
	     		</tr>
	    	</tbody>
	  	</table>
	  	<div class="boardList-btn-box">
	  		<a href="#"><button type="button" class="btn btn-info writing-btn">글쓰기</button></a>
	  	</div>
	</div>
</body>
</html>