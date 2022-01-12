<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>   
<link rel="stylesheet" href="${path}/resources/css/home.css">
<style>
	body {
		overflow-y: scroll;
	}
	
	h1 {
		margin: 30px 30px 15px 30px;
		font-size: 20px;
	}
	
	h2 {
		text-align: center;
		font-size: 50px;
		padding: 50px 0px 30px 0px;
	}
	
	h3 {
		text-align: center;
		margin-bottom: 80px;
	}
	
	.search-body {
		width: 768px;
		margin: 0 auto;
		position: relative;
		top: 50px;
	}
	
	.result {
		text-align: center;
	}
	
	.result img {
		
	}
	
	
</style>
</head>
<body>
	
	<jsp:include page="header.jsp"/>

	
	<div class="body-container">
		<h1>검색결과</h1>
		<div class="search-body">
			<c:if test="${empty word}">
				<h2>검색 결과가 없습니다.</h2>
				<h3>다른 단어로 검색해 보세요.</h3>
			</c:if>
			<div class="result">
				<table>
					<tr>
						<th colspan="2">
							<img src="resources/img/logo.png" alt="" />
						</th>
					</tr>
					<tr>
						<th>모임명</th>
						<td>북한산 등산 같이 가실 분</td>
					</tr>
					<tr>
						<th>모임장</th>
						<td>parkss0314</td>
					</tr>
					<tr>
						<th>지역</th>
						<td>서울</td>
					</tr>
					<tr>
						<th>모임장소</th>
						<td>북한산</td>
					</tr>
					<tr>
						<th>모임기간</th>
						<td>2022-01-11/2022-01-14</td>
					</tr>
				</table>
			</div>
		</div>
		
	</div>


	<jsp:include page="footer.jsp"/>

</body>
</html>