<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기 결과</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/home.css">
<link rel="stylesheet" href="${path}/resources/css/find_id_password.css">
<style type="text/css">
	#idResult{
		margin-bottom: 50px;
	}
	.btn-move{
		width : 150px;
		height : 40px;
		background: white;
		border : 1px solid skyblue;
		color : skyblue;
		cursor: pointer;
		border-radius: 20px;
	}
	#span-id{
	color: skyblue;
	}

	#a-id{
	border-bottom: 1px solid skyblue;
	}
</style>
</head>
<body>

<!-- <div class="nav-color-width"></div>
	<header>
		<div class="header">
			<div class="nav">
				<a href="../register/register" class="nav-a">회원가입</a>
				<a href="login" class="nav-a">로그인</a>
				<a href="../myPage/myInfo" class="nav-a">마이페이지</a>
				<a href="../help/notice" class="nav-a">고객센터</a>
				<a href="admin/reportList" class="nav-a">관리자페이지</a>
			</div>
			<div class="logo-container">
				<a href="../home"><img src="../resources/img/logo.png" alt="" /></a>
			</div>
		</div>
	</header>	 -->
	
	<jsp:include page="../home/header.jsp" />
	
	<h1>아이디/비밀번호 찾기</h1>
	
	
	
	<div id="container">
		<div id="find-form">
			<div id="btn-form">
				<a href="find" class="a-find" id="a-id"><span id="span-id" class="span-find">아이디찾기</span></a>
				<a href="findPassword" class="a-find" id="a-pw"><span id="span-pw" class="span-find">비밀번호 재설정</span></a>
			</div>
			
			<h2>아이디 찾기 결과</h2>
			<h4>해당되는 정보로 가입하신 아이디입니다.</h4>
			<div id="input-form">
				<h1 id="idResult">${id }</h1>
				<a href="../"><input type="button" class="btn-move" value="메인화면으로 이동" /></a>
				<a href="login"><input type="button" class="btn-move" value="로그인하러 가기" /></a>
			</div>
			
		</div>
	</div>

	<jsp:include page="../home/footer.jsp" />
	
</body>
</html>