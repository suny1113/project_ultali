<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">


<script type="text/javascript">

function validate() { 
	
var reg = /^[0-9]+/g; //숫자만 입력하는 정규식

if(!reg.test(phone.val())){
   alert("핸드폰 번호는 숫자만 입력할 수 있습니다.");
   phone.focus();
   return false;
}

var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
if(!pwdCheck.test(password.val())){
    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
    password.focus();
    return false;   
}

}
</script>

<title>Insert title here</title>
</head>
<body>
<!-- header -->
<jsp:include page="../home/header.jsp" />

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
				<input type="password" class="pw_input" id="password" name="mem_pw" >
				
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
			<input type="submit" class="join_button" value="가입완료" onclick="validate()">		
		</div>
		<br>
		<div class="cancel_button_wrap">
			<input type="submit" class="cancel_button" value="취소">		
		</div>
		</form>
	</div>	
	
<!-- footer -->
<jsp:include page="../home/footer.jsp" />	
</body>
</html>