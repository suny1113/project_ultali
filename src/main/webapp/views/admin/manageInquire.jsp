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
<link rel="stylesheet" href="${path}/resources/css/manageInquire.css">
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
						<th>작성일</th>
						<th>답변상태</th>
					</tr>
					<!--  전체항목 불러오기 -->
					<c:forEach var="dto" items="${viewAll}">
						<tr>
							<td>${dto.p_inq_no}</td>
							<td><a href="manageInquireDetail?p_inq_no=${dto.p_inq_no}">${dto.p_inq_title}</a></td>
							<td>${dto.mem_id}</td>
							<td>${dto.regdate}</td>
							<c:if test="${dto.p_inq_status == 1}">
								<td>답변완료</td>
							</c:if>
							<c:if test="${dto.p_inq_status == 0}">
								<td>답변확인</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
				
				<div class="paging-div">
					<table class="paging-num">
						<tr>
							<td>
								<c:if test="${paging.startPage != 1 }">
										<a href="Inquire?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
								</c:if>
							</td>
							<td>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
												<b class="num">${p }</b>
										</c:when>
										<c:when test="${p != paging.nowPage }">
												<a href="Inquire?nowPage=${p }&cntPerPage=${paging.cntPerPage}" class="num">${p }</a>
										</c:when>
									</c:choose>
								</c:forEach>
							</td>
							<td>
								<c:if test="${paging.endPage != paging.lastPage}">
									<a href="Inquire?nowPage=${paging.endPage + 1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
					
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