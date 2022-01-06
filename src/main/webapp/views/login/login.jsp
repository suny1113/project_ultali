<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="${path}/resources/css/home.css">
<style type="text/css">

	#header{
		width : 100%;
		height : 200px;
		background: red;
	}
	#login-top{
		width : 200px;
		height: 130px;
		margin: 0 auto;
	}
	
	#login-login{
		font-size: 50px;
		font-weight: bold;
		margin-left: 23px;
	}

	#container{
		width : 700px;
		height : 600px;
		margin : 0 auto;

	}
	#login{
		width : 500px;
		height : 230px;
		margin : 0 auto;
	}
	.login{
		width : 350px;
		height : 40px;
		margin-left: 70px;
		margin-bottom: 20px;
		border: 1px solid #C6C9CC;
		border-radius: 3px;
		font-size: 20px;
	}
	
	input[type="submit"]{
		width: 350px;
		height : 40px;
		margin-top : 20px;
		margin-left: 70px;
		background: skyblue;
		font-size: 20px;
		color: white;
		border: none;
		cursor: pointer;
	}
	#login_sub{
		width : 500px;
		height : 50px;
		margin : 0 auto;
		border-bottom: 2px solid #F0F0F0;
	}
	#find_register{
		float: right;
		margin : 0;
	}

	li{
		float: right;
		list-style: none;
	}
	#find::after{
		content: " | ";
		
	}
	a{
		text-decoration: none;
	}
	
	a:link{
		color:black;
	}
	a:visited{
		color: black;
	}

	#saveId{
		display: inline-block;
		
	}

	#checkbox{
		display: none;
	}

	#checkbox + #checkbox-label{
		cursor: pointer;
	}

	#checkbox + #checkbox-label:before{
		content: "";
		display: inline-block;
		width: 20px;
		height: 20px;
		border: 1px solid #cbcbcb;
		vertical-align: middle;
	}

	#checkbox:checked + #checkbox-label::before{
		content:"\f00c";
		font-family: "Font Awesome 5 free";
		font-weight: 900;
		color: #fff;
		background: #000;
		border-color: #000;
		font-size: 15px;
		text-align: center;
	}
	.logo-container {
		width: 100%;
		height: 150px;
		border-bottom: 1px solid rgb(240,240,240);
		text-align: center;
	}

</style>
</head>
<body>
	<!-- <h1>커스텀 로그인 페이지</h1> -->
	<h2><c:out value="${error }"></c:out></h2>
	<h2><c:out value="${logout }"></c:out></h2>
<div class="nav-color-width"></div>
	<header>
		<div class="header">
			<div class="nav">
				<a href="../register/register" class="nav-a">회원가입</a>
				<a href="login" class="nav-a">로그인</a>
				<a href="../myPage/myInfo" class="nav-a">마이페이지</a>
				<a href="../help/notice" class="nav-a">고객센터</a>

			</div>
			<div class="logo-container">
				<a href="../home"><img src="../resources/img/logo.png" alt="" /></a>
			</div>
		</div>
	</header>
		
	

	<div id="container">
	
		<form id="frm" action="<c:url value="/login" />" method="post">
			<div id="login-top">
				<span id="login-login">LOGIN</span>
			</div>
			<div id="login">
				<input type="text" name="username" id="" class="login" placeholder="아이디"/><br>
				<input type="password" name="password" id="" class="login" placeholder="비밀번호"/>
				<input type="submit" value="로그인" /><br>
			</div>
			<div id="login_sub">
				<div id="saveId">
					<input type="checkbox" name="" id="checkbox" />
					<label id="checkbox-label" for="checkbox" ><span>&nbsp;&nbsp;아이디저장</span></label>
				</div>
				<ul id="find_register">
					<li>&nbsp;&nbsp;&nbsp;<a href="../register/register">회원가입</a></li>
					<li id="find"><a href="find">아이디/비밀번호찾기</a>&nbsp;&nbsp;</li>
					
				</ul>
				
			</div>
			<input type="hidden" name="${_crsf.parameterName}" value="${_crsf.token }" />
		</form>
	
	</div>
	
<jsp:include page="../home/footer.jsp" />
</body>
</html>