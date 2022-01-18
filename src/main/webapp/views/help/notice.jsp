<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>


<head>
<link rel="stylesheet" href="${path}/resources/css/home.css">
<link rel="stylesheet" href="${path}/resources/css/notice.css">

<title>고객센터</title>

</head>


<body>

	<!-- header -->
	<jsp:include page="../home/header.jsp" />
	
	<!-- body -->
	<div class="notice-body-container">
		<div class="notice-body-left">
		<h1>고객센터</h1>
			<br><br>
			<a href="notice"><h2>공지사항</h2></a><br>
			<a href="faq"><h2>자주묻는질문</h2></a><br>
			<a href="noticeWrite"><h2>글쓰기</h2></a>
		</div>
		
		<!-- jstl : 게시물 번호 작성자 제목 작성일시 -->
		<div class="notice-body-right">
				<h1>공지사항</h1>
				<table id="notice-table">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>

					<!-- noticeDetail?bno=1 ==> NoticeController.detail (dto) ==> dao.selectOne(517) ==> noticeDetail.jsp -->
					<c:forEach var="ndto" items="${selectList }">

						<tr>
							<td>${ndto.n_no }</td>
							<td><a href="noticeDetail?n_no=${ndto.n_no }">${ndto.n_title }</a></td>
							<td>${ndto.mem_id }</td>
							<td>${ndto.n_regdate }</td>
							<td>${ndto.n_hits }</td>
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
						</td>
					</tr>
				</table>
				<br><br><br>
				<h3>이전 : ${map.prev }</h3>
				<h3>다음 : ${map.next }</h3>	
		</div>
				
	</div>




	<!-- footer -->
	<jsp:include page="../home/footer.jsp" />
</body>
</html>