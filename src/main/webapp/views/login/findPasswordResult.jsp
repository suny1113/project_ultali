<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function(){
		$("#pw").keyup(function(){
			$("passwordChk").html("");
		})
		
		$("#rePw").keyup(function(){
			if($("#pw").val() != $("#rePw").val()){
				$("#passwordChk").html("비밀번호가 일치하지 않습니다.")
				$("#passwordChk").css("color", "#f82a2aa3")
			}else{
				$("#passwordChk").html("비밀번호가 일치합니다.")
				$("#passwordChk").css("color", "#199894b3")
			}
		})
		
		$("#changePw").click(function(){
			
			if($("#pw").val() != $("#rePw").val()){
				alert("비밀번호가 일치하지 않습니다.")
			}else if($("#pw").val() == $("#rePw").val()){
				$("#submitFrm").attr("action", "changePw")
				$("#submitFrm").attr("method", "POST")
				$("#submitFrm").submit();
				alert("비밀번호가 변경되었습니다.")
			}
			
		})
	})
</script>
</head>
<body>
	<h1>findPasswordResult</h1>
	
	<h1>비밀번호 찾기</h1>
	<form id="submitFrm">
		<input type="hidden" name="id" id="id" value="${id }" />
			새 비밀번호 입력 <input type="password" name="pw" id="pw" placeholder="비밀번호"/><br>
			비밀번호 확인 <input type="password" name="rePw" id="rePw" placeholder="비밀번호 확인" />
			<font id="passwordChk"></font>
			<br>
			<input type="button" value="비밀번호 변경" id="changePw" />
	</form>
</body>
</html>