<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 문의</title>
<link rel="stylesheet" href="../resources/css/inquireDetail.css">
</head>
<body>
	<jsp:include page="../home/header.jsp"/>
 <h1>1대1 문의</h1>
    <div class="container">
     <menu>
			<div class="item1">
				<h2>마이페이지</h2>
				<table>
					<tr>
						<td><a href="myInfo">내 정보</a></td>
					</tr>
					<tr>
						<td><a href="recentClub">최근 본 모임</a></td>
					</tr>
					<tr>
						<td><a href="wishList">찜한 모임</a></td>
					</tr>
					<tr>
						<td><a href="inquire">1대1 문의</a></td>
					</tr>
					<tr>
						<td><a href="createdClub">내가 개설한 모임</a></td>
					</tr>
					<tr>
						<td><a href="myClubList">내가 가입한 모임</a></td>
					</tr>
				</table>
			</div>
		</menu>

        <div class="item2">
            <div>
                 <div class="info">제목</div><input type="text" name="title" id="" value="${dto.p_inq_title }">
            </div>
            <div>
                 <div class="info">작성자</div><input type="text" name="title" id="" value="${dto.mem_id }">
            </div>
        
            <div class="contents">
                <textarea name="contents" id="" cols="70" rows="10" readonly="readonly">${dto.p_inq_detail }</textarea>
                
                <c:if test="${dto.p_inq_answer == null}">
                	<textarea name="admincontents" id="" cols="70" rows="5" readonly="readonly">아직 관리자가 답변을 하지 않았습니다.</textarea>
                </c:if>
                <c:if test="${dto.p_inq_answer != null}">
                	<textarea name="admincontents" id="" cols="70" rows="5" readonly="readonly">${dto.p_inq_answer}</textarea>
                </c:if>
            </div>
            <div class="acontainer">
            	<a href="deleteInquire?p_inq_no=${p_inq_no }" class="btn" >문의 삭제</a>
            	<a href="inquire" class="btn" >뒤로 가기</a>
            </div>
        </div>
    </div>
	<jsp:include page="../home/footer.jsp"/>
</body>
</html>