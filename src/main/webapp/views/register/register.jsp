<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>

<div class="wrapper">
	<h1>register.jsp</h1>
	<form action="register" method="post">
	<div class="wrap">
		<div class="subject">
			<span>회원가입</span>
		</div>
		<div class="id_wrap">
			<div class="id_name">아이디</div>
			<div class="id_input_box">
				<input type="text" class="id_input" id="id" name="mem_id">
			</div>
		</div>
		<div class="name_wrap">
			<div class="name_name">이름</div>
			<div class="name_input_box">
				<input type="text" input class="name_input" id="name" name="mem_name">
			</div>
		</div>
		<div class="phone_wrap">
			<div class="phone_name">전화번호</div>
			<div class="phone_input_box">
				<input type="text" input class="phone_input" id="phone" name="mem_phone">
			</div>
		</div>
		<div class="pw_wrap">
			<div class="pw_name">비밀번호</div>
			<div class="pw_input_box">
				<input type="password" class="pw_input" id="password" name="mem_pw">
			</div>
		</div>
		<!--  <div class="pw_check_wrap">
			<div class="pw_check_name">비밀번호 확인</div>
			<div class="pw_check_input_box">
				<input class="pw_check_input">
			</div> -->
		</div>		
		<div class="mail_wrap">
			<div class="mail_name">이메일</div>
			<div class="mail_input_box">
				<input type="text" class="mail_input" id="email" name="mem_email">
			</div>
		<!--  <div class="mail_check_wrap">
			<div class="mail_check_input_box">이메일 확인</div>
				<input class="mail_check_input">
			</div>
			<div class="mail_check_button">
				<span>인증번호 전송</span>
			</div>
			<div class="clearfix"></div>
		</div> -->	
		</div>
		
		<br>
		<div class="join_button_wrap">
			<input type="submit" class="join_button" value="가입완료">		
		</div>
		<br>
		<div class="cancel_button_wrap">
			<input type="submit" class="cancel_button" value="취소">		
		</div>
		</form>
	</div>	
	
</body>
</html>