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
<link rel="stylesheet" href="${path}/resources/css/login.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
 
	function setCookie(name, value, exp){
		var date = new Date();
		date.setTime(date.getTime() + exp*24*60*60*1000)
	    document.cookie = name + "=" + value + ";expires=" + date.toUTCString() + ";path=/"
	}
	
	function deleteCookie(name){
	    document.cookie = name + "=; expires=Thu, 01 Jan 1999 00:00:10 GMT;path=/"	    
	}
	
	function getCookie(){
		var allCookies = document.cookie
		
		cookieArray = allCookies.split(";")
		
		for(var i=0; i < cookieArray.length; i++){
			name = cookieArray[i].split("=")[0]
			value = cookieArray[i].split("=")[1]
			
			if(name == "id"){
				$("#mem_id").val(value)
				$("#checkbox").prop("checked", true)
			}
		}
	}
	
	$(function(){

		getCookie()
		
		$("#submit-btn").click(function(){
			if($("#checkbox").is(":checked")){
				setCookie("id", $("#mem_id").val(), 7)
			}else if($("#checkbox").not(":checked")){
				deleteCookie("id")
			}
			$("#frm").submit()
		})
	})
</script>
<style type="text/css">
	.warn{
		display: block;
		text-align : center;
	    color: #FF3800;
	    font-size: 13px;
	    margin-bottom: 5px;
	}
</style>
</head>
<body>
	<h2><c:out value="${error }"></c:out></h2>
<div class="nav-color-width"></div>
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
	</header>
		
	

	<div id="container">
	
		<form id="frm" action="<c:url value="/login" />" method="post">
			<div id="login-top">
				<span id="login-login">LOGIN</span>
			</div>
			<div id="login">
				<input type="text" name="mem_id" id="mem_id" class="login" placeholder="아이디"/><br>
				<input type="password" name="mem_pw" id="" class="login" placeholder="비밀번호"/><br>
				<span class="warn">${msg }</span>
				<input type="button" id="submit-btn" value="로그인" /><br>
			</div>
			<div id="login_sub">
				<div id="saveId">
					<input type="checkbox" name="rememberId" id="checkbox" />
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