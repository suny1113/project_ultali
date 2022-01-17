<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/questionAnswer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${path }/resources/js/questionAnswer.js"></script>
<head>
<meta charset="UTF-8">
<title>울타리 :: 취미모임의 시작</title>
</head>
<body>
<%-- 	<h1>문의한dto: ${viewAll }</h1> --%>
<%-- 	<h1>모임장cdto: ${cdto }</h1> --%>
<%-- 	<h2>c_no: ${c_no }</h2> --%>
<%-- 	<h2>지금 로그인한 사용자 아이디: ${id }</h2> --%>
<%-- 	<h2>모임장아이디: ${cdto.mem_id }</h2> --%>
<%-- 	<h2>답변ciadto1: ${ciadto1 }</h2> --%>
<%-- 	<h2>답변ciadto2: ${ciadto2 }</h2> --%>
<%-- 	<h2>paging: ${paging }</h2> --%>

	
	<jsp:include page="../home/header.jsp" />
	<div class="wrapper" >
		<div class="contents border">
			<form action="questionWrite" id="form">

			<h2 id="title">문의하기</h2>
			<div id="forEach">
				<c:forEach items="${viewAll }" var="list" varStatus="status">
							
						<table>
							<div id="user_question" class="border">
								<tr>
								</tr>
								<tr>
									<p class="user bottom">문의 회원: ${list.mem_id }</p>
									<p class="user">문의 날짜: ${list.c_inq_regdate }</p>
			
								</tr>
								<tr>
									<c:if test="${list.c_inq_secretinq == 1 && cdto.mem_id != id && list.mem_id != id}">
										<p id="user_content" class="">문의 내용</p>
										<textarea class="user_text" name="" id="" cols="30" rows="10" readonly="readonly">비밀글 입니다.</textarea>
									</c:if>
									<c:if test="${list.c_inq_secretinq == 1 && cdto.mem_id == id}">
										<p id="user_content" class="">문의 내용</p>
										<textarea class="user_text" name="" id="" cols="30" rows="10" readonly="readonly">${list.c_inq_detail }</textarea>
									</c:if>
									<c:if test="${list.c_inq_secretinq == 1 && list.mem_id == id}">
										<p id="user_content" class="">문의 내용</p>
										<textarea class="user_text" name="" id="" cols="30" rows="10" readonly="readonly">${list.c_inq_detail }</textarea>
									</c:if>
									
									<c:if test="${list.c_inq_secretinq == 0}">
										<p id="user_content" class="">문의 내용</p>
										<textarea class="user_text" name="" id="" cols="30" rows="10" readonly="readonly">${list.c_inq_detail }</textarea>
									</c:if>
								</tr>
							</div>
						</table>
						<div id="leader_answer" class="border">
							<table>
	<!-- 								if문안에 주석못달아서 여기에 적음 -->
	<!-- 								모임장이 답변을 했으면 모임장 아이디 공개 -->
	<!-- 								답변이 없으면 답변 대기중 입니다 내용추가 -->
	<!-- 								답변이 있을 경우 날짜처리 -->
<%-- 								<p>${list.c_inq_no}</p> --%>
<%-- 								<p>${status.index}</p> --%>
<%-- 								<p>${status.count}</p> --%>
<%-- 								<p>${status.first }</p> --%>
<%-- 								<p>${status.last}</p> --%>
<%-- 								<a class="a" href="answerWrite?nowPage=${paging.startPage} &cntPerPage=${paging.cntPerPage} &c_no=${c_no } &c_inq_no=${list.c_inq_no} &c_inq_answer_answer=">답글쓰기</a> --%>
								<c:if test="cdt"></c:if>
								<tr>
									<c:if test="${ciadto1.c_inq_no == list.c_inq_no}">
										<p class="leader bottom">모임장: ${ciadto1.mem_id }</p>
									</c:if>
									<c:if test="${ciadto2.c_inq_no == list.c_inq_no}">
										<p class="leader bottom">모임장: ${ciadto2.mem_id }</p>
									</c:if>
									
									<c:if test="${ciadto1.c_inq_no != list.c_inq_no && ciadto2.c_inq_no != list.c_inq_no}">
										<p class="leader">답변 대기중 입니다.</p>
									</c:if>
	
								</tr>
								<tr>
									<c:if test="${ciadto1.c_inq_no == list.c_inq_no}">
										<p class="leader">답변 날짜: ${ciadto1.c_inq_answer_regdate } 작성</p>
									</c:if>
									<c:if test="${ciadto2.c_inq_no == list.c_inq_no}">
										<p class="leader">답변 날짜: ${ciadto1.c_inq_answer_regdate } 작성</p>
									</c:if>
								</tr>
								<tr>
	<!-- 									비밀글or모임장or문의한 사람이 아니면 비밀글처리 -->
	<!-- 									비밀글 아니면 내용 공개 -->
									<c:choose>
										
										<c:when test="${ciadto1.mem_id == id && ciadto1.c_inq_no == list.c_inq_no}">
											<p class="leader">답변 내용</p>
											<textarea name="" id="leader_text" class="answer_content" cols="30" rows="10" readonly="readonly">${ciadto1.c_inq_answer_answer}</textarea>
										</c:when>
										
										<c:when test="${ciadto2.mem_id == id && ciadto2.c_inq_no == list.c_inq_no}">
											<p class="leader">답변 내용</p>
											<textarea name="" id="leader_text" class="answer_content" cols="30" rows="10" readonly="readonly">${ciadto2.c_inq_answer_answer}</textarea>
										</c:when>
										
										<c:when test="${cdto.mem_id == id && ciadto1.c_inq_no == list.c_inq_no}">
											<p class="leader">답변 내용</p>
											<textarea name="" id="leader_text" class="answer_content" cols="30" rows="10" readonly="readonly">${ciadto1.c_inq_answer_answer}</textarea>
										</c:when>
										
										<c:when test="${cdto.mem_id == id && ciadto2.c_inq_no == list.c_inq_no}">
											<p class="leader">답변 내용</p>
											<textarea name="" id="leader_text" class="answer_content" cols="30" rows="10" readonly="readonly">${ciadto2.c_inq_answer_answer}</textarea>
										</c:when>
										
										<c:when test="${list.c_inq_secretinq == 1 && cdto.mem_id != id && list.mem_id != id && ciadto1.c_inq_answer_answer != null && ciadto2.c_inq_answer_answer != null}">
											<p class="leader">답변 내용</p>
											<textarea name="" id="leader_text" class="answer_content" cols="30" rows="10" readonly="readonly">비밀글 입니다.</textarea>
										</c:when>
										
										<c:when test="${list.c_inq_secretinq == 0 && ciadto1.c_inq_no == list.c_inq_no}">
											<p class="leader">답변 내용</p>
											<textarea name="" id="leader_text" class="answer_content" cols="30" rows="10" readonly="readonly">${ciadto1.c_inq_answer_answer}</textarea>
										</c:when>
										
										<c:when test="${list.c_inq_secretinq == 0 && ciadto2.c_inq_no == list.c_inq_no}">
											<p class="leader">답변 내용</p>
											<textarea name="" id="leader_text" class="answer_content" cols="30" rows="10" readonly="readonly">${ciadto2.c_inq_answer_answer}</textarea>
										</c:when>
										
									</c:choose>
									
	
								</tr>
	<!-- 							모임장 아이디가 같아야하고 답변 내용이 없으면 답변하는 창 추가 -->
								<c:if test="${cdto.mem_id == id && ciadto1.c_inq_no != list.c_inq_no && ciadto2.c_inq_no != list.c_inq_no}" >
									
									<tr>
										<input type="hidden" id="c_inq_no${status.count}" value="${list.c_inq_no }"/>
										<td><textarea id="text${status.count}" class="text" name="" id="" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea> </td>
										<td><input type="button" class="answerWrite" id="answerWrite${status.count}" value="등록"/></td>
									</tr>
								</c:if>
							</table>
	
						</div>
					</c:forEach>
				</div>
				
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
					<c:if test="${paging.total > 2}">
						<c:if test="${paging.endPage != paging.lastPage}">
							<a href="doQuestion?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&c_no=${c_no}">&gt;</a>
						</c:if>
					</c:if>
				</div>
<!-- 				모임장이면 문의작성 버튼 안보이게 처리 -->
				<c:if test="${cdto.mem_id != id }">
					<input type="button" value="문의작성" id="inquireWrite"/>
<!-- 						<a href="#pop1" class="btn">문의작성</a> -->
<!-- 						<div class="popup" id="pop1"> -->
<!-- 							<div id="popupClose"> -->
<!-- 								<a href="#a">닫기</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="dim"></div> -->
				</c:if>
			<input type="hidden" name="c_no" id="c_no" value="${c_no }"/>	
			<input type="hidden" name="c_inq_no" id="c_inq_no"/>
			<input type="hidden" name="c_inq_answer_answer" id="c_inq_answer_answer"/>
			<input type="hidden" name="mem_id" value="${id }"/>
			<input type="hidden" name="cntPerPage" value="${paging.cntPerPage}"/>
			<input type="hidden" name="nowPage" value="${paging.startPage}"/>
			</form>
		</div>
	</div>
	<jsp:include page="../home/footer.jsp" />
</body>
</html>