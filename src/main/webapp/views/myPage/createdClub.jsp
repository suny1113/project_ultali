<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/createdClub.css">
<title>내가 개설한 모임</title>
</head>
<body>
	<jsp:include page="../home/header.jsp"/>
	<menu>
		<div class="item1">
			<h2>내가 개설한 모임</h2>
			<table>
				<tr>
					<td><a href="myInfo">내 정보</a></td>
				</tr>
				<tr>
					<td><a href="#">최근 본 모임</a></td>
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
	<a href="applicantList">신청자 현황 받습니다.</a>
	<jsp:include page="../home/footer.jsp"/>
</body>
</html>