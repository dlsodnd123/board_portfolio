<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	.signup-title{
		margin: 30px 0 25px 0; 
		border-bottom: 2px solid black;
		padding-bottom: 5px;
	}
	.form-group>input{
		font-size: 12px;		
	}
	.form-group>label{
		display: block;
		font-weight: 700;
	}
	#mb_id,
	#mb_nickname{
		display: inline-block;
		width: 80%;
	}
	.signup-btn,
	.signup-cancel-btn{
		width: 85px;
	}
	.error{
		color: red;
	}
</style>
</head>
<body>
	<c:if test="${member == null}">
		<div class="container col-6">
		  	<h3 class="signup-title"><i class="fas fa-user-plus"></i> 간편회원가입</h3>
		  	<form action="<%=request.getContextPath()%>/signup" method="post" id="form">
		    	<div class="form-group">
		    		<label for="mb_id" class="error"></label>	    		
		      		<label for="mb_id">아이디(필수)</label>
		      		<input type="text" class="form-control" id="mb_id" placeholder="2~15글자, 영문(소)/숫자만 가능" maxlength="15" name="mb_id">
		      		<button type="button" class="btn btn-primary id-Check-btn">중복검사</button>      		
		    	</div>
		    	<div class="form-group">
		    		<label for="mb_pw" class="error"></label>
		      		<label for="mb_pw">비밀번호(필수)</label>
		      		<input type="password" class="form-control" id="mb_pw" placeholder="8글자 이상, 영문(대,소)/숫자만가능" name="mb_pw">
		    	</div>	    	
		    	<div class="form-group">
		    		<label for="mb_pw2" class="error"></label>
		      		<label for="mb_pw2">비밀번호(필수)</label>
		      		<input type="password" class="form-control" id="mb_pw2" name="mb_pw2">
		    	</div>	    	
		    	<div class="form-group">
		    		<label for="mb_nickname" class="error"></label>
		      		<label for="mb_nickname">닉네임(필수)</label>
		      		<input type="text" class="form-control" id="mb_nickname" placeholder="1~15글자로 입력"  maxlength="15" name="mb_nickname">
		      		<button type="button" class="btn btn-primary nickname-Check-btn">중복검사</button>      		
		    	</div>	    	
		    	<div class="form-group">
		    		<label for="mb_email" class="error"></label>
		      		<label for="mb_email">이메일(선택)</label>
		      		<input type="text" class="form-control" id="mb_email" placeholder="ex)board@board.com" name="mb_email">	      		
		    	</div>	    	
		    	<input type="hidden" name="mb_division" value="normal">
		    	<div>   	
			    	<button type="submit" class="btn btn-primary signup-btn">가입</button>
			    	<a href="<%=request.getContextPath()%>/"><button type="button" class="btn btn-secondary signup-cancel-btn">취소</button></a>
		    	</div>
		  	</form>
		</div>
	</c:if>
	<c:if test="${member != null }">
		<div class="container col-6">
			<br> <br> 
			<h3><i class="fas fa-exclamation-triangle"> </i> 잘못된 접근 방식입니다.</h3> <br>
			<a href="<%=request.getContextPath()%>/"><button type="button" class="btn btn-secondary">메인홈으로</button></a>
		</div>
	</c:if>
</body>
<script type="text/javascript">
	var idCheck = false;
	var nicknameCheck = false;
	// 아이디 중복 체크
	$('.id-Check-btn').click(function(){
		var mb_id = $('#mb_id').val();
		if(mb_id.length < 2){
			alert('2글자 이상을 입력해주세요.');
			return false;
		}else if(mb_id.length > 16){
			alert('15글자 이하만 가능합니다.');
		}
		var data = {"mb_id" : mb_id}
		$.ajax({
    		async: true,
    		type: 'POST',
    		data: data,
    		url: '<%=request.getContextPath()%>/id/check',
    		success: function(data){
    			if(data == 'impossible'){
    				alert('사용중인 아이디 입니다.');
    				return false;
    			}else {
    				alert('사용가능한 아이디 입니다.');
    				idCheck = true;
    			}
    		},
    		error: function(error) {
    			console.log('에러발생');
    		}
    	})
	})
	// 아이디 중복검사 후 아이디 변경했을 떄 idCheck 값 변경하기
	$('#mb_id').change(function(){
		idCheck = false;
	})
	// 닉네임 중복 체크
	$('.nickname-Check-btn').click(function(){
		var mb_nickname = $('#mb_nickname').val();
		if(mb_nickname.length < 1){
			alert('1글자 이상을 입력해주세요.');
			return false;
		}else if(mb_nickname.length > 16){
			alert('15글자 이하만 가능합니다.');
		}
		var data = {"mb_nickname" : mb_nickname}
		$.ajax({
    		async: true,
    		type: 'POST',
    		data: data,
    		url: '<%=request.getContextPath()%>/nickname/check',
    		success: function(data){
    			if(data == 'impossible'){
    				alert('사용중인 닉네임 입니다.');
    				return false;
    			}else {
    				alert('사용가능한 닉네임 입니다.');
    				nicknameCheck = true;
    			}
    		},
    		error: function(error) {
    			console.log('에러발생');
    		}
    	})
	})
	
	$('#form').submit(function(){
		if(!idCheck){
			alert('아이디 중복검사를 해주세요.')
			return false;
		}
		if(!nicknameCheck){
			alert('닉네임 중복검사를 해주세요.')
			return false;
		}
	})
	
	$('#form').validate({
		rules : {
			mb_id : {
				required : true,
				regex : /^[0-9a-z]{2,15}$/
			},
			mb_pw : {
				required : true,
				regex : /^[0-9a-zA-Z]{8,}$/
			},
			mb_pw2 : {
				required : true,
				equalTo : mb_pw
			},
			mb_nickname : {
				required : true,
			},
			mb_email : {
				email : true
			}
		},
    	messages : {
    		mb_id : {
				required : '필수 입력 사항입니다.',
				regex : '2~15글자, 영문(소)/숫자만 가능합니다.'
			},
			mb_pw : {
				required : '필수 입력 사항입니다.',
				regex : '8글자이상, 영문(대,소)/숫자만 가능합니다.'
			},
			mb_pw2 : {
				required : '필수 입력 사항입니다.',
				equalTo : '비밀번호가 일치하지 않습니다.'
			},
			mb_nickname : {
				required :'필수 입력 사항입니다.',
			},
			mb_email : {
				email : '이메일 형식이 맞지 않습니다.'
			}
    	}	
	})
	$.validator.addMethod('regex',function(value, elemnt, regexp){
	        		var re = new RegExp(regexp);
	        		return this.optional(elemnt) || re.test(value);
	})

</script>
</html>