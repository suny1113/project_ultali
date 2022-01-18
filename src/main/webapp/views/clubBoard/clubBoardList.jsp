<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
<meta charset="UTF-8">
<title>울타리 :: 취미모임의 시작</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/clubBoardList.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${path}/resources/js/clubBoardList.js"></script>
</head>
<body>
	<jsp:include page="../home/header.jsp" />
	<div class="container">
		
		<input type="hidden" name="major_no" id="major_no" value="${major_no}"/>
		
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
				
				<div class="club_list_box">
				<c:forEach var="dto" items="${viewAll}">
					<div class="club">
						<div class="img_area">
							<a href="clubBoardDetail?c_no=${dto.c_no}">
								<img src="${dto.c_image}" alt="soccer_club${dto.c_no}_img" />
							</a>	
						</div>
						<div class="text_area">
							<h2><a href="clubBoardDetail?c_no=${dto.c_no}">${dto.c_name}</a></h2>
							<p>일정 : ${dto.c_date}</p>
							<p>인원 : ${dto.c_count}</p>
							<p>지역 : ${dto.c_loc}</p>
							<p>조회수 ${dto.c_hits}</p>
						</div>
<%-- 					<sec:authorize access="hasRole('ROLE_ADMIN')"> --%>
							<div class="club_list_check">
								<input type="checkbox" id="check" name="check" value="${dto.c_no}"/>
							</div>
<%-- 					</sec:authorize> --%>
					</div>
				</c:forEach> 
				</div>
				
				<div class="club_list_btn">
<%-- 					<sec:authorize access="hasRole('ROLE_ADMIN')"> --%>
						<input type="button" value="모임 삭제" id="btn_del"/>
<%-- 					</sec:authorize> --%>
						<input type="button" value="모임 등록" id="btn_reg"/>
				</div>
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
	
	<div style="display: block; text-align: center;">
        <c:if test="${paging.startPage != 1 }">
            <a href="clubBoardList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&major_no=${list[0].major_no}">&lt;</a>
        </c:if>
        <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
            <c:choose>
                <c:when test="${p == paging.nowPage }">
                    <b>${p }</b>
                </c:when>
                <c:when test="${p != paging.nowPage }">
                    <a href="clubBoardList?nowPage=${p }&cntPerPage=${paging.cntPerPage}&major_no=${list[0].major_no}">${p }</a>
                </c:when>
            </c:choose>
        </c:forEach>
        <c:if test="${paging.endPage != paging.lastPage}">
            <a href="clubBoardList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&major_no=${list[0].major_no}">&gt;</a>
        </c:if>
    </div>
	
	<jsp:include page="../home/footer.jsp" />
</body>
</html>