<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" />   
<!DOCTYPE html>
<html>
<head>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/home.css">
<link rel="stylesheet" href="${path}/resources/css/notice.css">

<meta charset="UTF-8">
<title>문의사항 게시글 수정</title>

</head>
<body>
	<!-- header -->
	<jsp:include page="../home/header.jsp" />
	
	<!-- body -->
	<div class="notice-body-container">
		<div class="notice-body-left">
		<h1>고객센터</h1>
			<br><br>
			<a href="notice"><h2>공지사항</h2></a><br>
			<a href="faq"><h2>자주묻는질문</h2></a>
		</div>
		
	<div class="notice-body-right">	
	<table id="noticeDetail-table">
		<tr>
			<th>게시물번호</th>
			<td>${dto.n_no }</td>
			<th>작성자</th>
			<td>${dto.mem_id }</td>
		</tr>
		<tr>
			<th>작성일시</th>
			<td>${dto.n_regdate }</td>
			<th>조회수</th>
			<td>${dto.n_hits }</td>
		</tr>
		
		<tr>
			<th>제목</th>
			<td colspan="3">${dto.n_title }</td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td colspan="3">${dto.n_detail }</td>
		</tr>
		<tr>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<th>기능</th>
			<td colspan="3">
			<!-- modify?bno=517 ==> BoardController.modifyForm() ==> modifyForm.jsp -->
			<button><a href="noticeModify?n_no=${dto.n_no }">수정</a></button>
			
			<!-- delete?bno=517 ==> BoardController.delete(bno) ==> list.jsp -->
			<button><a href="noticeDelete?n_no=${dto.n_no }">삭제</a></button>
			<button><a href="notice">목록</a></button>
			</td>
			</sec:authorize>	
	</table>
	</div>
</div>	
	<!-- footer -->
	<jsp:include page="../home/footer.jsp" />
</body>