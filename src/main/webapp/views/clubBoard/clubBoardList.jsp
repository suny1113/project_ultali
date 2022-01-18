<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/clubBoardList.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${path}/resources/js/clubBoardList.js"></script>
<head>
<meta charset="UTF-8">
<title>울타리 :: 취미모임의 시작</title>
</head>
<body>
	<jsp:include page="../home/header.jsp" />
	<div class="container">
		
		<input type="hidden" name="major_no" id="major_no" value="${major_no}"/>
		<input type="hidden" name="idCheck" id="idCheck" value="${id}"/>
		
		<div class="main_right"> 
			<div class="top_club_list">
				<div class="top_club_title"><h2>인기</h2></div>
				
				<c:forEach var="dto" items="${top_list}">
				<div class="club">
					<div class="img_area">
						<a href="clubBoardDetail?c_no=${dto.c_no}">
							<img src="${path}${dto.c_image}" alt="${dto.c_image}" />
						</a>
					</div>		
					<div class="text_area">
						<h2><a href="clubBoardDetail?c_no=${dto.c_no}">${dto.c_name}</a></h2>
					</div>
				</div>
				</c:forEach> 
			</div>
		
			<div class="club_list">
				<div class="club_title"><h2>일반</h2></div>
				
				<div class="club_sort">
					<a href="clubBoardList?sort=0&major_no=${major_no}">인기순</a>
				</div>
				
				<div class="club_list_box">
				<c:forEach var="dto" items="${viewAll}">
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
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<div class="club_list_check">
								<input type="checkbox" id="check" name="check" value="${dto.c_no}"/>
							</div>
						</sec:authorize>
					</div>
				</c:forEach> 
				</div>
				
				<div class="club_list_btn">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<input type="button" value="모임 삭제" id="btn_del"/>
					</sec:authorize>
						<input type="button" value="모임 등록" id="btn_reg"/>
				</div>
			</div>
		</div>
		
	</div>

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