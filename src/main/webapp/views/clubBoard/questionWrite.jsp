<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/report.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${path }/resources/js/report.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="doReport" method="post" id="form">
		<h2>${c_no }</h2>
		<h2>${mem_id}</h2>
		<div>
<!-- 			값이 없으면 넘어갈때 오류떠서 그냥 값을 0으로줌 -->
			<input type="hidden" name="rep_no" value="0" />
			
<!-- 			로그인한 사용자 아이디받으면됨 -->
			<input type="hidden" name="Mem_id" value="ss" />
			
			<input type="hidden" name="c_no" value="1" />
<%-- 			<input type="hidden" name="c_no" value="${boardDTO.c_no }" /> --%>
			
<!-- 			카테고리인데 아직적용안함 -->
			<input type="hidden" name="rep_reason" id="rep_reason" value="신고사유" />
			<table>
				<tr>
					<h3>문의작성</h3>
				</tr>

				<tr>
				</tr>
			</table>
			<textarea rows="10" cols="70" name="rep_detail" id="textarea" placeholder="내용을 입력해주세요"></textarea>
		</div>
		<div>
			<input type="button" value="등록하기" id="submit" class="report_button"/>
			<input type="button" value="취소" id="cancel" class="report_button" onClick="window.close()"/>
		</div>
	</form>
	
</body>
</html>

