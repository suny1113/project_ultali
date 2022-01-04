<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1 {
		margin: 30px 30px 15px 30px;
		font-size: 20px;
	}
	
	.report-body-container {
		width: 1080px;
		height: 500px;
		margin: 0 auto;
		display: grid;
		grid-template-columns: 200px 800px;
	}
	
	.report-body-left {
		border-right: 1px solid rgb(240,240,240);
	}
	
	.report-body-left a {
		position: relative;
		top: 5px;
	}
	
	.report-body-left h1 {
		font-size: 15px;
	}
	
	
</style>
</head>
<body>
	<jsp:include page="../home/header.jsp" />

	<div class="report-body-container">
		<div class="report-body-left">
			<a href=""><h1>신고내역</h1></a>
			<a href=""><h1>1:1 문의 관리</h1></a>
		</div>
		<div class="report-body-right">
			<h1>신고내역</h1>
		</div>
	</div>
	
	<jsp:include page="../home/footer.jsp" />
	
</body>
</html>