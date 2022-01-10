// 	찜목록에 이 모임이 있으면 빨간색하트 추가해야됨
	window.onload = function(){
		var bottom =  $('#bottom')[0];
		if($("#mem_id").val() == $("#id").val()){
			bottom.appendChild($("<input type='submit' value='수정하기' class='bottom_button'/>")[0])
			bottom.appendChild($("<input type='button' value='삭제하기' class='bottom_button' id='delete_button'/>")[0])
		}
		
	
	}
	$(function(){
		$("wish_button").on("click", function(){
			$("wish_img").attr("src","../../resources/img/redheart.png")
		});
		
		$("#reportButton").on("click", function(){
			var num = $('#c_no').val();
			var win = window.open("doReport?c_no="+num, "_blank", "width=780, height=450, location=no, scrollbars=no, fullscreen=no, resizable=no, status=no, toolbar=no , left=500, top=250");
		});
		
		$("#inquiry_button").on("click", function(){
			$("#form").attr("action", "doQuestion");
			$("#inquiry_button").attr("type","submit");
			$("#form").submit();
		});
		
		$("#delete_button").on("click", function(){
			$("#form").attr("action", "clubDelete");
			$("#delete_button").attr("type","submit");
			$("#form").submit();
		});
		
		$("#apply_button").on("click", function(){
			$("#form").attr("action", "이거수정");
			$("#apply_button").attr("type","submit");
			$("#form").submit();
		});
		
		$("#addOrDeleteWish_button").on("click", function(){
			$("#form").attr("action", "addOrDeleteWish");
			$("#addOrDeleteWish_button").attr("type","submit");
			$("#form").submit();
		});
	})