<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/wishList.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../home/header.jsp" />
	<div class="container">
		<menu>
			<div class="item1">
				<h2>최근 본 모임</h2>
				<table>
					<tr>
						<td><a href="myInfo">내 정보</a></td>
					</tr>
					<tr>
						<td><a href="recentClub">최근 본 모임</a></td>
					</tr>
					<tr>
						<td><a href="wishList">찜한 모임</a></td>
					</tr>
					<tr>
						<td><a href="inquire">1대1 문의</a></td>
					</tr>
					<tr>
						<td><a href="createdClub">내가 개설한 모임</a></td>
					</tr>
					<tr>
						<td><a href="myClubList">내가 가입한 모임</a></td>
					</tr>
				</table>
			</div>
		</menu>
		<div class="container2">
			<c:forEach var="dto" items="${showClubList }">
				<div class="top_club">
					<div class="club">
						<div class="img">
							<a href="${path }/clubBoard/clubBoardDetail?c_no=${dto.c_no}"> <img
								src="${path }${dto.c_image }" alt="${path }${dto.c_image }" />
							</a>
						</div>
						<div class="text">
							<h2>
								<a href="${path }/clubBoard/clubBoardDetail?c_no=${dto.c_no}">${dto.c_name }</a>
							</h2>
							<p>일정 : ${dto.c_date }</p>
							<p>인원 : ${dto.c_count }</p>
							<p>지역 : ${dto.c_loc} / ${dto.c_place }</p>
							<p>조회수: ${dto.c_hits }</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="../home/footer.jsp" />
</body>
</html>