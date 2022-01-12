<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>울타리 :: 취미모임의 시작</title>
<link rel="stylesheet" href="resources/css/home.css">
</head>
<body>
	
	<jsp:include page="header.jsp"/>
	
	<div class="body-container">
		
		<div class="category">
			<h1>카테고리</h1>
			
			<div class="category-grid">
				<div class="meeting">
					<a href="clubBoard/clubBoardList&major_no=1">
						<img src="resources/img/outdoor.png" alt="" />
						<span>아웃도어</span>
					</a>
				</div>
				
				<div class="meeting">
					<a href="clubBoard/clubBoardList&major_no=5">
						<img src="resources/img/fitness.jpg" alt="" />
						<span>피트니스</span>
					</a>
				</div>
				
				<div class="meeting">
					<a href="clubBoard/clubBoardList?major_no=2">
						<img src="resources/img/sports.png" alt="" />
						<span>스포츠</span>
					</a>
				</div>
				
				<div class="meeting">
					<a href="clubBoard/clubBoardList&major_no=6">
						<img src="resources/img/self_improvement.jpg" alt="" />
						<span>자기계발</span>
					</a>
				</div>
				
				<div class="meeting">
					<a href="clubBoard/clubBoardList&major_no=3">
						<img src="resources/img/cooking.jpg" alt="" />
						<span>쿠킹</span>
					</a>
				</div>
				
				<div class="meeting">
					<a href="clubBoard/clubBoardList&major_no=4">
						<img src="resources/img/craft.jpg" alt="" />
						<span>공예</span>
					</a>
				</div>
				
				<div class="meeting">
					<a href="clubBoard/clubBoardList&major_no=7">
						<img src="resources/img/meeting.jpg" alt="" />
						<span>기타</span>
					</a>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"/>

</body>
</html>