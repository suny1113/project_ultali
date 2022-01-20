<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<c:set var="path" value="${pageContext.request.contextPath}" />	
<%@page import="kr.co.jhta.ultali.dto.NoticeDTO"%>	
<!DOCTYPE html>
<html>
<head>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/home.css">
<link rel="stylesheet" href="${path}/resources/css/notice.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="../home/header.jsp" />
	
	<% NoticeDTO noticeDTO = new NoticeDTO(); %>
		
	<!-- body -->
	<div class="notice-body-container">
		<div class="notice-body-left">
		<h1>고객센터</h1>
			<br><br>
			<a href="notice"><h2>공지사항</h2></a><br>
			<a href="faq"><h2>자주묻는질문</h2></a>
		</div>
		
		<div class="notice-body-right">
		<form action="noticeModify" method="post">
			<div class="mb-3">
				<label for="title" class="form-label">번호</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" size="50" class="form-control" id="n_no" name="n_no" value="${dto.n_no}" placeholder="번호">
			</div>
			<br>
				<div class="mb-3">
				<label for="title" class="form-label">제목</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" size="50" class="form-control" id="n_title" name="n_title" value="${dto.n_title}" placeholder="제목">
			</div>
			<br>
			<div class="mb-3">
				<label for="writer" class="form-label">작성자</label> &nbsp;&nbsp;
				<input type="text" size="50" class="form-control" id="mem_id" name="mem_id" value="${mem_id}" placeholder="작성자ID">
			</div>
			<br>
			<div class="mb-3">
				<label for="title" class="form-label">작성일</label> &nbsp;&nbsp;
				<input type="text" size="50" class="form-control" id="n_regdate" name="n_regdate" value="${dto.n_regdate}" placeholder="작성일">
			</div>
			<br>
			<div class="mb-3">
				<label for="title" class="form-label">조회수</label> &nbsp;&nbsp;
				<input type="text" size="50" class="form-control" id="n_hits" name="n_hits" value="${dto.n_hits}" placeholder="조회수">
			</div>
			<br>
			<div class="mb-3">
				<label for="contents" class="form-label">내용</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<textarea class="form-control" rows="15" cols="51" id="n_detail" name="n_detail" row="3">${dto.n_detail}</textarea>
			</div>
			<br>
			<div class="noticeModify-submit">
				<input type="submit" value="등록" />
			</div>
		</form>
	</div>
</div>

	<!-- footer -->
	<jsp:include page="../home/footer.jsp" />
</body>
</html>