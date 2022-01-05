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
<style>
	#inquire-table {
		width: 768px;
	}
</style>
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
				<table id="inquire-table">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>문의인</th>
						<th>답변상태</th>
					</tr>
					<c:forEach var="dto" items="${dto}">
						<tr>
						
						</tr>
					</c:forEach>
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