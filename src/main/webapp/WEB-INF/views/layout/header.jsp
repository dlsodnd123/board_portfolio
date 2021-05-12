<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.nav-item .dropdown-item{
		font-size: 13px;
	}
</style>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<div class="container">
	    	<ul class="navbar-nav">
	    		<c:if test="${member == null}">
			      	<li class="nav-item">
			        	<a class="nav-link" href="<%=request.getContextPath()%>/login">로그인</a>
			      	</li>
		      	</c:if>
		      	<c:if test="${member != null}">
			      	<li class="nav-item">
			        	<a class="nav-link" href="<%=request.getContextPath()%>/logout">로그아웃</a>
			      	</li>			      	
		      	</c:if>
		      	<c:if test="${member == null}">
			      	<li class="nav-item">
			        	<a class="nav-link" href="<%=request.getContextPath()%>/signup">회원가입</a>
			      	</li>
		      	</c:if>
		      	<li class="nav-item">
		        	<a class="nav-link" href="<%=request.getContextPath()%>/">메인홈으로</a>
		      	</li> 
		      	<li class="nav-item">
		        	<a class="nav-link" href="<%=request.getContextPath()%>/board/list">게시판으로</a>
		      	</li>
		      	<c:if test="${member != null}">
			      	<li class="nav-item dropdown">
				      	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">정보수정</a>
				      	<div class="dropdown-menu">
				        <a class="dropdown-item nicknameChange" href="#">닉네임변경</a>
				      </div>
				    </li>
			    </c:if>     
	    	</ul>
		</div> 
	</nav>
</body>
<script type="text/javascript">
	$('.nicknameChange').click(function(){
		var url = '<%=request.getContextPath()%>/popup/nickChange';
        var name = 'chattingListPopup';
        var option = 'width = 500, height = 200, top = 100, left = 200, location = no'
        window.open(url, name, option);
	})
</script>
