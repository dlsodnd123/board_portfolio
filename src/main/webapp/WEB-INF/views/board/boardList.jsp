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
	.boardList-btn-box{
		margin-bottom: 35px;	
	}
	.boardList-btn-box:after {
		content: '';
		clear: both;
		display: block;
	}	
	.pagination{
		font-size: 14px;
	}
	.boardList-searchSoft-box{
		margin-bottom: 10px;
	}
	.boardList-searchSoft-box .search-box{
		border: 1px solid black;
		width: 30%;
		display: inline-block;
		vertical-align: middle;
	}
	.search-box .boardList-search{
		border: none;
		border-left: 1px solid black;
		padding: 3px 0 3px 5px;
	}
	.search-box .boardList-search:focus{
		outline: none;
	}
	.search-box .boardList-type{
		border: none;
	}
	.boardList-searchSoft-box .boardList-search-btn{
		padding: 4px 12px;
		border: 1px solid black;
	}
</style>
</head>
<body>
	<div class="container">
	  	<h3 class="boardList-main-title"><i class="far fa-list-alt"></i> 게시글목록</h3>
	  	
	  	<div class="boardList-searchSoft-box">
	  		<form action="<%=request.getContextPath()%>/board/list" method="get" id="searchForm">
		  		<div class="search-box">
			  		<select class="boardList-type" name="type">
			  			<option value="1">전체</option>
			  			<option value="2">제목</option>
			  			<option value="3">내용</option>
			  			<option value="4">작성자</option>
			  		</select>
			  		<input type="text" class="boardList-search" name="search" value="${pageMaker.criteria.search}">
		  		</div>
			  	<button type="submit" class="btn btn-light boardList-search-btn">검색</button>
		  	</form>
	  	</div>	  	
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
		    	<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pageMaker.startPage - 1}&search=${pageMaker.criteria.search}&type=${pageMaker.criteria.type}">이전</a></li>
		    </c:if>
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">		    	
		    	<li class="page-item <c:if test="${pageMaker.criteria.page == index}">active</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${index}&search=${pageMaker.criteria.search}&type=${pageMaker.criteria.type}">${index}</a></li>		    	
		    </c:forEach>
		    <c:if test="${pageMaker.next}">
		    	<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pageMaker.endPage + 1}&search=${pageMaker.criteria.search}&type=${pageMaker.criteria.type}">다음</a></li>
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
	$('#searchForm').submit(function(){
		var searchContent = $('.boardList-search').val();
		if(searchContent == ''){
			alert('1글자 이상 입력해 주세요.')
			return false;
		}
	})
</script>
</html>