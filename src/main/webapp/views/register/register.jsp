<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/register.js" ></script>
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/home.css">
<link rel="stylesheet" href="${path}/resources/css/register.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../home/header.jsp" />
	<form method="post" action="register" id="register" name="register">
	<div id="wrapper">
	<div id="container">
		
		
			
			<h1>회원가입</h1>
			
			<br>
			
			<!-- ID -->
			<div class="id_wrap">
				<label for="mem_id">아이디</label> 
				<span class="box int_id">
				<input type="text" class="int check" name="mem_id" id="mem_id" maxlength="20" required oninput="idCheck()">
				<span id="idError"></span>
				</span>
				
			</div>
			
			<br>
			
			<!--  이름 -->
			<div class="name_wrap">
				<label for="mem_name">이름</label>
				<span class="box int_id">
				<input type="text" class="int check" name="mem_name" id="mem_name" required>
				<span id="nameError"></span>			
				</span>
			</div>
			
			<br>
			
			<!-- 전화번호 -->
			<div class="phone_wrap">
				<label for="phone_name">전화번호</label>
				<span class="box">
					<input type="text" class="int check" id="mem_phone" name="mem_phone" required>
				<span id="phoneNumError"></span>
				</span>
			</div>
			
			<br>
			
			<!-- 비밀번호 -->
			<div class="pw_wrap">
				<label for="pw_name">비밀번호</label>
				<span class="box">
					<input type="password" class="int check" id="mem_pw"  name="mem_pw" required>
					<span id="pwError"></span>				
				</span>
				
			</div>
			
			<br>
			
			<!-- 비밀번호 확인 -->
			<div class="pw_check_wrap">
				<label for="pw_check_name">비밀번호 확인</label>
				 <span class="box int_id">
				 <input type="password" class="int check" id="mem_pwCheck" name="mem_pwCheck"  maxlength="20" required>
				 <span id="pwCheckError"></span>
				 </span>
			</div>
			
			<br>
			
			<!-- 이메일 -->
			<div class="mail_wrap">
				<label for="mail_name">이메일</label><br>
                  <span class="emailInt" id="emailBox"> 
                  <input type="text" class="check" id="mem_email" name="mem_email" maxlength="20" required>
                  <span id="emailError"></span>
                     <span>   @ </span> 
                        <!-- 이메일 택일 -->
                        <select id="mail_Select">
                           <option>이메일 선택</option>
                           <option>naver.com</option>
                           <option>gmail.com</option>
                           <option>daum.net</option>
                           <option>hanmail.net</option>
                           <option>hotmail.com</option>
                           <option>nate.com</option>
                           <option>yahoo.co.kr</option>
                           <option>empas.com</option>
                           <option>freechal.com</option>
                           <option>lycos.co.kr</option>
                           <option>korea.com</option>
                           <option>hanmir.com</option>
                           <option>dreamwiz.com</option>
                           <option>paran.com</option>
                        </select>
                  </span> 
               </div>

			<br>
			
			<!-- 가입완료 / 취소 -->
			<div id="btnJoinCancel">
				<input type="button" class="join_button" value="가입완료" onclick="checkRegister()"> 
				<input type="button" class="cancel_button" value="취소">
			</div>	
			
		
	</div>
	</div>
	</form>
	<!-- footer -->
	<jsp:include page="../home/footer.jsp" />
</body>
</html>