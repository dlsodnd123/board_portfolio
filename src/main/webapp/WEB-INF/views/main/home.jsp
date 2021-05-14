<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>메인홈</title>
	<style type="text/css">
		.main-home-title{
			margin-top: 30px;
			border-bottom: 2px solid black;
		}
		.Development-content-box{
			margin-top: 15px;
		}
		.Development-main-title{
			margin-bottom: 7px;
		}
		.Development-title,
		.Development-content{
			display: inline-block;
			margin-bottom: 5px;
		}
		.Development-title{
			width: 25%;
		}
		.Development-content{
			vertical-align: top;
		}
		.Development-img-box{
			margin: 12px 0 20px 0;
		}
		.Development-img-box>img{
			margin-right: 8px;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="main-home-title col-4">
			<h3><i class="far fa-clipboard"></i> Board Portfolio</h3>
		</div>
		<div class="Development-content-box">
			<div class="Development-main-title">● 개발환경</div>
			<div class="content-box">
				<div class="Development-title">- 운영체제</div><div class="Development-content">windows10</div>
			</div>
			<div class="content-box">
				<div class="Development-title">- 소스코드 작성 도구</div><div class="Development-content">Eclipse IDE for Enterprise Java Developers</div>
			</div>
			<div class="content-box">
				<div class="Development-title">- 웹 서버</div><div class="Development-content">Apache Tomcat 9.0</div>
			</div>
			<div class="content-box">
				<div class="Development-title">- 데이터베이스</div><div class="Development-content">MySQL</div>
			</div>
			<div class="content-box">
				<div class="Development-title">- 형상관리도구</div><div class="Development-content">GitHub, GitKraken</div>
			</div>
			<div class="content-box">
				<div class="Development-title">- 프론트엔드</div><div class="Development-content">HTML5, Javascript, jQuery, Ajax, Bootstrap4</div>
			</div>
			<div class="content-box">
				<div class="Development-title">- 벡엔드</div><div class="Development-content">jre-1.8, Javascript</div>
			</div>
			<div class="Development-img-box">
				<img src="<%=request.getContextPath()%>/resources/img/java 이미지.jpg">
				<img src="<%=request.getContextPath()%>/resources/img/JavaScript.png">
				<img src="<%=request.getContextPath()%>/resources/img/Eclipse IDE 이미지.jpg">
				<img src="<%=request.getContextPath()%>/resources/img/Apache Tomcat 9.0 이미지.png">
				<img src="<%=request.getContextPath()%>/resources/img/MySQL 이미지.png">
				<img src="<%=request.getContextPath()%>/resources/img/jQury 이미지.png">
				<img src="<%=request.getContextPath()%>/resources/img/GitHub 이미지.png">
				<img src="<%=request.getContextPath()%>/resources/img/HTML5 이미지.jpg">
				<img src="<%=request.getContextPath()%>/resources/img/bootstrap4 이미지.png">
			</div>
		</div>
		<div class="function-content-box">
			<div class="function-main-title">● 주요기능</div>
			<p class="function-content">- 일반회원가입, 로그인, 카카오 로그인, 게시글(등록, 수정, 삭제), 댓글, 게시글 검색</p>
		</div>
		<div class="info-content-box">
			<p class=info-content">● Spring MVC Project를 이용하여 구성</p>
			<p class=info-content">● 개발자 : 이래웅</p>
			<p class=info-content">● 이메일 : dlsodnd123@naver.com</p>
		</div>
	</div>
</body>
</html>
