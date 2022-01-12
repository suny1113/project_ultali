<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/clubRegister.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${path }/resources/js/clubRegister.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form action="clubRegister" method="post" modelAttribute="uploadFile" enctype="multipart/form-data" id="form">
		<div id="main">
			<div id="title">
				<h4>모임등록</h4>
			</div>
			
			<div id="contents">
				<table>
					<tr>
						<td><h2>기본정보</h2></td>
					</tr>
					<tr>
						<td><p class="category">모임명</p></td>
						<td><input type="text" name="c_name" id="" class="input" placeholder="내용을 입력해주세요"/></td>
					</tr>
					
					<tr>
						<td><p class="category">분야</p></td>
						<td><select id="majorNoSelect">
								<option value="0">선택하세요 </option>
								<option value="1">아웃도어 </option>
								<option value="2">스포츠 </option>
								<option value="3">쿠킹 </option>
								<option value="4">공예  </option>
								<option value="5">피트니스  </option>
								<option value="6">자기계발 </option>
								<option value="7">기타 </option>
						</select></td>
					</tr>
					
					<tr>
						<td><p class="category">소분류</p></td>
						<td><select id="subNoSelect">
	
						</select></td>
					</tr>
					
					<tr>
						<td><h2>모임정보</h2></td>
					</tr>
					
					<tr>
						<td><p class="category">활동지역</p></td>
						<td><select id="locSelect">
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
						<td><p class="category">세부장소</p></td>				
						<td><input type="text" name="c_place" id="" class="input" placeholder="내용을 입력해주세요"/></td>
					</tr>
					
					<tr>
						<td><p class="category">모임일정</p></td>
						<td><input type="date" name="date" id="" /></td> 
						<td><p class="category" style="margin-right: 28px;">~</p> </td> 
						<td><input type="date" name="date2" id=""/> </td> 
					</tr>
					
					<tr>
						<td><p class="category">모임시간</p></td>
						<td><input type="text" name="c_time" id="" class="input" placeholder="ex)토요일 13 : 00 ~ 15 : 00"/></td>
					</tr>
					
					<tr>
						<td><p class="category">모집인원</p></td>
						<td><input type="number" name="c_count" id="" class="input2" style="width: 30px;"/><span class="category" style="margin-left: 5px;">명</span></td>
					</tr>
					
					<tr>
						<td><p class="category">비용</p></td>
						<td><input type="number" name="c_price" id="" class="input2" style="width: 80px; " value=""/><span class="category" style="margin-left: 5px;">원</span></td>
					</tr>
					
					<tr>
						<td><p class="category">이미지등록</p></td>
						<td><input type="file" name="file" id="file" style="width: 150px;" value="" accept="image/gif, image/jpeg, image/png"></td>
					</tr>
					
					<tr>
						<td><p class="category">상세설명</p></td>
					</tr>
				</table>
				<textarea rows="10" cols="70" name="c_detail"></textarea>
				<div>

<!-- 					mem_id은 로그인하고 데이터를 받으면 넘겨줄 수 있음 -->
					<input type="hidden" name="mem_id" value="세션 아이디로 변경해야함" />

<!-- 				 카테고리 선택하면 jquery로 값을 넘겨줌 -->
					<input type="hidden" name="major_no" id="major_no"/>
					<input type="hidden" name="sub_no" id="sub_no"/>
					<input type="hidden" name="c_loc" id="c_loc"/>
					<input type="hidden" name="c_hits" id="c_hits" value="0"/>
					
<!-- 					시퀀스로 값을 넘겨주기 떄문에 아무값이나 줌 -->
					<input type="hidden" name="c_no" id="c_no" value="0"/>

					<input type="button" value="등록" class="button_style" id="submit"/>
					<input type="button" value="취소" class="button_style" id="aa" />
					
				</div>
			</div>
		</div>
		<form:errors path="file"></form:errors>
	</form:form>
</body>
</html>