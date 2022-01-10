<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/questionAnswer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${path }/resources/js/questionAnswer.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<h1>문의한dto: ${viewAll }</h1>
	<h1>모임장cdto: ${cdto }</h1>
	<h2>c_no: ${c_no }</h2>
	<h2>지금 로그인한 사용자 아이디: ${id }</h2>
	<h2>모임장아이디: ${cdto.mem_id }</h2>
	<h2>답변ciadto1: ${ciadto1 }</h2>
	<h2>답변ciadto2: ${ciadto2 }</h2>
	
	
	<div class="wrapper" >
		<div class="content">
			<form action="questionWrite" id="form">

			<input type="hidden" name="a_no" value="0"/>
			<h3 >문의하기</h3>
			<div id="forEach">
				<c:forEach items="${viewAll }" var="list" varStatus="status">
						<input type="hidden" name="c_no" value="${c_no }"/>		
						<table>
							<tr>
								<hr class="border">
							</tr>
							<tr>
								<span class="marginTop bottom">${list.mem_id }</span><br />
								<p class="marginTop">${list.c_inq_regdate }</p>
		
							</tr>
							<tr>
								<c:if test="${list.c_inq_secretinq == 1 && cdto.mem_id != id && list.mem_id != id}">
									<p  class="marginTop bottom">비밀글 입니다</p>
								</c:if>
								<c:if test="${list.c_inq_secretinq == 1 && cdto.mem_id == id}">
									<p  class="marginTop bottom">${list.c_inq_detail }</p>
								</c:if>
								<c:if test="${list.c_inq_secretinq == 1 && list.mem_id == id}">
									<p  class="marginTop bottom">${list.c_inq_detail }</p>
								</c:if>
								
								<c:if test="${list.c_inq_secretinq == 0}">
									<p  class="marginTop bottom">${list.c_inq_detail }</p>
								</c:if>
							</tr>
						</table>
						<div class="contents">
							<table>
	<!-- 								if문안에 주석못달아서 여기에 적음 -->
	<!-- 								모임장이 답변을 했으면 모임장 아이디 공개 -->
	<!-- 								답변이 없으면 답변 대기중 입니다 내용추가 -->
	<!-- 								답변이 있을 경우 날짜처리 -->
								<p>${list.c_inq_no}</p>
								<input type="hidden" name="c_inq_no" value="${list.c_inq_no}"/>
								<c:if test="cdt"></c:if>
								<tr>
									<c:if test="${ciadto1.c_inq_no == list.c_inq_no}">
										<p class="marginTop bottom">${ciadto1.mem_id }</p>
									</c:if>
									<c:if test="${ciadto2.c_inq_no == list.c_inq_no}">
										<p class="marginTop bottom">${ciadto2.mem_id }</p>
									</c:if>
									
									<c:if test="${ciadto1.c_inq_no != list.c_inq_no && ciadto2.c_inq_no != list.c_inq_no}">
										<h2>답변 대기중 입니다.</h2>
									</c:if>
	
								</tr>
								<tr>
									<c:if test="${ciadto1.c_inq_no == list.c_inq_no}">
										<p class="marginTop">${ciadto1.c_inq_answer_regdate } 작성</p>
									</c:if>
									<c:if test="${ciadto2.c_inq_no == list.c_inq_no}">
										<p class="marginTop">${ciadto1.c_inq_answer_regdate } 작성</p>
									</c:if>
								</tr>
								<tr>
	<!-- 									비밀글or모임장or문의한 사람이 아니면 비밀글처리 -->
	<!-- 									비밀글 아니면 내용 공개 -->
									<c:choose>
										
										<c:when test="${ciadto1.mem_id == id && ciadto1.c_inq_no == list.c_inq_no}">
											<p  class="marginTop bottom">${ciadto1.c_inq_answer_answer}</p>
										</c:when>
										
										<c:when test="${ciadto2.mem_id == id && ciadto2.c_inq_no == list.c_inq_no}">
											<p  class="marginTop bottom">${ciadto2.c_inq_answer_answer}</p>
										</c:when>
										
										<c:when test="${cdto.mem_id == id && ciadto1.c_inq_no == list.c_inq_no}">
											<p  class="marginTop bottom">${ciadto1.c_inq_answer_answer}</p>
										</c:when>
										
										<c:when test="${cdto.mem_id == id && ciadto2.c_inq_no == list.c_inq_no}">
											<p  class="marginTop bottom">${ciadto2.c_inq_answer_answer}</p>
										</c:when>
										
										<c:when test="${list.c_inq_secretinq == 1 && cdto.mem_id != id && list.mem_id != id}">
											<p  class="marginTop bottom">비밀글 입니다</p>
										</c:when>
										
										<c:when test="${list.c_inq_secretinq == 0 && ciadto1.c_inq_no == list.c_inq_no}">
											<p  class="marginTop bottom">${ciadto1.c_inq_answer_answer}</p>
										</c:when>
										
										<c:when test="${list.c_inq_secretinq == 0 && ciadto2.c_inq_no == list.c_inq_no}">
											<p  class="marginTop bottom">${ciadto2.c_inq_answer_answer}</p>
										</c:when>
										
									</c:choose>
									
	
								</tr>
	<!-- 							모임장 아이디가 같아야하고 답변 내용이 없으면 답변하는 창 추가 -->
								<c:if test="${cdto.mem_id == id && ciadto1.c_inq_no != list.c_inq_no && ciadto2.c_inq_no != list.c_inq_no}" >
									<input type="hidden" name="c_inq_no" value="${list.c_inq_no }"/>
									
									<tr>
										<td><input type="text" name="c_inq_answer_answer" id="text"  placeholder="내용을 입력해주세요" value=""/></td>
										<td><input type="button" class="answerWrite" value="답글쓰기"/></td>
									</tr>
								</c:if>
							</table>
	
						</div>
					</c:forEach>
				</div>
				<hr class="border">				
				
				<div style="display: block; text-align: center;">		
					<c:if test="${paging.startPage != 1 }">
<!-- 						<input type="button" id="previous" value="&lt;" /> -->
						<a href="doQuestion?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&c_no=${c_no}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
<%-- 								<input type="button" class="page" value="${p }" /> --%>
								<a href="doQuestion?nowPage=${p }&cntPerPage=${paging.cntPerPage}&c_no=${c_no}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="doQuestion?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&c_no=${c_no}">&gt;</a>
					</c:if>
				</div>
<!-- 				모임장이면 문의작성 버튼 안보이게 처리 -->
				<c:if test="${cdto.mem_id != id }">
					<input type="submit" value="문의작성" id="inquireWrite"/>
				</c:if>
			<input type="hidden" name="mem_id" value="${id }"/>
			<input type="hidden" name="cntPerPage" value="${paging.cntPerPage}"/>
			<input type="hidden" name="nowPage" value="${paging.startPage}"/>
			</form>
		</div>
	</div>
<body>
</body>
</html>p