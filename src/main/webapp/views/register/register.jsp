<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/register.js"></script>
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="${path}/resources/css/home.css">
<link rel="stylesheet" href="${path}/resources/css/register.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../home/header.jsp" />
	<form method="post" action="register" id="register" name="register_form" autocomplete="off">
		<div id="wrapper">
			<div id="container">
				<h1>회원가입</h1>
				
				<!-- ID -->
				<div class="id_wrap">
					<label for="mem_id">아이디</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="text" class="check" name="mem_id" id="mem_id" required oninput="idCheck()"> 
					<span id="idError"></span>
				</div>

				<br>

				<!--  이름 -->
				<div class="name_wrap">
					<label for="mem_name">이름</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="text" class="check" name="mem_name" id="mem_name" required>
				</div>

<script type="text/javascript">

//회원가입 유효성검사
//자원을 화면에 로드하게 되면 수행할 동작(==function)
window.onload(function () {
   var register = document.register; // form 데이터를 register 변수에 저장
   
   // 유효성검사할 부분을 class로 부여했기에 check class 태그를 모두 input에 저장 가져옴
   // 이때 input 한 태그당 배열 인덱스로 받는다.
   var input = document.querySelectorAll('.check');

   // 오류 문구 //errorId : span의 id들(각 요소마다 나타낼 오류를 표시하기 위함)
   // error : class list의 하위 span을 모두 불러냄(일괄 처리를 위함 - 반복문)
   var errorId = [ "idError", "pwError", "pwCheckError", "nameError", "phoneNumError", "emailError" ];
   var error = document.querySelectorAll('.list > span');

   
   // 오류문구 초기화 메서드
   // 오류 표시 후, 사용자가 올바르게 수정을 하면 텍스트가 사라지는 모습을 구현
   function innerReset(error){
      for (var i = 0; i < error.length; i++) {
         error[i].innerHTML = "";
      }
   }

   // 초기화 메서드 호출
   innerReset(error);

   // [ ID 입력문자 유효성검사 ] 
   register.mem_id.onkeydown = function(){
      innerReset(error); // 초기화 메서드 호출
      var idLimit = /^[a-zA-Z0-9-_]{5,20}$/; //정규식 5~20자 (a~z, A~Z, 0~9, -, _만 입력가능)
      if (!idLimit.test(input[0].value)) { //입력값과 정규식 범위와 같지 않다면
         // id의 오류 문구삽입
         document.getElementById(errorId[0]).innerHTML = "5~20자의 영문 소대문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";


				<br>

				<!-- 전화번호 -->
				<div class="phone_wrap">
					<label for="phone_name">전화번호</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="text" class="check" id="mem_phone" name="mem_phone" required>

				</div>

				<br>

				<!-- 비밀번호 -->
				<div class="pw_wrap">
					<label for="pw_name">비밀번호</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="password" class="check" id="mem_pw"" name="mem_pw" required> 

				</div>

				<br>

				<!-- 비밀번호 확인 -->
				<div class="pw_check_wrap">
					<label for="pw_check_name">비밀번호 확인</label> &nbsp;&nbsp; 
					<input type="password" class="check" id="new_pwchk" name="mem_pw" required"> 
				</div>
			
				<br>

				<!-- 이메일 -->
				<div class="mail_wrap">
					<label for="mail_name">이메일</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
					<input type="email" class="check" name="mem_email" id="mem_email" required> 
				</div>

				<!-- 가입완료 / 취소 -->
				<div id="btnJoinCancel">
					<input type="button" class="join_button" value="가입완료" onclick="registerform_check()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="button" class="cancel_button" value="취소">
				</div>

   }//window  
      
   
   </script>


			</div>
		</div>
	</form>
	<!-- footer -->
	<jsp:include page="../home/footer.jsp" />
</body>
</html>