<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/applicationForm.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${path}/resources/js/applicationForm.js"></script>
<head>
<meta charset="UTF-8">
<title>울타리 :: 취미모임의 시작</title>
</head>
<body>
	<jsp:include page="../home/header.jsp" />
	<div class="container">
		<div class="main">
			<div class="title_box"><h2>모임신청</h2></div>
			
			<div class="apply_form">
				<form action="doApply" method="post">
					<input type="hidden" id="mem_id" name="mem_id" value="${id}"/>
					<input type="hidden" id="c_no" name="c_no" value="${c_no}"/>
					
					<div class="name_box">
						<h3>이름</h3>
						<input type="text" id="mem_name" name="mem_name"/>
					</div>
					
					<div class="gender_box">
						<h3>성별</h3>
						<input type="checkbox" id="man" name="gender" class="check" value="남성"/>
						<label for="man"><span></span>남성</label>
						
						<input type="checkbox" id="woman" name="gender" class="check" value="여성"/>
						<label for="woman"><span></span>여성</label>
					</div>
					
					<div class="phone_box">
						<h3>휴대폰 번호</h3>
						<input type="text" id="input_phone" name="mem_phone" class="phone" />
					</div>

					<div class="detail_box">
						<h3>추가 기재 사항</h3>
						<textarea id="detail" name="app_detail"></textarea>
					</div>
				
					<div class="btn_box">
						<input type="button" value="신청하기" id="apply"/>
						<input type="button" value="취소" id="cancel"/>
					</div>
				</form>
			</div>
			
		</div>
	</div>
	<jsp:include page="../home/footer.jsp" />
</body>
</html>