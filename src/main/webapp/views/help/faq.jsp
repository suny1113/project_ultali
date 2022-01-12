<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<c:set var="path" value="${pageContext.request.contextPath}"/>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="stylesheet" href="${path}/resources/css/faq.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../home/header.jsp" />
	
	<!-- body -->
	<div id="wapper">

		<!-- nav -->
		<nav>
				<a href="notice.jsp">공지사항</a>
				<a href="faq.jsp">자주묻는질문</a>
		</nav>


		<!-- contents -->
		<section>
			<article id="apply">
				<h2>모임 신청은 어떻게 하나요?</h2>
				<h3>상세 정보에서 신청하시면 됩니다.</h3>
			</article>
			<article id="member">
				<h2>회원정보는 어떻게 변경 하나요?</h2>
				<h3>마이페이지 - 내정보에서 변경하시면 됩니다.</h3>
			</article>
			<article id="memberQuit">
				<h2>회원탈퇴는 어떻게 하나요?</h2>
				<h3>마이페이지 - 내정보에서 탈퇴하시면 됩니다.</h3>
			</article>
		</section>

	</div>

	<!-- footer -->
	<jsp:include page="../home/footer.jsp" />
	
</body>
</html>