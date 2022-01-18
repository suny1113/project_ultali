<%@page import="kr.co.jhta.ultali.dto.MyInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/myInfoModify.css">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/myInfoModify.js" ></script>
</head>

<body>
	<jsp:include page="../home/header.jsp" />
	<h1>정보 수정하기</h1>
	
	<form name="join_form" action="modify" method="post">
	<input type="hidden" name="mem_id" value="${myInfoDto.mem_id }" />
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
<!-- 					<th>닉네임</th> -->
                    <th></th>
				</tr>
				<tr>
					<td>${myInfoDto.mem_name }</td>
					<td>${myInfoDto.mem_id }</td>
					<%-- <td>
                        <input type="text" name="mem_name" id="new_nickname" placeholder="${myInfoDto.mem_id }" required oninput="checknickname()"/>
                    </td>
                    <td id="nicknameCheck">
                        <span class="nickname_ok">사용 가능합니다.</span>
                        <span class="nickname_already">사용 불가능합니다.</span>
                    </td> --%>
				</tr>

				<tr>
					<th>휴대전화번호</th>
					<th>Email</th>
					<th>비밀번호 수정</th>
                    <th></th>
				</tr>
				<tr>
					<td>
						<input type="text" name="mem_phone" id="new_phone" placeholder="${myInfoDto.mem_phone }" required/>
					</td>
					<td>${myInfoDto.mem_email }</td>
					<td>
						<input type="password" name="new_pw" id="new_pw" placeholder="새 비밀번호 입력" required/> 
                    </td>
                    <td id="passwordCheck">
                        <span class="pw_ok">일치합니다.</span>
                        <span class="pw_already">일치하지 않습니다.</span>
                    </td>
				</tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td colspan="4">
                        <input type="password" name="mem_pw" id="new_pwchk" placeholder="비밀번호 확인" required />
                    </td>
                </tr>
			</table>
			<div class="button">
				<input type="button" class="btn" value="수정하기" onclick="joinform_check()">
			</div>
		</div>
	</div>
	</form>
	<!-- jsp:include footer -->
	<jsp:include page="../home/footer.jsp" />
</body>
</html>