<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/notice.css">


</head>
<body>
	<!-- header -->
	<jsp:include page="../home/header.jsp" />
	
	<div class="container">
	<table>
		<tr>
			<th>게시물번호</th>
			<td>${dto.n_no }</td>
			<th>작성자</th>
			<td>${dto.mem_id }</td>
		</tr>
		<tr>
			<th>작성일시</th>
			<td>${dto.n_regdate }</td>
			<th>조회수</th>
			<td>${dto.n_hits }</td>
		</tr>
		
		<tr>
			<th>제목</th>
			<td colspan="3">${dto.n_title }</td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td colspan="6">${dto.n_detail }</td>
		</tr>
		<tr>
			<td colspan="4">
			<!-- modify?bno=517 ==> BoardController.modifyForm() ==> modifyForm.jsp -->
			<a href="noticeModify?n_no=${dto.n_no }">수정</a>
			
			<!-- delete?bno=517 ==> BoardController.delete(bno) ==> list.jsp -->
			<a href="noticeDelete?n_no=${dto.n_no }">삭제</a>
			<a href="notice">목록</a>
			</td>
	</table>
	</div>
	
	<!-- footer -->
	<jsp:include page="../home/footer.jsp" />
</body>