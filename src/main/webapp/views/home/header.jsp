<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/home.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

	$(function (){
		
		$("#searchbar").on("keydown", function (key){
				if( key.keyCode == 13 && ($("#searchbar").val() == null || $("#searchbar").val() == "" || $("#searchbar").val() == "undefined") ){
					alert("검색어를 입력해주세요.");
				}
				if( key.keyCode == 13){
					
					$.get("search"),
					{ word : $("#searchbar").val() }
					
				}
		})

	})
		
</script>
<div class="nav-color-width"></div>
	<header>
		<div class="header">
			<div class="nav">
				<a href="register/register" class="nav-a">회원가입</a>
				<sec:authorize access="isAnonymous()">
					<a href="login/login" class="nav-a">로그인</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<a href="logout" class="nav-a">로그아웃</a>
				</sec:authorize>
				<a href="myPage/myInfo" class="nav-a">마이페이지</a>
				<a href="help/notice" class="nav-a">고객센터</a>
<%-- 				<c:if test="${ mem_id eq 'admin' }"> --%>
				<a href="admin/reportList?currentPage=1" class="nav-a">관리자페이지</a>
<%-- 				</c:if> --%>
			</div>
			<form action="search">
				<div class="logo-search-container">
					<div class="logo-search">
						<a href="home"><img src="${path}/resources/img/logo.png" alt="" id="logo" /></a>
						<input type="text" name="word" id="searchbar" placeholder="검색어를 입력해주세요."/>
					</div>
				</div>
			</form>
		</div>
	</header>