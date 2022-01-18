<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${path }/resources/css/home.css" />
<link rel="stylesheet" type="text/css" href="${path }/resources/css/clubRegister.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${path }/resources/js/clubRegister.js"></script>
<head>
<meta charset="UTF-8">
<title>울타리 :: 취미모임의 시작</title>
</head>
<body>
	<jsp:include page="../home/header.jsp" />
	<form:form action="clubRegister" method="post" modelAttribute="uploadFile" enctype="multipart/form-data" id="form">
		<div id="main" class="body-container">
		
			<div id="aa">	
				<div id="title">
					<p id="p">모임등록</p>
				</div>
				
				<div id="contents">
					<table>
						<tr>
							<td><span class="category">모임명</span></td>
							<td><input type="text" class="content" name="c_name" id="input" class="input" placeholder="내용을 입력해주세요"/></td>
						</tr>
						
						<tr>
							<td><span class="category">분야/소분류</span></td>
							<td><select id="majorNoSelect" class="content">
									<option value="0">분야 선택 </option>
									<option value="1">아웃도어 </option>
									<option value="2">스포츠 </option>
									<option value="3">쿠킹 </option>
									<option value="4">공예  </option>
									<option value="5">피트니스  </option>
									<option value="6">자기계발 </option>
									<option value="7">기타 </option>
							</select></td>
							<td><select id="subNoSelect">
							</select></td>
						</tr>
						<tr>
							<td><span class="category">활동지역</span></td>
							<td><select id="locSelect" class="content">
	<!-- 							https://www.gaok.or.kr/gaok/main/contents.do?menuNo=200107  참고함 -->
									<option>선택하세요 </option>
									<option value="서울특별시">서울특별시 </option>
									<option value="부산광역시">부산광역시 </option>
									<option value="대구광역시">대구광역시 </option>
									<option value="인천광역시">인천광역시  </option>
									<option value="광주광역시">광주광역시  </option>
									<option value="대전광역시">대전광역시 </option>
									<option value="울산광역시">울산광역시 </option>
									<option value="세종특별자치시">세종특별자치시 </option>
									<option value="경기도">경기도 </option>
									<option value="강원도">강원도 </option>
									<option value="충청북도">충청북도	 </option>
									<option value="충청남도">충청남도 </option>
									<option value="전라북도">전라북도 </option>
									<option value="전라남도">전라남도 </option>
									<option value="경상북도">경상북도 </option>
									<option value="경상남도">경상남도 </option>
									<option value="제주특별자치도">제주특별자치도 </option>
							</select></td>	
						</tr>
						
						<tr>
							<td><span class="category subTitle">세부장소</span></td>				
							<td><input type="text" class="content" name="c_place" id="" class="input" placeholder="내용을 입력해주세요"/></td>
						</tr>
						
						<tr>
							<td><span class="category subTitle">모임일정</span></td>
							<td><input type="date" class="content" name="date" id="date" /></td> 
							<td><span style="margin-right: 28px;">~</span> </td> 
							<td><input type="date" class="content " name="date2" id="date2"/> </td> 
						</tr>
						
						<tr>
							<td><span class="category subTitle">모임시간</span></td>
							<td><input type="text" class="content" name="c_time" id="" class="input" placeholder="ex)토요일 13 : 00 ~ 15 : 00"/></td>
						</tr>
						
						<tr>
							<td><span class="category subTitle">모집인원</span></td>
							<td><input type="number" class="content" name="c_count" id="" class="input2" style="width: 30px;"/><span style="margin-left: 5px;">명</span></td>
						</tr>
						
						<tr>
							<td><span class="category subTitle">비용</span></td>
							<td><input type="number" class="content" name="c_price" id="" class="input2" style="width: 80px; " value=""/><span style="margin-left: 5px;">원</span></td>
						</tr>
						
						<tr>
							<td><span class="category subTitle">이미지등록</span></td>
							<td><input type="file" class="content" name="file" id="file" style="width: 150px;" value="" accept="image/gif, image/jpeg, image/png"></td>
						</tr>
						
						<tr>
							<td><span class="category subTitle" id="areaTitle">상세설명</span></td>
							<td><textarea rows="10" cols="50" name="c_detail" id="area"></textarea></td>
						</tr>
					</table>
					<div>
	
	<!-- 					mem_id은 로그인하고 데이터를 받으면 넘겨줄 수 있음 -->
						<input type="hidden" name="mem_id" value="${id}" />
	
	<!-- 				 카테고리 선택하면 jquery로 값을 넘겨줌 -->
						<input type="hidden" name="major_no" id="major_no"/>
						<input type="hidden" name="sub_no" id="sub_no"/>
						<input type="hidden" name="c_loc" id="c_loc"/>
						<input type="hidden" name="c_hits" id="c_hits" value="0"/>
						
	<!-- 					시퀀스로 값을 넘겨주기 떄문에 아무값이나 줌 -->
						<input type="hidden" name="c_no" id="c_no" value="0"/>
	
						<input type="button" value="등록" class="button_style" id="submit"/>
						<a href="clubBoardList?major_no="${major_no2}><input type="button" value="취소" class="button_style" id="cancel" /></a>
						
					</div>
				</div>
			</div>
		</div>
		<form:errors path="file"></form:errors>
	</form:form>
	<jsp:include page="../home/footer.jsp" />
</body>
</html>