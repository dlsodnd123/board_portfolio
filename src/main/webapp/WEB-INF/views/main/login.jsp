<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	.login-title{
		margin: 50px 0 30px 0;
		padding-bottom: 7px;
		border-bottom: 2px solid black;
	}
	.login-btn{
		width: 100%;
		padding: 10px 0;
		font-weight: 700;
		margin-bottom: 15px;
	}
	.fa-sign-in-alt{
		margin-right: 12px;
	}
	.kakao-login-btn{
		margin-bottom: 15px;
	}
	.login-btn-box{
		text-align: center;
	}
</style>
</head>
<body>
	<c:if test="${member == null}">
		<div class="container col-4">
	  		<h3 class="login-title"><i class="fas fa-sign-in-alt"></i> 로그인</h3>
	  		<form action="<%=request.getContextPath()%>/login" method="post" id="form">
	   			<div class="form-group">
	      			<input type="text" class="form-control" id="mb_id" name="mb_id" placeholder="아이디">
	   		 	</div>
	    		<div class="form-group">
	      			<input type="password" class="form-control" id="mb_pw" name="mb_pw" placeholder="비밀번호">
	    		</div>
	    		<div class="login-btn-box">
		    		<button type="submit" class="btn btn-primary login-btn">로그인</button>
		    		<a href="https://kauth.kakao.com/oauth/authorize?client_id=46135f3668cd3705d613d5207f15d428&redirect_uri=http://192.168.0.7:8080/board_portfolio/&response_type=code"><img class="kakao-login-btn" src="<%=request.getContextPath()%>/resources/img/kakao_login_medium_wide.png"></a>
		    	</div>
	  		</form>
		</div>
	</c:if>
	<c:if test="${member != null }">
		<div class="container col-6">
			<br> <br> 
			<h3><i class="fas fa-exclamation-triangle"> </i> 이미 로그인 되어 있습니다.</h3> <br>
			<a href="<%=request.getContextPath()%>/"><button type="button" class="btn btn-secondary">메인홈으로</button></a>
		</div>
	</c:if>
</body>
<script type="text/javascript">
	$('#form').submit(function(){
		var idPwCheck = false;
		var mb_id = $('#mb_id').val();
		var mb_pw = $('#mb_pw').val();
		if(mb_id == ''){
			alert('아이디를 입력해주세요.')
			return false;
		}else if(mb_pw == '') {
			alert('비밀번호를 입력해주세요')
			return false;
		}
		var sendData = {"mb_id" : mb_id, "mb_pw" : mb_pw}
		$.ajax({			
			async: false,
			type : 'post',
			data : JSON.stringify(sendData),
			dataType:"json",
			url : '<%=request.getContextPath()%>/idPw/check',
	        contentType:"application/json; charset=UTF-8",
			success : function(data){
				if(data.result == 'notId'){
					alert('일치하는 아이디가 없습니다.')
					return false;
				}else if(data.result == 'notSamePw'){
					alert('비밀번호가 일치하지 않습니다.')
					return false;
				}else
					idPwCheck = true;
			},
   	     	error: function(error) {
   	        	console.log('에러발생');
   	    	}
		})
		return idPwCheck;
	})
</script>
</html>