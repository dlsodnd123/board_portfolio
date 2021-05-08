<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div class="container col-6">
	  	<h3>간편회원가입</h3>
	  	<form action="<%=request.getContextPath()%>/signup" method="post" id="form">
	    	<div class="form-group">
	      		<label for="mb_id">아이디(필수)</label>
	      		<input type="text" class="form-control" id="mb_id" placeholder="2~15글자, 영문(소)/숫자만 가능" name="mb_id">	      		
	    	</div>
	    	<label for="mb_id" class="error" id="mb_id"></label>
	    	<div class="form-group">
	      		<label for="mb_pw">비밀번호(필수)</label>
	      		<input type="password" class="form-control" id="mb_pw" placeholder="8글자 이상, 영문(대,소)/숫자만가능" name="mb_pw">
	    	</div>
	    	<label for="mb_pw" class="error" id="mb_pw"></label>
	    	<div class="form-group">
	      		<label for="mb_pw2">비밀번호(필수)</label>
	      		<input type="password" class="form-control" id="mb_pw2" name="mb_pw2">
	    	</div>
	    	<label for="mb_pw2" class="error" id="mb_pw2"></label>
	    	<div class="form-group">
	      		<label for="mb_nickname">닉네임(필수)</label>
	      		<input type="text" class="form-control" id="mb_nickname" placeholder="1~15글자, 특수문자제외 하고 사용가능" name="mb_nickname">	      		
	    	</div>
	    	<label for="mb_nickname" class="error" id="mb_nickname"></label>
	    	<div class="form-group">
	      		<label for="mb_email">이메일(선택)</label>
	      		<input type="email" class="form-control" id="mb_email" placeholder="ex)board@board.com" name="mb_email">	      		
	    	</div>
	    	<label for="mb_email" class="error" id="mb_email"></label>	    	
	    	<button type="submit" class="btn btn-primary">가입</button>
	    	<a href="<%=request.getContextPath()%>/"><button type="button" class="btn btn-primary">취소</button></a>
	  	</form>
	</div>
</body>
</html>