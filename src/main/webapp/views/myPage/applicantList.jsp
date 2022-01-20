<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/applicantList.css">

<title>신청자현황</title>
</head>
<body>
	<jsp:include page="../home/header.jsp" />
	<h1>신청자 현황</h1>
	<form action="approveApp" method="post">
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
		<div class="a">
			<div class="tablecontainer">
				<c:forEach var="appdto" items="${showAppList }">
					<div class="item2">
						<table class="first">
							<tr>
								<th>모임 이름</th>
							</tr>
							<tr>
								<td>${appdto.c_name }</td>
							</tr>
							<tr>
								<th>이름</th>
								<th>성별</th>
								<th>전화번호</th>
							</tr>

							<tr>
								<td>${appdto.mem_name }</td>
								<td>${appdto.gender }</td>
								<td>${appdto.mem_phone }</td>

							</tr>
							<tr>
								<td colspan="3"><textarea name="introduce" id="" cols="40"
										rows="6">${appdto.app_detail }</textarea></td>
							</tr>
							<tr>
								<td colspan="3">
								<input type="hidden" name="my_no" value="${appdto.app_no}" />
								<input type="hidden" name="mem_id" value="${appdto.mem_id}" />
								<input type="hidden" name="c_no" value="${appdto.c_no}" />
								<input type="submit" value="승인" class="btn" />
							</tr>
						</table>
					</div>
				</c:forEach>

				<div class="paging">
					<ul>
						<c:if test="${map.prev }">
							<li><a
								href="applicantList?c_no=${c_no}&currentPage=${(map.startPageNo-1)  }">이전</a></li>
						</c:if>
						<c:forEach begin="${map.startPageNo }" end="${map.endPageNo }"
							var="i">
							<li><a href="applicantList?c_no=${c_no}&currentPage=${i }">${i }</a></li>
						</c:forEach>
						<c:if test="${map.next }">
							<li><a href="applicantList?c_no=${c_no}&currentPage=${map.endPageNo+1 }">다음</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</form>
	<jsp:include page="../home/footer.jsp" />

</body>
</html>