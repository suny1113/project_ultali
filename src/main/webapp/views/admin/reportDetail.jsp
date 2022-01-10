<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/adminReport.css">
<link rel="stylesheet" href="${path}/resources/css/adminReportDetail.css">
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
				<h1>신고상세내역</h1>
				<table id="reportDetail-table">
					<tr>
						<th>신고자 아이디</th>
						<td>${dto.mem_id}</td>
					</tr>
					<tr>
						<th>신고모임번호</th>
						<td>${dto.c_no}</td>
					</tr>
					<tr>
						<th>신고사유</th>
						<td>${dto.rep_reason}</td>
					</tr>
					<tr>
						<th>상세내용</th>
						<td>${dto.rep_detail}</td>
					</tr>
					<tr>
						<td colspan="2">
							<a href="moveToDetail?c_no=${dto.c_no}">게시글 보러가기</a><a href="meetingDelete?c_no=${dto.c_no}&rep_no=${dto.rep_no}">게시글 삭제하기</a>
						</td>
					</tr>
				</table>
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
	
</body>
</html>