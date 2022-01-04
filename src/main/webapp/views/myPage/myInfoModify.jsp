<%@page import="kr.co.jhta.ultali.dto.MyInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/myInfo.css">
</head>
<body>
	<h1>정보 수정하기</h1>
	<div class="container">
		<menu>
			<div class="item1">
				<h2>마이페이지</h2>
				<table>
					<tr>
						<td><a href="#">내 정보</a></td>
					</tr>
					<tr>
						<td><a href="#">최근 본 모임</a></td>
					</tr>
					<tr>
						<td><a href="#">찜한 모임</a></td>
					</tr>
					<tr>
						<td><a href="#">1대1 문의</a></td>
					</tr>
					<tr>
						<td><a href="#">내가 개설한 모임</a></td>
					</tr>
					<tr>
						<td><a href="#">내가 가입한 모임</a></td>
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
					<td><input type="text" name="new_name" id="" placeholder="${myInfoDto.mem_id }"/></td>
				</tr>

				<tr>
					<th>휴대전화번호</th>
					<th>Email</th>
					<th>비밀번호 수정</th>
				</tr>
				<tr>
					<td>${myInfoDto.mem_phone }</td>
					<td>${myInfoDto.mem_email }</td>
					<td>
						<input type="password" name="new_pw" id="" placeholder="새 비밀번호 입력" onkeydown=""/>
						<input type="password" name="new_pw" id="" placeholder="비밀번호 확인" />
					</td>
				</tr>
			</table>
			<div class="button">
				<input type="submit" value="수정하기">
			</div>
		</div>
	</div>
	<!-- jsp:include footer -->
</body>
</html>