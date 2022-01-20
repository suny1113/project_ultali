$(function (){

	var chkObj = document.getElementsByName("check");
	var id = $("#idCheck").val();
	
	// 관리자 권한 모임 삭제
	$("#btn_del").on("click", function(){
		var valueArr = new Array();
		var list = $("input[name='check']");
		var major_no = $("#major_no").val();
		
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				valueArr.push(list[i].value);
			}
		}
		
		if(valueArr.length == 0) {
			alert("삭제할 모임을 선택하세요");
		} 
		else {
			var chk = confirm("선택한 게시물을 삭제하시겠습니까?");
			console.log(valueArr);
			
			$.ajax({
				url : 'clubDelete2',
				type : 'POST',
				traditional : true,
				data : {
					valueArr : valueArr,
					major_no : major_no
				},
				success : function(jdata){
					if(jdata = 1) {
						alert("삭제 성공");
						location.replace("clubBoardList?major_no=" + major_no);
					}
					else {
						alert("삭제 실패");
					}
				}
			});
		}
	
		//$("#form").attr("action", "clubDelete2");
		//$("#btn_del").attr("type","submit");
		//$("#form").submit();
	});

	// 모임 등록
	$("#btn_reg").on("click", function(){
		if($("#idCheck").val() == "") {
			alert("로그인이 필요합니다");
			$(location).attr("href", "../login/login");
		}
		else {
			$(location).attr("href", "clubRegister");
		}
	});
	
});