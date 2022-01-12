<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/clubBoardList.css">
<script src="${path}/resources/js/clubBoardList.js"></script>
</head>
<body>
	<jsp:include page="../home/header.jsp" />
	
	<div class="container">
		<div class="main_right"> 
		
			<div class="top_club_list">
			
				<div class="top_club_title"><h2>인기</h2></div>
				
				<div class="club">
					<div class="img_area">
						<a href="clubBoardDetail?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>
					</div>		
					<div class="text_area">
						<h2><a href="clubBoardDetail?c_no=${dto.c_no}">인기 축구 클럽 TEST</a></h2>
					</div>
				</div>
			</div>
		
			<div class="club_list">
			
				<div class="club_title"><h2>일반</h2></div>
				
				<div class="club_sort">
					<a href="clubBoardListSort?sort=0">인기순</a>
					<a href="clubBoardListSort?sort=1">등록일순</a>
				</div>

				<c:forEach var="dto" items="${list}">
					<div class="club">
						<div class="img_area">
							<a href="clubBoardDetail?c_no=${dto.c_no}">
								<img src="${path}${dto.c_image}" alt="soccer_club${dto.c_no}_img" />
							</a>	
						</div>
						<div class="text_area">
							<h2><a href="clubBoardDetail?c_no=${dto.c_no}">${dto.c_name}</a></h2>
							<p>일정 : ${dto.c_date}</p>
							<p>인원 : ${dto.c_count}</p>
							<p>지역 : ${dto.c_loc}</p>
							<p>조회수 ${dto.c_hits}</p>
						</div>
					</div>
				</c:forEach> 
		
			</div>
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
	
	<jsp:include page="../home/footer.jsp" />
</body>
</html>