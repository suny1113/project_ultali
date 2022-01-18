<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>울타리 :: 우리가 이어지는 공간</title>
<link rel="stylesheet" href="resources/css/home.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script>
	
	function clubRegister(){
		
		var id = "<c:out value='${sessionScope.id}'/>"
		
		if(id == ""){
			alert("로그인이 필요합니다.")
			location.href = "<c:out value='${path}' />"+"/login/login"
		}
		
	}
	
</script>
</head>
<body>
	
	<jsp:include page="header.jsp"/>
	
	<div class="body-container">
		
		<div class="banner">
			<jsp:include page="slide.jsp"/>
		</div>
		
		<section id="section1">
			<div class="category">
				<h1>카테고리</h1>
				
				<div class="category-grid">
					<div class="meeting">
						<a href="clubBoard/clubBoardList?major_no=1&sort=3">
							<img src="resources/img/outdoor.png" alt="" />
							<span>아웃도어</span>
						</a>
					</div>
					
					<div class="meeting">
						<a href="clubBoard/clubBoardList?major_no=5&sort=3">
							<img src="resources/img/fitness.jpg" alt="" />
							<span>피트니스</span>
						</a>
					</div>
					
					<div class="meeting">
						<a href="clubBoard/clubBoardList?major_no=2&sort=3">
	
							<img src="resources/img/sports.png" alt="" />
							<span>스포츠</span>
						</a>
					</div>
					
					<div class="meeting">
						<a href="clubBoard/clubBoardList?major_no=6&sort=3">
							<img src="resources/img/self_improvement.jpg" alt="" />
							<span>자기계발</span>
						</a>
					</div>
					
					<div class="meeting">
						<a href="clubBoard/clubBoardList?major_no=3&sort=3">
							<img src="resources/img/cooking.jpg" alt="" />
							<span>쿠킹</span>
						</a>
					</div>
					
					<div class="meeting">
						<a href="clubBoard/clubBoardList?major_no=4&sort=3">
							<img src="resources/img/craft.jpg" alt="" />
							<span>공예</span>
						</a>
					</div>
					
					<div class="meeting">
						<a href="clubBoard/clubBoardList?major_no=7&sort=3">
							<img src="resources/img/meeting.jpg" alt="" />
							<span>기타</span>
						</a>
					</div>
				</div>
			</div>
		</section>
		
		<section id="section2">
		
			<div class="small-banner">
				<a href="${path}/help/notice"><img src="resources/img/middle_banner.png" alt="" /></a>
			</div>
			
			<div class="recomd">
				<div class="recomd-title">
					<h1>핫</h1><h1>한 모임</h1>
				</div>
				<div class="hits-rank">
				  	<c:forEach var="dto" items="${dto}">
				  	<a href="${path}/clubBoard/clubBoardDetail?c_no=${dto.c_no}">
							<table>
								<tr>
									<th colspan="2">
										<img src="${path}${dto.c_image}" alt="" />
									</th>
								</tr>
								<tr>
									<td colspan="2" >
										<h2>${dto.c_name}</h2>
									</td>
								</tr>
								<tr>
									<td class="th-title">지역</td>
									<td>
										<p>${dto.c_loc}</p>
									</td>
								</tr>
								<tr>
									<td class="th-title">조회수</td>
									<td>
										<p>${dto.c_hits}</p>
									</td>
								</tr>
							</table>
						</a>
					</c:forEach>

				</div>
			</div>
			
			<div class="small-banner">
				<sec:authorize access="isAnonymous()">
					<a href="javascript:clubRegister()"><img src="resources/img/register.png" alt="" /></a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<a href="${path}/clubBoard/clubRegister"><img src="resources/img/register.png" alt="" /></a>
				</sec:authorize>
			</div>
			
		</section>
		
	</div>
	
	<jsp:include page="footer.jsp"/>

</body>
</html>