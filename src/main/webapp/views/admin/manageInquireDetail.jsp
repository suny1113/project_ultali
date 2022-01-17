<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>울타리 :: 1:1 문의</title>
<link rel="stylesheet" href="${path}/resources/css/adminReport.css">
<link rel="stylesheet" href="${path}/resources/css/manageInquireDetail.css">
</head>
<body>

<!-- 	<!-- 멤버 아이디가 admin일 경우 정상 출력 -->
<%-- 	<c:if test="${ mem_id eq 'admin' }"> --%>
	
		<jsp:include page="../home/header.jsp" />

		<div class="report-body-container">
			<div class="report-body-left">
				<a href="reportList"><h1>신고내역</h1></a>
				<a href="Inquire"><h1>1:1 문의 관리</h1></a>
			</div>
			<div class="report-body-right">
				<h1>1:1 문의 관리</h1>
				
				<form action="answerInquire" method="post">
					
					<input type="hidden" name="p_inq_no" value="${dto.p_inq_no}" />
				
					<table id="inquire-detail-table">
					
						<tr>
							<td>제목</td>
							<td>${dto.p_inq_title}</td>
						</tr>
						<tr>
							<td>문의인</td>
							<td>${dto.mem_id}</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td>${dto.regdate}</td>
						</tr>
						
					</table>
					
					<div class="textfield">
						<span class="inform">[내용 클릭 시 글 상세보기]</span>
						<textarea name="inquire-detail" id="inquire-detail" cols="102" readonly="readonly">${dto.p_inq_detail}</textarea>
						<textarea name="inquire-detail-event" id="inquire-detail-event" cols="90" disabled="disabled"></textarea>
						<br />
						<c:if test="${dto.p_inq_answer != null }">
							<span class="inform">[작성한 답글]</span>
							<br />
							<textarea name="inquire-answer" id="inquire-answer" cols="102" readonly="readonly">${dto.p_inq_answer}</textarea>
							<textarea name="inquire-answer-event" id="inquire-answer-event" cols="90" readonly="readonly" disabled="disabled"></textarea>
						</c:if>
						<br />
						<span class="inform">[답글 작성 및 수정]</span>
						<br />
						<textarea name="p_inq_answer" id="inquire-answer-write" cols="102"></textarea>
						<textarea name="inquire-answer-write-event" id="inquire-answer-write-event" cols="90" disabled="disabled"></textarea>
				
						<div class="textfield-button">
							<input type="submit" value="답글작성" class="button" />
							<a href="Inquire" class="button">목록</a>
						</div>
				
					</div>
				</form>
				
			</div>
		</div>

		<jsp:include page="../home/footer.jsp" />
		
<%-- 	</c:if> --%>
	
	
	
<!-- 	<!-- 이외, 홈으로 -->
<%-- 	<c:if test="${ mem_id ne 'admin' }"> --%>
	
<%-- 		<jsp:include page="../home/header.jsp" /> --%>
		
<!-- 		<div class="body-container"> -->
<!-- 			<div class="error"> -->
<!-- 				<h1>잘못된 경로입니다.</h1> -->
<!-- 				<a href="home">홈</a> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
<%-- 		<jsp:include page="../home/footer.jsp" /> --%>
		
<%-- 	</c:if> --%>

<script src="${path}/resources/js/manageInquire.js"></script>
</body>
</html>