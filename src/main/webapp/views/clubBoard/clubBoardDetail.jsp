<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/clubBoardDetail.css">
<script src="${path }/resources/js/clubBoardDetail.js"></script>
<head>
<meta charset="UTF-8">
<title>울타리 :: 취미모임의 시작</title>
</head>
<body>
	<input type="hidden" id="idCheck" value="${id}"/>
	<jsp:include page="../home/header.jsp" />	
	<c:choose>
		<c:when test="${empty dto}">
		</c:when>
		<c:otherwise>    
			<div>
				<form action="clubModify" id="form">
				<input type="hidden" name="wish" id="wish" value="${wish }"/>
					<div id=container>
						<div id="main">
							<div  class="area">
								
<%-- 								<img src="${path}${dto.c_image}" alt="" id="board_detail_img"/> --%>
								<img src="${path}${dto.c_image}" alt="" id="board_detail_img"/>
								
								<h3 class="title">${dto.c_name }</h3>	
								<div>		
									<table id="table">
										<tr>
											<th><p class="contents subtitle">모집분야</p></th>
											<c:if test="${dto.major_no == 1}">
												<td><p class="contents detail">아웃도어</p></td>
											</c:if>
		
											<c:if test="${dto.major_no == 2}">
												<td><p class="contents detail">스포츠</p></td>
											</c:if>
		
											<c:if test="${dto.major_no == 3}">
												<td><p class="contents detail">쿠킹</p></td>
											</c:if>
											
											<c:if test="${dto.major_no == 4}">
												<td><p class="contents detail">공예</p></td>
											</c:if>
		
											<c:if test="${dto.major_no == 5}">
												<td><p class="contents detail">피트니스</p></td>
											</c:if>
		
											<c:if test="${dto.major_no == 6}">
												<td><p class="contents detail">자기계발</p></td>
											</c:if>
											
											<c:if test="${dto.major_no == 7}">
												<td><p class="contents detail">기타</p></td>
											</c:if>				
										</tr>
										
										<tr>
											<th><p class="contents subtitle">활동지역</p></th>
											<td><p class="contents detail">${dto.c_loc }</p></td>
										</tr>
										
										<tr>
											<th><p class="contents subtitle">세부장소</p></th>
											<td><p class="contents detail">${dto.c_place }</p></td>
										</tr>
										
										<tr>
											<th><p class="contents subtitle">모임일정</p></th>
											<td><p class="contents detail">${dto.c_date }</p></td>
										</tr>
										
										<tr>
											<th><p class="contents subtitle">비용</p></th>
											<td><p class="contents detail">${dto.c_price }</p></td>
										</tr>
										
										<tr>
											<th ><p class="contents subtitle">모집인원</p></th>
											<td ><p class="contents detail">${dto.c_count }</p></td>
										
										<tr>
										
										</tr>
											<td colspan="2">
												<div id="wish">
													<img src="${path}${wish}" id="heart" alt=""/>
													<input type="button" value="찜하기" class="top_button button" id="addOrDeleteWish_button">
													
													<img src="${path}/resources/img/exclamation mark.png" name="c_image" alt="https://www.flaticon.com/kr/free-icon/exclamation-button_87980?term=%EB%8A%90%EB%82%8C%ED%91%9C&page=1&position=4&page=1&position=4&related_id=87980&origin=search" id="wish_img"/>
													<input type="hidden" name="c_no" value="${dto.c_no }" id="c_no"/>
													<input type="button" value="신고하기" class="top_button button" id="reportButton"/>
												</div>
											<td>
										</tr>
										<tr>
<%-- 											<c:if ${ }></c:if> --%>
											<td colspan="2">
												<!-- 			모임을 만든사람만 사용 할 수 있는 버튼 -->
												<div id="bottom"  >
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div >		

								
<!-- 								<div id="middle"> -->
<!-- 								</div> -->
								
								<div id="apply">
									<input type="button" value="신청하기" class="middle_button button" id="apply_button"/>
									<input type="button" value="문의하기" class="middle_button button" id="inquiry_button"/>
								</div>
								

								
<!-- 								<h3 id="detail_contents">상세 설명</h3> -->
								<div>
									<h4 class="title">상세설명</h4>
								</div>
								<div id="preArea" class="area">
									<div>
										<pre>${dto.c_detail }</pre>
									</div>
								</div>
				<!-- 				 	작성자와 지금 로그인한 회원가 아이디가 같을 경우 수정하기 삭제하기 버튼 추가  			 -->
								<input type="hidden" id = "mem_id" name="mem_id" value="${dto.mem_id}"/>
								<input type="hidden" id = "id" value="${id}"/>
								
								<input type="hidden" name="" id="inquiry_params" value=""/>
								
								<input type="hidden" name="c_name" value="${dto.c_name }"/>
								<input type="hidden" name="c_detail" value="${dto.c_detail }"/>
								<input type="hidden" name="major_no" id="major_no" value="${dto.major_no }"/>
								<input type="hidden" name="c_loc" value="${dto.c_loc }"/>
								<input type="hidden" name="c_place" value="${dto.c_place }"/>
								<input type="hidden" name="c_date" value="${dto.c_date }"/>
								<input type="hidden" name="c_price" value="${dto.c_price }"/>
								<input type="hidden" name="c_count" value="${dto.c_count }"/>
								<input type="hidden" name="c_time" value="${dto.c_time }"/>
								<input type="hidden" name="checkWish" id="checkWish" value="${checkWish }"/>
						</div>
					</div>
				</form>
			</div>
		</c:otherwise>	
	</c:choose>
	<jsp:include page="../home/footer.jsp" />

</body>
</html>