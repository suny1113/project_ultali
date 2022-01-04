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

	<div class="wrapper" >
		<div class="content">
			<form action="content">
				<table>
					<tr>
						<h3 >문의하기</h3>
						<hr class="border">
					</tr>
					<tr>
						<span class="marginTop bottom">회원아이디</span><br />
						<p class="marginTop">2021년 12월 22일 작성</p>

					</tr>
					<tr>
						<p  class="marginTop bottom">비밀글 입니다.</p>
					</tr>
				</table>
				<div class="contents">
					<table>
						<tr>
							<p class="marginTop bottom">모임장아이디</p>
						</tr>
						<tr>
							<p class="marginTop">2021년 12월 22일 작성</p>
						</tr>
						<tr>
							<p class="marginTop bottom">비밀글 입니다.</p>
						</tr>
						<tr>
							<td><input type="text" name="" id="text"  placeholder="내용을 입력해주세요"/></td>
							<td><input type="submit" value="답글쓰기" id="submit"/></td>
						</tr>
					</table>
				</div>
				<table>
					<tr>
						<hr class="border">
					</tr>
					<tr>
						<span class="marginTop bottom">회원아이디</span><br />
						<p class="marginTop">2021년 12월 22일 작성</p>

					</tr>
					<tr>
						<p  class="marginTop bottom">비밀글 입니다.</p>
					</tr>
				</table>
				<div class="contents">
					<table>
						<tr>
							<p class="marginTop bottom">모임장아이디</p>
						</tr>
						<tr>
							<p class="marginTop">2021년 12월 22일 작성</p>
						</tr>
						<tr>
							<p class="marginTop bottom">비밀글 입니다.</p>
						</tr>
						<tr>
							<td><input type="text" name="" id="text"  placeholder="내용을 입력해주세요"/></td>
							<td><input type="submit" value="답글쓰기" id="submit"/></td>
						</tr>
						<tr>
						</tr>
					</table>
				</div>
				<hr class="border">
				<div id="page">
					<nav aria-label="Page navigation example">
					  <ul class="pagination">
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
				</div>
				<input type="button" value="문의작성" id="inquireWrite"/>
			</form>
		</div>
	</div>
<body>
</body>
</html>