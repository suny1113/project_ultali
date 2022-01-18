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
	
	function myPage(){
		console.log("testr")
		console.log("<c:out value='${sessionScope.id}'/>")
		var id = "<c:out value='${sessionScope.id}'/>"
		
		if(id == ""){
			alert("로그인을 해 주세요.")
			location.href = "<c:out value='${path}' />"+"/myPage/myInfo"
		}
	}
  
</script>
<div class="nav-color-width"></div>
	<header>
		<div class="header">
			<div class="nav">
				<sec:authorize access="isAnonymous()">
					<a href="${path }/register/register" class="nav-a">회원가입</a>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<a href="${path }/login/login" class="nav-a">로그인</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()" >
					<a href="${path }/logout" class="nav-a">로그아웃</a>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<a href="javascript:myPage()" class="nav-a">마이페이지</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<a href="${path }/myPage/myInfo" class="nav-a">마이페이지</a>
				</sec:authorize>
				<a href="${path }/help/notice" class="nav-a">고객센터</a>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<a href="${path }/admin/reportList?currentPage=1" class="nav-a">관리자페이지</a>
				</sec:authorize>
			</div>
			<form action="search">
				<div class="logo-search-container">
					<div class="logo-search">
						<a href="${path}/home"><img src="${path}/resources/img/logo.png" alt="" id="logo" /></a>
						<input type="text" name="word" id="searchbar" placeholder="검색어를 입력해주세요."/>
					</div>
				</div>

			</form>
		</div>
	</header>