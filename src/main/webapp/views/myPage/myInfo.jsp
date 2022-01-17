<%@page import="kr.co.jhta.ultali.dto.MyInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/myInfo.css">
</head>
<body>
	${showClubList }
	<jsp:include page="../home/header.jsp"/>
	<h1>내정보</h1>
	<div class="container">
		<menu>
			<div class="item1">
				<h2>마이페이지</h2>
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

		<div class="item2">
			<table>
				<tr>
					<th>이름</th>
					<th>아이디</th>
					<th>닉네임</th>
				</tr>
				<tr>
					<td>${myInfoDto.mem_name }</td>
					<td>${myInfoDto.mem_id }</td>
					<td>${myInfoDto.mem_id }</td>
				</tr>

				<tr>
					<th>휴대전화번호</th>
					<th>Email</th>
				</tr>
				<tr>
					<td>${myInfoDto.mem_phone }</td>
					<td>${myInfoDto.mem_email }</td>
				</tr>
			</table>
			<div class="button">
				<div><a href="delete?mem_id=${myInfoDto.mem_id }">회원탈퇴</a></div>
				<div><a href="modify?mem_id=${myInfoDto.mem_id }">수정하기</a></div>
			</div>
		</div>
	</div>
	<jsp:include page="../home/footer.jsp"/>
	<!-- jsp:include footer -->
</body>
</html>