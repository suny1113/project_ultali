<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/home.css">
<link rel="stylesheet" href="${path}/resources/css/find_id_password.css">
<link rel="stylesheet" href="${path}/resources/css/find_id.css">
<script src="${path }/resources/js/find_id.js"></script>
<style type="text/css">
#a-id{
	border-bottom: 1px solid skyblue;
}

#span-id{
	color: skyblue;
}

</style>
</head>
<body>

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

	<h1>아이디/비밀번호 찾기</h1>

	<div id="container">
		<div id="find-form">
			<div id="btn-form">
				<a href="find" class="a-find" id="a-id"><span id="span-id" class="span-find">아이디찾기</span></a>
				<a href="findPassword" class="a-find" id="a-pw"><span id="span-pw" class="span-find">비밀번호 재설정</span></a>
			</div>
			
			<h2>휴대전화로 찾기</h2>
			<h4>가입 당시 입력한 휴대전화 번호를 통해 아이디를 찾을 수 있습니다.</h4>
		<form action="findIdResult" method="post" id="frm">
			<div id="input-form">
				<label for="input-name"></label>
				<input type="text" name="mem_name" class="input-name-tel" id="input-name" placeholder="이름" autocomplete="off"  /><br>
				<span class="warn" id="warn-name">이름을 입력하세요.</span>
				<label for="input-tel"></label>
				<input type="tel" name="mem_phone" class="input-name-tel" id="input-tel" placeholder="전화번호 입력(숫자만)" autocomplete="off" /><br>
				<span class="warn" id="warn-tel">휴대전화 번호를 다시 확인해주세요.</span>
				<div id="auth-form">
					<input type="button" id="accept-authNum" value="인증번호 받기" />
					<input type="text" name="" id="chk-authNum" placeholder="인증번호입력" autocomplete="off" style="display: none" />
					<input type="button" id="chk-btn" value="인증번호 확인" style="display: none" />
				</div>
				<input type="hidden" name="" id="doubleChk" value=""  />
				<input type="button" id="submit-btn" value="확인"  /><br>
				<span class="warn" id="warn-btn">휴대전화 번호를 인증하세요.</span>
			</div>
		</form>
			
		</div>
	</div>


	<jsp:include page="../home/footer.jsp" />
	
	<!-- <form id="frm_id" action="findId" method="get">
		<fieldset>
		<legend>아이디 찾기</legend>
		전화번호
			<input type="tel" name="phoneNum1" id="tel1" />
			<br>
		이메일
			<input type="email" name="emailId" id="" />@
			<select name="url" id="">
				<option value="">직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
			</select><br>
			<input type="button" value="아이디찾기" onclick="chkSubmit(this)"/>
		</fieldset>
	</form>
	<form id="frm_pwd" action="findPassword">	
	<input type="hidden" name="" id="phoneDoubleChk" value="false" />
		<fieldset>
		<legend>비밀번호 찾기</legend>
		
			아이디 <input type="text" name="id" id="id" /><br>
			전화번호
			<input type="tel" name="phoneNum2" id="tel2"  />
			<input type="button" value="인증번호받기" id="phoneChk" /><br>
			인증번호
			<input type="text" name="" id="authNum" />
			<input type="button" value="확인" id="authChk" style="display: none;"/><br>
			<input type="button" value="비밀번호찾기" id="chkSubmit2"/>
			</fieldset>
	</form> -->
	
	
</body>
</html>