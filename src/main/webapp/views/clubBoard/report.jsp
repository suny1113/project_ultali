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
<title>울타리 :: 취미모임의 시작</title>
</head>
<body>
	<form action="doReport" method="post" id="form">
		<div>
<!-- 			값이 없으면 넘어갈때 오류떠서 그냥 값을 0으로줌 -->
			<input type="hidden" name="rep_no" value="0" />
			
<!-- 			로그인한 사용자 아이디받으면됨 -->
			<input type="hidden" name="Mem_id" value="ss" />
			
<!-- 			<input type="hidden" name="c_no" value= /> -->
			<input type="hidden" name="c_no" value="${boardDTO.c_no }" />
			
<!-- 			카테고리인데 아직적용안함 -->
			<input type="hidden" name="rep_reason" id="rep_reason" value="신고사유" />
			<table>
				<tr>
					<h4>신고하기</h4>
				</tr>
				 
				<tr>
					<td><select name="" id="select">
						<option value="신고사유" >신고사유</option>
						<option value="음란성 또는 청소년에게 부적합한 내용">음란성 또는 청소년에게 부적합한 내용</option>
						<option value="욕설">욕설</option>
						<option value="부적절한 홍보 게시글">부적절한 홍보 게시글</option>
						<option value="명예훼손/사생활 침해 및 저작권 침해">명예훼손/사생활 침해 및 저작권 침해</option>				
						<option value="기타" >기타</option>				
					</select></td>
				</tr>
				<tr>
				</tr>
			</table>
			<textarea rows="10" cols="70" name="rep_detail" id="textarea" placeholder="내용을 입력해주세요"></textarea>
		</div>
		<div>
			<input type="button" value="신고하기" id="submit" class="report_button"/>
			<input type="button" value="취소" id="cancel" class="report_button" onClick="window.close()"/>
		</div>
	</form>
	
</body>
</html>