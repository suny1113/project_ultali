<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/register.js"></script>
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="${path}/resources/css/home.css">
<link rel="stylesheet" href="${path}/resources/css/register.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../home/header.jsp" />
	<form method="post" action="register" id="register" name="register_form" autocomplete="off">
		<div class="body-container">
			<div id="inner-container">
				<h1>회원가입</h1>

				<table id="registerTable">
					<!-- ID -->

					<tr>
						<td>아이디</td>
						<td><input type="text" class="check" name="mem_id"
							id="mem_id" required oninput="idCheck()"></td>

					</tr>
					<tr>
						<td colspan="2"><span id="idError"></span></td>
					</tr>
					<!--  이름 -->

					<tr>
						<td>이름</td>
						<td><input type="text" class="check" name="mem_name"
							id="mem_name" required></td>
					</tr>

					<!-- 전화번호 -->

					<tr>
						<td>전화번호</td>
						<td><input type="text" class="check" id="mem_phone"
							name="mem_phone" required></td>
					</tr>

					<!-- 비밀번호 -->

					<tr>
						<td>비밀번호</td>
						<td><input type="password" class="check" id="mem_pw"
							" name="mem_pw" required></td>
					</tr>

					<!-- 비밀번호 확인 -->

					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" class="check" id="new_pwchk"
							name="new_pwchk"required></td>
					</tr>


					<!-- 이메일 -->

					<tr>
						<td>이메일</td>
						<td><input type="email" class="check" name="mem_email"
							id="mem_email" required></td>
					</tr>

					<!-- 가입완료 / 취소 -->

					<tr>
						<td colspan="2">
						<input type="button" id="joinbutton" class="jc_button" value="가입완료" onclick="registerform_check()"> 
						<input type="button" id="cancelbutton" class="jc_button" value="취소"></td>
					</tr>

				</table>

			</div>
		</div>
	</form>
	<!-- footer -->
	<jsp:include page="../home/footer.jsp" />
</body>
</html>