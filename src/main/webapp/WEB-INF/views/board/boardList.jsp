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
	.pagination{
		font-size: 14px;
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
	    		<c:forEach items="${boardList}" var="board">
		      		<tr>
				        <td>${board.bo_num}</td>
				        <td><a href="<%=request.getContextPath()%>/board/detail?bo_num=${board.bo_num}" class="boardList-title">${board.bo_title}</a></td>
				        <td>${board.bo_mb_nickname}</td>
				        <td>${board.bo_registerDate}</td>
				        <td>${board.bo_view}</td>
		     		</tr>
	     		</c:forEach>
	    	</tbody>
	  	</table>
	  	<ul class="pagination justify-content-center">
	  		<c:if test="${pageMaker.prev}">
		    	<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pageMaker.startPage - 1}">이전</a></li>
		    </c:if>
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">		    	
		    	<li class="page-item <c:if test="${pageMaker.criteria.page == index}">active</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${index}">${index}</a></li>		    	
		    </c:forEach>
		    <c:if test="${pageMaker.next}">
		    	<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pageMaker.endPage + 1}">다음</a></li>
		    </c:if>
		  </ul>
	  	<div class="boardList-btn-box">
	  		<a href="<%=request.getContextPath()%>/board/register"><button type="button" class="btn btn-info writing-btn">글쓰기</button></a>
	  	</div>
	</div>
</body>
<script type="text/javascript">
	$('.writing-btn').click(function(){
		if("${member}" == ''){
			var isLogin = confirm('로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?');
			if(isLogin){
				location.href = '<%=request.getContextPath()%>/login'
			}
			return false;			
		}
	})
</script>
</html>