<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/home.css">
<link rel="stylesheet" href="${path}/resources/css/find_id_password.css">
<link rel="stylesheet" href="${path}/resources/css/find_id.css">
<script type="text/javascript" src="${path }/resources/js/findPasswordResult.js"></script>
<style type="text/css">
	#a-pw{
		border-bottom: 1px solid skyblue;
	}
	#span-pw{
		color: skyblue;
	}
	.pw-frm{
		width : 280px;
		height: 55px;
		border : none;
		outline : 1px solid #D3D3D3;
		font-size: 20px;
		margin-bottom: 15px;
	}
	.pw-frm:focus{
		outline : 1px solid #A1D8EF;
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
	</header> -->
	
	<jsp:include page="../home/header.jsp" />
	<h1>아이디/비밀번호 찾기</h1>
	
	<div id="container">
		<div id="find-form">
			<div id="btn-form">
				<a href="find" class="a-find" id="a-id"><span id="span-id" class="span-find">아이디찾기</span></a>
				<a href="findPassword" class="a-find" id="a-pw"><span id="span-pw" class="span-find">비밀번호 재설정</span></a>
			</div>
			
			<h2>비밀번호 재설정</h2>
			<h4>새로운 비밀번호를 입력해주세요.</h4>
			<form id="frm">
				<div id="input-form" >
					<input type="password" name="mem_pw" class="pw-frm" id="pw" placeholder="새 비밀번호 입력"/>
					<input type="password" name="mem_rePw" class="pw-frm" id="rePw" placeholder="비밀번호 재입력" /><br>
					<h5 style="font-weight: normal;" id="warn" ></h5>
					<input type="button" id="submit-btn" value="변경완료" />
					<input type="hidden" id="hid" name="mem_id" value="${mem_id }" />
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="../home/footer.jsp" />

</body>
</html>