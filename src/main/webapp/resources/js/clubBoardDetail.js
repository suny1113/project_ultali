// 	찜목록에 이모임이 있으면 빨간색하트
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
	})