<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/home.css">
<style>
	.logo-container {
		width: 100%;
		height: 150px;
		border-bottom: 1px solid rgb(240,240,240);
		text-align: center;
	}
</style>
<script type="text/javascript">
	function chkSubmit(x){
		console.dir(x)
		console.log(x.form[1].value)
		console.log(x.form[2].value)
		console.log(x.form[3].value)
		
		
		var phone1 = x.form[1].value
		var emailId = x.form[2].value
		var url = x.form[3].value
		
		
		if(phone1 == ''){
			alert("전화번호를 빈칸없이 입력하세요.")
			return
		}else if(emailId == '' || url == ''){
			alert("이메일을 빈칸없이 입력하세요.")
			return
		}
		
		x.form.submit();
	}
	
	// 서버에서 전송받아온 값 저장할 변수
	var code = "";
	
	$(function(){
		// 인증번호 전송
	    $("#phoneChk").click(function(){
	    	var phone = $("#tel2").val()
	        $.ajax({
	        	type : "GET",
	        	url : "getMessage?phoneNum="+phone,
	        	cache : false,
	        	success : function(data){
	        		console.log("data : "+data)
	        		if(data == "error"){
	        			alert("유효하지 않은 전화번호입니다.")
	        		}else{
	        			alert("인증번호가 발송되었습니다.")
	        			$("#tel2").attr("readonly", true)
	        			$("#authChk").show()
	        			
	        			code = data
	        		}
	        	}
	        })
	    })
	    // 인증번호 일치여부 확인
	    $("#authChk").click(function(){
	    	
	    	if($("#authNum").val() == code && $("#authNum").val() != "" ){
	    		alert("인증번호가 일치합니다.")
	    		$("#phoneDoubleChk").val("true")
	    	}else{
	    		alert("인증번호가 일치하지 않습니다.")
	    		$("#phoneDoubleChk").val("false")
	    	}
	    })
	    
	    $("#chkSubmit2").click(function(){
	    	var id = $("#id").val()
	    	if($("#phoneDoubleChk").val() == "true" && id != ""){
	    		location.href = "findPassword?id="+id
	    	}
	    })
	})
	
	
</script>
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
			<div class="logo-container"></div>
		</div>
	</header>


	
	<form id="frm_id" action="findId" method="get">
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
	</form>
</body>
</html>