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
         	<div id="inner-container">
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
               <input type="password" class="check" id="new_pwchk" name="new_pwchk" required"> 
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

			</div>
         </div>
      </div>
   </form>
   <!-- footer -->
   <jsp:include page="../home/footer.jsp" />
</body>
</html>