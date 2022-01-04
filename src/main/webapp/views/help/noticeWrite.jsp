<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<h1>writeForm.jsp</h1>
		<form action="write" method="post">
			<div class="mb-3">
				<label for="writer" class="form-label">작성자</label> <input
					type="text" class="form-control" id="writer" name="writer"
					placeholder="작성자ID">
			</div>
			<div class="mb-3">
				<label for="title" class="form-label">제목</label> <input type="text"
					class="form-control" id="title" name="title" placeholder="제목">
			</div>
			<div class="mb-3">
				<label for="contents" class="form-label">내용</label>
				<textarea class="form-control" id="contents" name="contents" row="3"></textarea>
			</div>
			<div class="mb-3">
				<button type="submit" class="btn btn-outline-success">등록</button>
			</div>
		</form>
	</div>

</body>
</html>