<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/clubBoardList.css">
<!-- <script src="resources/js/game_space.js"></script> -->
</head>
<body>
	<div class="container">
	
		<div class="top_club_list">
			<ul>
				<li class="club">
					<div class="img">
						<a href="clubBoard?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>
					</div>
					<div class="text">
						<h2><a href="clubBoard?c_no=${dto.c_no}">인기 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 1000</p>
					</div>
				</li>
			</ul>
		</div>
	
		<div class="club_list">
			<ul>
		<%-- <c:forEach var="dto" items="${soccer_club_list}"> --%>
				<li class="club">
					<div class="img">
						<a href="clubBoard?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>
					</div>
					<div class="text">
						<h2><a href="clubBoard?c_no=${dto.c_no}">서울 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 10</p>
					</div>
				</li>
		<%-- </c:forEach>  --%>
		
				<li class="club">
					<div class="img">
						<a href="clubBoard?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>
					</div>
					<div class="text">
						<h2><a href="clubBoard?c_no=${dto.c_no}">인천 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 10</p>
					</div>
				</li>
				
				<li class="club">
					<div class="img">
						<a href="clubBoard?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>
					</div>
					<div class="text">
						<h2><a href="clubBoard?c_no=${dto.c_no}">경기 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 10</p>
					</div>
				</li>
				
				<li class="club">
					<div class="img">
						<a href="clubBoard?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>
					</div>
					<div class="text">
						<h2><a href="clubBoard?c_no=${dto.c_no}">대구 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 10</p>
					</div>
				</li>
				
				<li class="club">
					<div class="img">
						<a href="clubBoard?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>
					</div>
					<div class="text">
						<h2><a href="clubBoard?c_no=${dto.c_no}">부산 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 10</p>
					</div>
				</li>
				
				<li class="club">
					<div class="img">
						<a href="clubBoard?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>
					</div>
					<div class="text">
						<h2><a href="clubBoard?c_no=${dto.c_no}">양평 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 10</p>
					</div>
				</li>
				
				<li class="club">
					<div class="img">
						<a href="clubBoard?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>
					</div>
					<div class="text">
						<h2><a href="clubBoard?c_no=${dto.c_no}">속초 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 10</p>
					</div>
				</li>
				
				<li class="club">
					<div class="img">
						<a href="clubBoard?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>
					</div>
					<div class="text">
						<h2><a href="clubBoard?c_no=${dto.c_no}">창원 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 10</p>
					</div>
				</li>
			</ul>
		</div>
		
	</div>

	<c:forEach var="dto" items="${clubList }">
		<table>
			<tr>
				<th>c_no</th>
				<th>major_no</th>
				<th>sub_no</th>
				<th>mem_id</th>
				<th>c_name</th>
				<th>c_loc</th>
				<th>c_place</th>
				<th>c_date</th>
				<th>c_time</th>
				<th>c_price</th>
				<th>c_count</th>
				<th>c_image</th>
				<th>c_detail</th>
				<th>c_hits</th>
			</tr>
			<tr>
				<td>${dto.c_no }</td>
				<td>${dto.major_no }</td>
				<td>${dto.sub_no }</td>
				<td>${dto.mem_id }</td>
				<td>${dto.c_name }</td>
				<td>${dto.c_loc }</td>
				<td>${dto.c_place }</td>
				<td>${dto.c_date }</td>
				<td>${dto.c_time }</td>
				<td>${dto.c_price }</td>
				<td>${dto.c_count }</td>
				<td><a href="clubBoardDetail?c_no=${dto.c_no }">${dto.c_image }</a></td>
				<td>${dto.c_detail }</td>
				<td>${dto.c_hits }</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>