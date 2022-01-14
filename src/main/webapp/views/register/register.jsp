<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">



<script type="text/javascript">

//회원가입 유효성검사
//자원을 화면에 로드하게 되면 수행할 동작(==function)
window.onload = function() {
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

      }
   }
   // [ PW 입력문자 유효성검사 ]
   register.mem_pw.onkeydown = function(){
      innerReset(error); // 초기화 메서드 호출
      var pwLimit = /^[a-zA-Z0-9~!@#$%^&*()_-]{10,20}$/; //정규식(a~z, A~Z, 0~9, ~!@#$%^&*()_- 만 입력가능)
      if (!pwLimit.test(input[1].value)) { //입력값과 정규식 범위와 같지 않다면
         // pw의 오류 문구삽입
         document.getElementById(errorId[1]).innerHTML = " 10~20자의 영문 소대문자, 숫자와 특수기호 '~!@#$%^&*()_-'만 사용 가능합니다.";
      }   
   }
   // [ PW 재확인 입력문자 초기화 ]
   //비밀번호 동일여부는 submit 버튼 클릭시 검사해줄 예정
   register.mem_pwCheck.onkeydown = function(){
      // pw의 오류 문구삽입
      innerReset(error);// 오류문구 초기화   
   }
   // [ 휴대폰번호 입력문자 유효성검사 ]
      register.mem_phone.onkeydown = function(){ //입력값과 정규식 범위와 같지 않다면
      innerReset(error); // 초기화 메서드 호출   
         var pnumLimit =  /^01[0|1|6|7|8|9]{1}[0-9]{8}$/; // 정규식(^$--> 문자의미, 01, (6자리중 "1자리"), 0~9--> "8자리")
         if (!pnumLimit.test(input[4].value)) { //입력값과 정규식 범위와 같지 않다면
            // pw의 오류 문구삽입 
            document.getElementById(errorId[4]).innerHTML = " 올바른 형식이 아닙니다. 다시 확인해주세요.";
         }
      }
      
      // [ 이메일 입력 유효성검사 ] 
      register.mem_email.onkeydown = function(){ //입력값과 정규식 범위와 같지 않다면
         innerReset(error); // 초기화 메서드 호출
         var emailLimit = /[0-9a-zA-Z-_.]/; // 정규식 0~9, a~z, A~Z, -, _, .내에서만 입력가능
            if (!emailLimit.test(input[5].value)) {  //입력값과 정규식 범위와 같지 않다면
               // 이메일의 오류 문구삽입
               document.getElementById(errorId[5]).innerHTML = " 올바른 형식이 아닙니다. 영문,숫자, (-)(_)(.) 입력만 가능합니다.";
            }
         }
      

      
      
      
      
      
    //submit 실행시 수행할 동작
      register.onsubmit = function checkRegister(){ // register에서 submit이 실행된다면 수행 할 함수
         var errorStr = [ " 아이디를", " 비밀번호를", " 비밀번호 확인을", " 성함을", " 휴대폰번호를", " 이메일을" ];
         
      	 innerReset(error); // 오류문구 초기화
         
      	 // [ input 공백확인 ]
      	 for (var i = 0; i < input.length - 1; i++) { // -1 == submit 제외
      		if (!input[i].value) {
      			document.getElemendById(errorId[i]).innerHTML = errorStr[i]+ "입력해 주세요.";
      			input[i].focus(); // 포커스 이동
      			return false; // 종료 (포커스 이동유지를 위해 false 종료)
      		}	 
      	 }   
         
         //유효성검사) 비밀번호 재확인
         if (register.mem_pwCheck.value != join.pwCheck.value) {
            document.getElementById("pwCheckError").innerHTML = " 비밀번호가 일치하지 않습니다.";
            register.mem_pwCheck.focus(); // 포커스 이동
            return false;
         }

         // 정규식 변수 모음     
         var idLimit = /^[a-zA-Z0-9-_]{5,20}$/; //정규식(a~z, A~Z, 0~9, -, _만 입력가능)
         var pwLimit = /^[a-zA-Z0-9~!@#$%^&*()_-]{10,20}$/;///[a-zA-Z0-9]{10, 20}/; //정규식(a~z, A~Z, 0~9,~!@#$%^&*()_-특수문자 만 입력가능)
         var pnumLimit =  /^01[0|1|6|7|8|9]{1}[0-9]{8}$/; // 01로 시작, 0,1,6,7,8,9 중 한자리, 0~9에서 8자리 입력
         var emailLimit = /[0-9a-zA-Z-_.]/; // 정규식 0~9, a~z, A~Z, -, _, .내에서만 입력가능

         // [ ID 유효성검사 ]
         if (!idLimit.test(input[0].value)) {
            document.getElementById(errorId[0]).innerHTML = " 5~20자의 영문 소대문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
            register.mem_id.focus(); // 포커스 이동
            return false;
         }

         // [ PW 유효성검사 ]
         if (!pwLimit.test(input[1].value)) {
            document.getElementById(errorId[1]).innerHTML = " 10~20자의 영문 소대문자, 숫자와 특수기호 '~!@#$%^&*()_-'만 사용 가능합니다.";
            console.log(input[1].value);
            //console.log(pwLimit.test(input[1].value));
            register.mem_pw.focus(); // 포커스 이동
            return false;
         }         

        // [ 휴대폰번호 유효성검사 ]
         if (!pnumLimit.test(input[4].value)) { 
            document.getElementById(errorId[4]).innerHTML = " 올바른 형식이 아닙니다. 다시 확인해주세요.";
            register.mem_phone.focus(); // 포커스 이동
            return false;
         }

        // [ email 아이디 유효성검사 ]
         if (!emailLimit.test(input[5].value)) { 
            document.getElementById(errorId[5]).innerHTML = " 올바른 형식이 아닙니다. 영문,숫자, (-)(_)(.) 외 입력은 불가합니다.";
            register.mem_email.focus(); // 포커스 이동
            return false;
         }

        // [ email 주소선택 유효성검사 ]
         if (document.getElementById("mail_Select").value=="이메일 선택") { 
            document.getElementById(errorId[5]).innerHTML = " 이메일을 선택해주세요.";
            return false;
         }
         //console.log(document.getElementById("mail_Select").value);
         
         alert("회원가입이 완료되었습니다. 울타리의 회원이 되신 것을 환영합니다!");

      }//join.onsublit

   }//window  
      
      
</script>

<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/home.css">
<link rel="stylesheet" href="${path}/resources/css/register.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../home/header.jsp" />

	<div id="wrapper">
	<div id="container">
		<form method="post" id="register" name="register">
		
			
			<h1>회원가입</h1>
			
			<br>
			
			<!-- ID -->
			<div class="id_wrap">
				<label for="mem_id">아이디</label> 
				<span class="box int_id">
				<input type="text" class="int check" name="mem_id" id="mem_id" maxlength="20" required>
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
				<input type="submit" class="join_button" value="가입완료"> 
				<input type="submit" class="cancel_button" value="취소">
			</div>	
			
		</form>
	</div>
	</div>

	<!-- footer -->
	<jsp:include page="../home/footer.jsp" />
</body>
</html>