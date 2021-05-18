<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임변경</title>
<style type="text/css">
	.nickname-main-title{
		margin: 25px 0 15;
	}
	.form-control{
		font-size: 13px;
		width: 70%;
		display: inline-block;
		vertical-align: top;
	}
	.nickname-Check-btn{
		font-size: 13px;
	}
	.error{
		color: red;
	}
	.nickChange-input-box{
		margin-bottom: 12px; 
	}
</style>
</head>
<body>
	<div class="container">
		<h5 class="nickname-main-title"><i class="fas fa-pencil-alt"></i> 닉네임 변경</h5>
		<div class="nickChange-input-box">
			<input type="text" class="form-control" id="mb_nickname" placeholder="1~15글자로 입력"  maxlength="15" name="mb_nickname" value="${member.mb_nickname}">
		    <button type="button" class="btn btn-primary nickname-Check-btn">중복검사</button>
	    </div>
	    <label for="mb_nickname" class="error" id="mb_nickname"></label>
	    <button type="button" class="btn btn-primary nickname-confirm-btn">변경</button>
	</div>
</body>
<script type="text/javascript">
	var nicknameCheck = false;
	//닉네임 중복 체크
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
	// 변경 버튼 클릭시
	$('.nickname-confirm-btn').click(function(){
		if(!nicknameCheck){
			alert('닉네임 중복검사를 해주세요.')
			return false;
		}			
		var mb_nickname = $('input[name=mb_nickname]').val();
		var data = {mb_nickname};
		$.ajax({
    		async: true,
    		type: 'POST',
    		data: data,
    		url: '<%=request.getContextPath()%>/nickname/change',
    		success: function(data){
    			alert('닉네임이 변경 되었습니다. 다시 로그인이 필요합니다.');
    			location.href = '<%=request.getContextPath()%>/logout'
    			close();
    		},
    		error: function(error) {
    			console.log('에러발생');
    		}
    	})
	})	
</script>
</html>