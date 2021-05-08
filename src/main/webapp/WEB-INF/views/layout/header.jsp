<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	    	</ul>
		</div> 
	</nav>
</body>
