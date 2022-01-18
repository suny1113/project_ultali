<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>울타리 :: 우리가 이어지는 공간</title>
	<meta name="author" content="Alvaro Trigo Lopez" />
	<meta name="description" content="fullPage full-screen navigation and sections control menu." />
	<meta name="keywords"  content="fullpage,jquery,demo,screen,fullscreen,navigation,control arrows, dots" />
	<meta name="Resource-type" content="Document" />


	<link rel="stylesheet" type="text/css" href="${path}/resources/css/jquery.fullPage.css" />
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/examples.css" />

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>

	<script type="text/javascript" src="${path}/resources/js/scrolloverflow.js"></script>

	<script type="text/javascript" src="${path}/resources/js/jquery.fullPage.js"></script>
	<script type="text/javascript" src="${path}/resources/js/examples.js"></script>

	
	<link rel="stylesheet" type="text/css" href="resources/css/intro.css" />

</head>
<body>

<div id="fullpage">
	<div class="section " id="section0">
		<div class="intro">
			<div class="logo">
				<a href="home"><img src="resources/img/logo.png" alt="" /></a>
			</div>
			<br />
			<div class="typing">
				<span class="text"></span><span class="blink">|</span>
			</div>
		</div>
	</div>
	<div class="section" id="section1">
		<div class="intro">
			<div class="span-div">
				<span>이게</span><span>모</span><span>임</span>
			</div>
			<div class="grid-div">
				<div id="first-grid" class="grid-template">
					<h2>누구나</h2>
					<pre>
취미활동에
제한이 왜 필요해?

남녀노소 누구나

쉽고 간편하게 모이자!
					</pre>
					<p></p>
					<img src="resources/img/everyone.png" alt="" />
				</div>
				<div id="second-grid" class="grid-template">
					<h2>편리한</h2>
					<img src="resources/img/websurfing.png" alt="" />
					<pre>
오프라인으로 이곳저곳 돌아보며
시간 낭비 NO!

방구석에서 클릭 한 번이면 끝!

모임장에게 연락받고
즐겁게 모임활동 시작!
					</pre>
				</div>
				<div id="third-grid" class="grid-template">
					<h2>즐거운</h2>
					<pre>
하나 보단 둘
둘 보단 셋

함께하면 기쁨이 배로!

한 번의 시작으로
오랫동안 즐거운 취미활동
					</pre>
					<img src="resources/img/fun.png" alt="" />
				</div>
			</div>
		</div>
	</div>
	<div class="section" id="section2">
	    <div class="slide" id="slide1">
			<div class="intro">
				<h1>취미활동 공유</h1>
				<p>
					연대감 UP! 사회성 UP!
				</p>
			</div>
		</div>

	    <div class="slide" id="slide2">
			<div class="intro">
				<h1>규칙적인 활동</h1>
				<p>
					건강한 신체 & 운동수행능력 향상
				</p>
			</div>
		</div>

	    <div class="slide" id="slide3">
			<div class="intro">
				<h1>동기유발</h1>
				<p>
					슬럼프 극복, 긍정적 자세
				</p>
			</div>
		</div>
		
	</div>
	<div class="section" id="section3">
		<div class="intro">
			<h1>함께 이어가요</h1>
			<a href="home">→</a>
		</div>
	</div>
</div>

<script type="text/javascript" src="${path}/resources/js/intro.js"></script>

</body>
</html>