$(function(){
	$("#submit").on("click", function(){
		
		// 신고 유형을 선택하지 않았을 경우 처리
		if($('#rep_reason').val() == "신고사유"){
			alert("신고 유형을 선택하세요");		
		// 내용을 입력하지 않았을 경우 처리
		}else if($('#textarea').val() == ""){
			alert("내용을 입력하세요");
		// 신고 유형과 내용을 입력했을 경우 처리		
		}else if($('#rep_reason').val() != "신고사유" && $('#textarea').val() != ""){
			alert("신고가 성공적으로 완료 되었습니다.");
			$("#submit").attr("type","submit");
			$("#form").submit();
		}
		
	
	});
	
	$("select").change(function() {
		var target = document.getElementById("select");
		$('#rep_reason').val(target.options[target.selectedIndex].value)
	});

});