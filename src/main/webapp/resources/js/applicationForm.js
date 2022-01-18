$(function() {
	var c_no = $("#c_no").val();
	
	// 체크박스 단일 선택
	$('input[type="checkbox"]').click(function() {
		if($(this).prop('checked')) {
			$('input[type="checkbox"]').prop('checked', false);
			$(this).prop('checked', true);
		}
	});
	
	// 신청하기 버튼
	$("#apply").on("click", function() {
		if($("#mem_name").val() == "") {
			alert("이름을 입력하세요");
		} else if($('input[name="gender"]:checked').val() != "남성" &&
				  $('input[name="gender"]:checked').val() != "여성") {
			alert("성별을 체크하세요");
		} else if($("#input_phone").val() == "") {
			alert("휴대폰 번호를 입력하세요");
		} else {
			$("#apply").attr("type","submit");
			$(".apply_form").submit();
		}
	});
	
	// 취소 버튼
	$("#cancel").on("click", function() {
		$(location).attr("href", "clubBoardDetail?c_no="+c_no);
	});

})