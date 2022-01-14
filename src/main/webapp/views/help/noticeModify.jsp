<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String mem_id = (String) session.getAttribute("mem_id");%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="../home/header.jsp" />
	
	<div class="container">
		<form action="noticeModify" method="post">
		<input type="hidden" name="mem_id" value="<%=mem_id %>" />
			<div class="mb-3">
				<label for="title" class="form-label">제목</label> 
				<input type="text" class="form-control" id="title" name="n_title" placeholder="제목">
			</div>
			<div class="mb-3">
				<label for="writer" class="form-label">작성자</label> 
				<input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="작성자ID">
			</div>
			
			<div class="mb-3">
				<label for="contents" class="form-label">내용</label>
				<textarea class="form-control" id="n_detail" name="n_detail" row="3"></textarea>
			</div>
			<div class="mb-3">
				<button type="submit" class="">등록</button>
			</div>
		</form>
	</div>

	<!-- footer -->
	<jsp:include page="../home/footer.jsp" />
</body>
</html>