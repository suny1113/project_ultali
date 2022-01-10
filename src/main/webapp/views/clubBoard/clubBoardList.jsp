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
	<div class="container">
		
		<div class="header"> <h1>header</h1> </div>
		
		<div class="main_left">  <h1>left</h1> </div>
		
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
						<h2><a href="clubBoardDetail?c_no=${dto.c_no}">인기 축구 클럽 회원모집</a></h2>
					</div>
				</div>
				<div class="club">
					<div class="img_area">
						<a href="clubBoardDetail?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>
					</div>		
					<div class="text_area">
						<h2><a href="clubBoardDetail?c_no=${dto.c_no}">인기 축구 클럽 회원모집</a></h2>
					</div>
				</div>
				<div class="club">
					<div class="img_area">
						<a href="clubBoardDetail?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>
					</div>		
					<div class="text_area">
						<h2><a href="clubBoardDetail?c_no=${dto.c_no}">인기 축구 클럽 회원모집</a></h2>
					</div>
				</div>
			</div>
		
			<div class="club_list">
				<div class="club_title"><h2>일반</h2></div>
				
				<div class="club_sort">
					<a href="">인기순</a>
					<a href="">등록일순</a>
				</div>

<%-- 		<c:forEach var="dto" items="${soccer_club_list}"> --%>
				<div class="club">
					<div class="img_area">
						<a href="clubBoardDetail?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>	
					</div>
					<div class="text_area">
						<h2><a href="clubBoardDetail?c_no=${dto.c_no}">서울 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 10</p>
					</div>
				</div>
<%-- 		</c:forEach>  --%>
		
		
				<div class="club">
					<div class="img_area">
						<a href="clubBoardDetail?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>	
					</div>
					<div class="text_area">
						<h2><a href="clubBoardDetail?c_no=${dto.c_no}">서울 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 10</p>
					</div>
				</div>
				<div class="club">
					<div class="img_area">
						<a href="clubBoardDetail?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>	
					</div>
					<div class="text_area">
						<h2><a href="clubBoardDetail?c_no=${dto.c_no}">서울 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 10</p>
					</div>
				</div>
				<div class="club">
					<div class="img_area">
						<a href="clubBoardDetail?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>	
					</div>
					<div class="text_area">
						<h2><a href="clubBoardDetail?c_no=${dto.c_no}">서울 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 10</p>
					</div>
				</div>
				<div class="club">
					<div class="img_area">
						<a href="clubBoardDetail?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>	
					</div>
					<div class="text_area">
						<h2><a href="clubBoardDetail?c_no=${dto.c_no}">서울 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 10</p>
					</div>
				</div>
				<div class="club">
					<div class="img_area">
						<a href="clubBoardDetail?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>	
					</div>
					<div class="text_area">
						<h2><a href="clubBoardDetail?c_no=${dto.c_no}">서울 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 10</p>
					</div>
				</div>
				<div class="club">
					<div class="img_area">
						<a href="clubBoardDetail?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>	
					</div>
					<div class="text_area">
						<h2><a href="clubBoardDetail?c_no=${dto.c_no}">서울 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 10</p>
					</div>
				</div>
				<div class="club">
					<div class="img_area">
						<a href="clubBoardDetail?c_no=${dto.c_no}">
							<img src="${path}/resources/img/soccer1.jpg" alt="soccer_club1_img" />
						</a>	
					</div>
					<div class="text_area">
						<h2><a href="clubBoardDetail?c_no=${dto.c_no}">서울 축구 클럽 회원모집</a></h2>
						<p>일정 : 21.12.10 ~ 21.12.30</p>
						<p>인원 : 5명</p>
						<p>지역 : 서울</p>
						<p>조회수 10</p>
					</div>
				</div>
			
			</div>
			
		</div>
		
		<div class="footer"> <h1>footer</h1> </div>
		
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