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
<title>Insert title here</title>
</head>
<body>
	<form action="clubModify" id="form">
	
		<div id="main">
			<img src="${path}${dto.c_image}" alt="" id="board_detail_img"/>
			
			<div id="detail_description">
				<h3 style="text-align:center;">상세설명</h3>
			</div>
			
			<div id="board_detail_description">
			
				<table>
					<tr>
						<td class="text_padding_interval">모임명: ${dto.c_name }</td>
					</tr>
					
					<tr>
						<td class="text_padding_interval">상세설명: ${dto.c_detail }</td>
					</tr>
				</table>
				
			</div>
				
			<div id="board_detail_list">
				<table>
					<h3>게시글 제목</h3>
					<tr>
						<td class="text_padding_interval">모집분야</td>
						
	<!-- 						데이터 베이스에서 불러와서 적용할 부분 -->
						<td>${dto.major_no }</td>
					</tr>
					
					<tr>
						<td class="text_padding_interval">활동지역</td>
						
	<!-- 						데이터 베이스에서 불러와서 적용할 부분 -->
						<td>${dto.c_loc }</td>
					</tr>
					
					<tr>
						<td class="text_padding_interval">세부장소</td>
						
	<!-- 						데이터 베이스에서 불러와서 적용할 부분 -->
						<td>${dto.c_place }</td>
					</tr>
					
					<tr>
						<td class="text_padding_interval">모임일정</td>
						
	<!-- 						데이터 베이스에서 불러와서 적용할 부분 -->
						<td>${dto.c_date }</td>
					</tr>
					
					<tr>
						<td class="text_padding_interval">비용</td>
						
	<!-- 						데이터 베이스에서 불러와서 적용할 부분 -->
						<td>${dto.c_price }</td>
					</tr>
					
					<tr>
						<td class="text_padding_interval">모집인원</td>
						
	<!-- 						데이터 베이스에서 불러와서 적용할 부분 -->
						<td >${dto.c_count }</td>
					</tr>
					
				</table>
				
				<div id="wish">
					<img src="${path}/resources/img/blackheart.png" alt="" style="float: left;"/>
					<input type="button" value="찜하기" class="top_button" id="wish_button" onclick="location.href =''">
				</div>
				
				<div id="report">
					<img src="${path}/resources/img/exclamation mark.png" name="c_image" alt="https://www.flaticon.com/kr/free-icon/exclamation-button_87980?term=%EB%8A%90%EB%82%8C%ED%91%9C&page=1&position=4&page=1&position=4&related_id=87980&origin=search" style="float: left;" id="wish_img"/>
<%-- 					<a href="doReport?c_no=${dto.c_no }"><input type="button" value="신고하기" class="top_button"/></a> --%>
					<input type="hidden" name="c_no" value="${dto.c_no }" id="c_no"/>
					<input type="button" value="신고하기" class="top_button" id="reportButton"/>
				</div>
				
				<div id="middle">
					<input type="button" value="문의하기" class="middle_button" id="inquiry_button"/>
					<input type="button" value="신청하기" class="middle_button" id="apply_button"/>
				</div>
				
	<!-- 			모임을 만든사람만 사용 할 수 있는 버튼 -->
				<div id="bottom">
					<input type="submit" value="수정하기" class="bottom_button"/>
<%-- 					<input type="button" value="수정하기" class="bottom_button" onclick="location.href ='clubModify?cno=${dto.c_no }'"/> --%>
					<input type="button" value="삭제하기" class="bottom_button" id="delete_button"/>
				</div>
				
			</div>
<!-- 				 	로그인한 사용자 아이디를 넘겨야함			 -->
				<input type="hidden" name="mem_id" value="dh"/>
				<input type="hidden" name="c_name" value="${dto.c_name }"/>
				<input type="hidden" name="c_detail" value="${dto.c_detail }"/>
				<input type="hidden" name="major_no" value="${dto.major_no }"/>
				<input type="hidden" name="c_loc" value="${dto.c_loc }"/>
				<input type="hidden" name="c_place" value="${dto.c_place }"/>
				<input type="hidden" name="c_date" value="${dto.c_date }"/>
				<input type="hidden" name="c_price" value="${dto.c_price }"/>
				<input type="hidden" name="c_count" value="${dto.c_count }"/>
				<input type="hidden" name="c_time" value="${dto.c_time }"/>

			
		</div>
	</form>

</body>
</html>