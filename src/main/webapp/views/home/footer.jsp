<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>   
<link rel="stylesheet" href="${path}/resources/css/home.css">

<div class="before-footer"></div>
<div class="footer-color-width"></div>
	<footer>
		<div class="footer">
			<p>(주)울타리 &nbsp; </p>
			<p>대표 : 홍길동</p>
			<p>전화번호 : 02)1234-5678 </p>
			<p>서울시 성동구 왕십리로 115 헤이그라운드 서울숲점 G605</p>
			<p>고객센터 운영시간 : 평일 10:00 - 17:00 (점심: 12:00 - 13:00)</p>

			<a href="${path }/termsOfUse">이용약관</a> | 
			<a href="${path }/service"><strong>개인정보 처리방침</strong></a>
		</div>
	</footer>