<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>


<head>

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
			<br>
			<br> <a href="notice"><h2>공지사항</h2></a><br> 
			<a href="faq"><h2>자주묻는질문</h2></a><br>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<a href="noticeWrite"><h2>글쓰기</h2></a>
		</sec:authorize>	
		</div>

		<!-- jstl : 게시물 번호 작성자 제목 작성일시 -->
		<div class="notice-body-right">
			<h1>공지사항</h1>
			<table id="notice-table">
				<tr class="exline">
					<td>번호</td>
					<td width="600">제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>

				<!-- noticeDetail?bno=1 ==> NoticeController.detail (dto) ==> dao.selectOne(517) ==> noticeDetail.jsp -->
				<c:forEach var="ndto" items="${selectList }">

					<tr class="exline">
						<td>${ndto.n_no }</td>
						<td><a href="noticeDetail?n_no=${ndto.n_no }">${ndto.n_title }</a></td>
						<td>${ndto.mem_id }</td>
						<td>${ndto.n_regdate }</td>
						<td>${ndto.n_hits }</td>
					</tr>
				</c:forEach>

				<tr>
					<td colspan="5">
						<ul>
							<c:if test="${map.prev }">
								<li><a href="notice?currentPage=${(map.startPageNo-1)  }">이전</a></li>
							</c:if>
							<c:forEach begin="${map.startPageNo }" end="${map.endPageNo }" var="i">
								<li><a href="notice?currentPage=${i }">${i }</a></li>
							</c:forEach>
							<c:if test="${map.next }">
								<li><a href="notice?currentPage=${map.endPageNo+1 }">다음</a></li>
							</c:if>
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>




	<!-- footer -->
	<jsp:include page="../home/footer.jsp" />
</body>
</html>