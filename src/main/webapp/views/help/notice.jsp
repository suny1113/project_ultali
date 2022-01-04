<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/main.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>

<title>Insert title here</title>

</head>

<body>

	<h3>이전 : ${map.prev }</h3>
	<h3>다음 : ${map.next }</h3>
	<div class="container">
		<h1>notice.jsp</h1>

		<!-- jstl : 게시물 번호 작성자 제목 작성일시 -->
		<table class="table table-striped">

			<tr>
				<td colspan="4"><a href="../home"><img
						src="../resources/img/Pikachu.png" alt="홈으로" /></a> 
						<a href="write" class="btn btn-outline-primary">작성</a></td>
			<tr>
				<th>게시물 번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일시</th>
			</tr>

			<c:forEach var="dto" items="${list }">
				<tr>
					<td>${dto.bno }</td>
					<td>${dto.writer }</td>

					<!-- noticeDetail?bno=1 ==> HelpController.detail (dto) ==> dao.selectOne(517) ==> noticeDetail.jsp -->

					<td><a href="noticeDetail?bno=${dto.bno }">${dto.title }</a></td>
					<td>${dto.regdate }</td>
				</tr>
			</c:forEach>

			<tr>

				<!-- 1부터 40까지 반복해서 JSTL -->
				<td colspan="4">
					<nav aria-label="Page navigation example">
						<ul class="pagination">

							<c:if test="${map.prev}">
								<li class="page-item"><a class="page-link"
									href="list?currentPage=${map.currentPage-5}">Previous</a></li>
							</c:if>

							<c:forEach var="i" begin="${map.startPageNo}"
								end="${map.endPageNo}">
								<li class="page-item"><a class="page-link"
									href="list?currentPage=${i}">${i}</a></li>
							</c:forEach>

							<c:if test="${map.next}">
								<li class="page-item"><a class="page-link"
									href="list?currentPage=${map.currentPage+5}">Next</a></li>
							</c:if>

						</ul>
					</nav>
				</td>
			</tr>

		</table>
	</div>
</body>
</html>