<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/home.css">
<link rel="stylesheet" href="${path}/resources/css/notice.css">

<meta charset="UTF-8">
<title>공지사항 게시글 작성</title>
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
		
		<div class="noticeWrite-body-right">
		<form action="noticeWrite" method="post">
			<div class="mb-3">
				<label for="title" class="form-label">제목</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="text" size="50" class="form-control" id="title" name="n_title" placeholder="제목">
			</div>
			<br>
			<div class="mb-3">
				<label for="writer" class="form-label">작성자</label> &nbsp;&nbsp; 
				<input type="text" size="50" class="form-control" id="mem_id" name="mem_id" value="${mem_id}" placeholder="작성자ID">
			</div>
			<br>
			<div class="mb-3">
				<label for="contents" class="form-label">내용</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<textarea class="form-control" rows="15" cols="51" id="contents" name="n_detail" row="3"></textarea>
			</div>
			<br><br>
			<div class="noticeWrite-submit">
				<button type="submit" class="">등록</button>
			</div>
		</form>
	</div>
</div>

	<!-- footer -->
	<jsp:include page="../home/footer.jsp" />
</body>
</html>