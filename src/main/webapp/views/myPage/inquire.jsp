<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/inquire.css">
    
<title>1대1문의</title>
</head>
<body>
	<jsp:include page="../home/header.jsp"/>
	<form action="inquireWrite" method="get">
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
        <table>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>답변</th>
            </tr>
            <c:forEach var="inquiredto" items="${showList }">
            <tr>
                <td>${inquiredto.p_inq_no }</td>
                <td> <a href="inquireDetail?p_inq_no=${inquiredto.p_inq_no}">${inquiredto.p_inq_title }</a></td>
                <td>${inquiredto.mem_id }</td>
<%--                 <td>${inquiredto.p_inq_status }</td> --%>
                <c:if test="${inquiredto.p_inq_status == 0 }">
                	<td></td>
                </c:if>
                <c:if test="${inquiredto.p_inq_status == 1}">
                	<td>답변완료</td>
                </c:if>
            </tr>
            </c:forEach>
             <tr>
                <td colspan="4">
                    <ul>
                    	<c:if test="${map.prev }">
                        	<li><a href="inquire?currentPage=${(map.startPageNo-1)  }">이전</a></li>
                        </c:if>
                        <c:forEach begin="${map.startPageNo }" end="${map.endPageNo }" var="i">
                        	<li> <a href="inquire?currentPage=${i }">${i }</a></li>
                        </c:forEach>
                        <c:if test="${map.next }">
                        	<li> <a href="inquire?currentPage=${map.endPageNo+1 }">다음</a></li>
                        </c:if>
                    </ul>
                </td>
            </tr>
        </table>
        <input type="submit" value="글쓰기">
    </div>
</div>
</form>
	<jsp:include page="../home/footer.jsp"/>
</body>
</html>