<%@page import="kr.co.jhta.ultali.dto.MyInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/myInfo.css">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<script>
    function checknickname(){
        var nickname = $(new_name).val();
        console.log(nickname);
        $.ajax({
            url:'myPage/nicknameCheck', // Controller 에서 인식할 주소
            type:'post', // POST 방식으로 전달
            data:{new_nickname:new_nickname},
            success:function(){
            	console.log("처리 성공 시 변경되는 내용");
            },
            error:function(){
            	alert("에러입니다.");
            }
        });
    };
    function checkphone(){

    }

    function checkpassword(){

    }
</script>
<body>
	<jsp:include page="../home/header.jsp" />
	<h1>정보 수정하기</h1>
	<div class="container">
		<menu>
			<div class="item1">
				<h2>마이페이지</h2>
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

		<div class="item2">
			<table>
				<tr>
					<th>이름</th>
					<th>아이디</th>
					<th>닉네임</th>
                    <th>""</th>
				</tr>
				<tr>
					<td>${myInfoDto.mem_name }</td>
					<td>${myInfoDto.mem_id }</td>
					<td>
                        <input type="text" name="new_nickname" id="new_nickname" placeholder="${myInfoDto.mem_id }" required oninput="checknickname()"/>
                    </td>
                    <td id="nicknameCheck">
                        <span class="id_ok">사용 가능합니다.</span>
                        <span class="id_already">사용 불가능합니다.</span>

                    </td>
				</tr>

				<tr>
					<th>휴대전화번호</th>
					<th>Email</th>
					<th>비밀번호 수정</th>
                    <th></th>
				</tr>
				<tr>
					<td><input type="text" name="new_pw" id="" placeholder="${myInfoDto.mem_phone }0101"required oninput="checkphone()"/></td>
					<td>${myInfoDto.mem_email }</td>
					<td>
						<input type="password" name="new_pw" id="" placeholder="새 비밀번호 입력" required /> 
                    </td>
                    <td id="passwordCheck">
                        <span class="id_ok">사용 가능합니다.</span>
                        <span class="id_already">사용 불가능합니다.</span>
                    </td>
				</tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td colspan="4">
                        <input type="password" name="new_pw" id="" placeholder="비밀번호 확인" required oninput="checkpassword()" />
                    </td>
                </tr>
			</table>
			<div class="button">
				<input type="submit" value="수정하기">
			</div>
		</div>
	</div>
	<!-- jsp:include footer -->
	<jsp:include page="../home/footer.jsp" />
</body>
</html>