<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글등록</title>
<style type="text/css">
	.boardReg-main-title{
		margin: 30px 0 20px 0;
		border-bottom: 2px solid black;
		padding-bottom: 8px;
	}
	#bo_content{
		resize: none;
	}
	.boardReg-btn-box{
		float: right;
	}
</style>
</head>
<body>
	<c:if test="${member != null}">
		<div class="container col-8">
			<form action="<%=request.getContextPath()%>/board/register" method="post" id="form">
				<h3 class="boardReg-main-title"><i class="fas fa-edit"></i> 게시글등록</h3>
				<div class="form-group">
					<label for="bo_title">제목(필수)</label>
					<input type="text" class="form-control" id="bo_title" name="bo_title">
				</div>
				<div class="form-group">
				  	<label for="bo_content">내용</label>
				  	<textarea class="form-control" rows="13" id="bo_content" name="bo_content"></textarea>			  			  	
				</div>
				<div class="boardReg-btn-box">
					<button type="submit" class="btn btn-info boardReg-btn">등록</button>
				  	<a href="<%=request.getContextPath()%>/board/list"><button type="button" class="btn btn-light boardReg-cancel-btn">취소</button></a>
				</div>
				<input type="hidden" name="bo_mb_nickname" value="${member.mb_nickname}">	
			</form>
		</div>
	</c:if>
	<c:if test="${member == null}">
		<div class="container col-6">
			<br> <br>
			<h3><i class="fas fa-exclamation-triangle"> </i> 로그인이 필요합니다.</h3>
			<a href="<%=request.getContextPath()%>/login"><button type="button" class="btn btn-primary">로그인 페이지로</button></a>
			<a href="<%=request.getContextPath()%>/"><button type="button" class="btn btn-secondary">메인홈으로</button></a>
		</div>
	</c:if>
</body>
<script type="text/javascript">
	$('#form').submit(function(){
		var bo_title = $('#bo_title').val();
		if(bo_title == ''){
			alert('제목을 입력해 주세요.')
			return false;
		}
	})
</script>
</html>