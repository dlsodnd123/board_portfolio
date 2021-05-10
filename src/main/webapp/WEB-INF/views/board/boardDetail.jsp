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
	#bo_content:focus,
	.comment-modify-content:focus{
		outline: none;
	}
	.boardDetail-comment-box{
		border-top: 1px solid #dee2e6;
		font-size: 12px;
		background-color: whitesmoke;
		padding-bottom: 15px; 
	}
	.boardDetail-comment-box .btn{
		border-color: #707070;
	}
	.comment-info-box{
		padding: 10px 0;
		margin: 0 10px;
		border-bottom: 1px solid #707070;
	}
	.comment-info-box:after{
		content: '';
		clear: both;
		display: block;
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
	.boardDetail-btn-box:after {
		content: '';
		clear: both;
		display: block;
	}
	.comment-btn-box{
		float: right;
		
	}
	.comment-btn-box>.btn{
		font-size: 12px;
		padding: 7px;
	}
	.comment-modify-box{
		display: none;
		margin-top: 12px; 
	}
	.comment-modify-content{
		resize: none;
		width: 88%;
		vertical-align: middle;
	}
	.modify-confirm-btn,
	.modify-cancel-btn{
		font-size: 13px;
		padding: 9px 0;
		width: 5%;
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
			<c:forEach items="${commentList}" var="comment">
				<div class="comment-info-box">
					<div class="comment-wirter">${comment.com_mb_nickname}</div>
					<div class="comment-registerDate">${comment.com_registerDate}</div>
					<c:if test="${member.mb_nickname == comment.com_mb_nickname}">
						<div class="comment-btn-box">
							<button type="button" class="btn btn-light comment-modify-btn">수정</button>
							<button type="button" class="btn btn-light comment-del-btn">삭제</button>
						</div>
					</c:if>
					<div class="comment-content">${comment.com_content}</div>
					<div class="comment-modify-box">
						<textarea rows="2" class="comment-modify-content">${comment.com_content}</textarea>
						<button type="button" class="btn btn-light modify-confirm-btn">확인</button>
						<button type="button" class="btn btn-light modify-cancel-btn">취소</button>
					</div>
					<input type="hidden" name="com_num" value="${comment.com_num}">
				</div>
			</c:forEach>
			<c:if test="${member.mb_nickname != board.bo_mb_nickname}">
				<div class="boardDetail-commentReg-box">
					<textarea rows="4" class="commentReg-content"></textarea>
					<button type="button" class="btn btn-light commentReg-btn">등록</button>
				</div>
			</c:if>
		</div>		
		<div class="boardDetail-btn-box">
			<c:if test="${member.mb_nickname == board.bo_mb_nickname}">
				<a href="<%=request.getContextPath()%>/board/modify?bo_num=${board.bo_num}"><button type="button" class="btn btn-info boardDetail-modify-btn">수정</button></a>
				<button type="button" class="btn btn-secondary boardDetail-delete-btn">삭제</button>
			</c:if>
			<a href="<%=request.getContextPath()%>/board/list"><button type="button" class="btn btn-light boardDetail-list-btn">목록</button></a>
		</div>		
	</div>
</body>
<script type="text/javascript">
	// 게시글 삭제 버튼 클릭시
	$('.boardDetail-delete-btn').click(function(){
		if("${board.bo_mb_nickname}" != "${member.mb_nickname}" || "${member.mb_nickname}" == null){
			alert('권한이 없습니다.')
			return false;
		}
		var isDel = confirm('게시글을 삭제 하시겠습니까?')
		if(isDel){
			var bo_num = "${board.bo_num}"
			var data = {"bo_num" : bo_num}
			$.ajax({
	    		async: true,
	    		type: 'POST',
	    		data: data,
	    		url: '<%=request.getContextPath()%>/board/del',
	    		success: function(data){
	    			if(data == 'success')
	    			location.href = '<%=request.getContextPath()%>/board/list'
	    		},
	    		error: function(error) {
	    			console.log('에러발생');
	    		}
	    	})

		}
	})
	
	// 댓글 등록 버튼 클릭시
	$('.commentReg-btn').click(function(){
		if("${member}" == ""){
			alert('로그인이 필요합니다.');
			return false;
		}
		var com_content = $('.commentReg-content').val();
		if(com_content == '') {
			alert('1글자 이상 입력해야 합니다.');
			return false;
		}
		var com_mb_nickname = "${member.mb_nickname}";
		var com_bo_num = "${board.bo_num}";
		var sendData = {"com_content" : com_content, "com_mb_nickname" : com_mb_nickname, "com_bo_num" : com_bo_num}
		$.ajax({			
			async: false,
			type : 'post',
			data : JSON.stringify(sendData),
			dataType:"json",
			url : '<%=request.getContextPath()%>/comment/register',
	        contentType:"application/json; charset=UTF-8",
			success : function(data){
				
			},
   	     	error: function(error) {
   	        	console.log('에러발생');
   	    	}
		})
	})
	
	// 댓글 수정 버튼 클릭시
	$('.comment-modify-btn').click(function(){
		$(this).parents('.comment-btn-box').siblings('.comment-modify-box').show();
		$(this).parents('.comment-btn-box').siblings('.comment-content').hide();
		$(this).parents('.comment-btn-box').hide();
	})
	// 댓글 수정 버튼 클릭 후 취소 버튼 클릭시
	$('.modify-cancel-btn').click(function(){
		$(this).parents('.comment-modify-box').siblings('.comment-btn-box').show();
		$(this).parents('.comment-modify-box').siblings('.comment-content').show();
		$(this).parents('.comment-modify-box').hide();
	})
	// 댓글 수정 버튼 클릭 후 확인 버튼 클릭시
	$('.modify-confirm-btn').click(function(){
		var clickPoint = $(this);
		var com_content = $(this).siblings('.comment-modify-content').val();
		if(com_content == ''){
			alert('1글자 이상 입력해야 합니다.');
			return false;
		}
		var com_num = $(this).parent().siblings('input[name=com_num]').val();
		var sendData = {"com_content" : com_content, "com_num" : com_num}
		$.ajax({			
			async: false,
			type : 'post',
			data : JSON.stringify(sendData),
			dataType:"json",
			url : '<%=request.getContextPath()%>/comment/modify',
	        contentType:"application/json; charset=UTF-8",
			success : function(data){
				if(data.result == 'success'){
					clickPoint.parent().siblings('.comment-content').text(com_content);
					clickPoint.parents('.comment-modify-box').siblings('.comment-btn-box').show();
					clickPoint.parents('.comment-modify-box').siblings('.comment-content').show();
					clickPoint.parents('.comment-modify-box').hide();
				}
			},
   	     	error: function(error) {
   	        	console.log('에러발생');
   	    	}
		})
	})
	
	// 댓글 삭제 버튼 클릭시
	$('.comment-del-btn').click(function(){
		if(confirm('댓글이 삭제 됩니다. 삭제 하시겠습니까?')){
			var clickPoint = $(this);
			var com_mb_nickname = $(this).parents('.comment-info-box').find('.comment-wirter').text();
			var com_num = $(this).parent().siblings('input[name=com_num]').val();
			var sendData = {"com_mb_nickname" : com_mb_nickname, "com_num" : com_num}
			$.ajax({			
				async: false,
				type : 'post',
				data : JSON.stringify(sendData),
				dataType:"json",
				url : '<%=request.getContextPath()%>/comment/del',
		        contentType:"application/json; charset=UTF-8",
				success : function(data){
					if(data.result == 'success'){
						clickPoint.parents('.comment-info-box').remove();
					}else{
						alert('존재하지 않는 댓글 입니다. 게시글 목록으로 이동합니다.')
						location.href = '<%=request.getContextPath()%>/board/list'
					}
				},
	   	     	error: function(error) {
	   	        	console.log('에러발생');
	   	    	}
			})
		}
	})
</script>
</html>