<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/inquireWrite.css">
<title>문의 작성하기</title>
</head>
<body>
	<jsp:include page="../home/header.jsp" />
	<h1>1대1 문의</h1>
	<form action="inquireWrite" method="post">
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
			<div>
				<div class="info">제목</div>
				<input type="text" name="p_inq_title" id="" placeholder="제목">
			</div>
			<div>
				<div class="info">작성자</div>
				<input type="text" name="mem_id" id="" value="${mem_id }" readonly="readonly">
			</div>

			<div class="contentsbox">
				<textarea name="p_inq_detail" id="" cols="60" rows="10" placeholder="내용을 입력해주세요" required="required"></textarea>
			</div>
			<div class="button">
				<input type="submit" value="글쓰기"> 
				<a href="inquire" class="btn">취소</a>
			</div>
		</div>
	</div>
	</form>
	<!-- jsp:include footer -->
	<jsp:include page="../home/footer.jsp" />
</body>
</html>