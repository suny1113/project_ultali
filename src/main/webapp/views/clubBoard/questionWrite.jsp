<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/questionWrite.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${path }/resources/js/questionWrite.js"></script>
<head>
<meta charset="UTF-8">
<title>울타리 :: 취미모임의 시작</title>
</head>
<body>
	<div>
		<form action="questionWrite" method="post" id="form">

			<div id="borderDiv">
				
				
				
				<table>
					<tr>
						<td><h3 id="h3">문의작성</h3></td>
						<td id="se"><label><input type="checkbox" name="secret" id="secret">비밀글</label></td>
					</tr>
	
					<tr>
					</tr>
				</table>
				<textarea rows="10" cols="70" name="c_inq_detail" id="textarea" placeholder="내용을 입력해주세요"></textarea>
			</div>
			<div>
				<input type="button" value="등록하기" id="submit" class="button"/>
				<input type="button" value="취소하기" id="cancel" class="button"  onClick="window.close()"/>
	
				<input type="hidden" name="c_inq_no" value="0" />
				<input type="hidden" name="c_no" value="${c_no}" />
				<input type="hidden" name="mem_id" />
				<input type="hidden" name="c_inq_regdate" value="0" />
				<input type="hidden" name="c_inq_secretinq" id="c_inq_secretinq" />
			</div>
		</form>
	</div>
</body>
</html>

