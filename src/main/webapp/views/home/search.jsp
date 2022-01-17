<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>울타리 :: 우리가 이어지는 공간</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>   
<link rel="stylesheet" href="${path}/resources/css/home.css">
<link rel="stylesheet" href="${path}/resources/css/search.css" />
</head>
<body>
	
	<jsp:include page="header.jsp"/>
	<div class="body-container">
		<h1>검색결과</h1>
		<div class="search-body">
			<c:if test="${empty word || cnt <= 0 }">
				<h2>검색 결과가 없습니다.</h2>
				<h3>다른 단어로 검색해 보세요.</h3>
			</c:if>
			<c:if test="${!empty word}">
				<c:forEach var="dto" items="${dto}">
					<a href="clubBoard/clubBoardDetail?c_no=${dto.c_no}">
						<div class="result">
							<table>
								<colgroup>
									<col />
									<col />
								</colgroup>
								<tr>
									<th colspan="2">
										<img src="${path}${dto.c_image}" alt="" />
									</th>
								</tr>
								<tr>
									<th>모임명</th>
									<td>${dto.c_name}</td>
								</tr>
								<tr>
									<th>지역</th>
									<td>${dto.c_loc}</td>
								</tr>
								<tr>
									<th>모임장소</th>
									<td>${dto.c_place}</td>
								</tr>
								<tr>
									<th>모임기간</th>
									<td>${dto.c_date}</td>
								</tr>
							</table>
						</div>
					</a>
				</c:forEach>
			</c:if>
		</div>
		
	</div>


	<jsp:include page="footer.jsp"/>
	
</body>
</html>