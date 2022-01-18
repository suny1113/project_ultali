	window.onload = function(){
		var bottom =  $('#bottom')[0];
		if($("#mem_id").val() == $("#id").val()){
			bottom.appendChild($("<input type='submit' value='수정하기' class='bottom_button button'/>")[0])
			bottom.appendChild($("<input type='button' value='삭제하기' class='bottom_button button' id='delete_button'/>")[0])
		}
		
	
	}
	$(function(){
		$("wish_button").on("click", function(){
			if($("#idCheck").val() == ""){
				alert("로그인을 해주세요");
			}else if($("#idCheck").val() != ""){
				$("wish_img").attr("src","../../resources/img/redheart.png")
			}
		});
		
		$("#reportButton").on("click", function(){
			if($("#idCheck").val() == ""){
				alert("로그인을 해주세요");
			}else if($("#idCheck").val() != ""){
			    var _left = Math.ceil(( window.screen.width - 714 )/2);
			    var _top = Math.ceil(( window.screen.height - 360 )/2); 
				var num = $('#c_no').val();
				var win = window.open("doReport?c_no="+num, "_blank", "location=no, width=714, height=360, scrollbars=no, fullscreen=no, status=no, toolbar=no, left=" + _left  + ",top=" + _top);
			}
		});
		
		$("#inquiry_button").on("click", function(){
			if($("#idCheck").val() == ""){
				alert("로그인을 해주세요");
			}else if($("#idCheck").val() != ""){
				$("#form").attr("action", "doQuestion");
				$("#inquiry_button").attr("type","submit");
				$("#form").submit();
			}
		});
		
		$("#delete_button").on("click", function(){
			if($("#idCheck").val() == ""){
				alert("로그인을 해주세요");
			}else if($("#idCheck").val() != ""){
				$("#form").attr("action", "clubDelete");
				$("#delete_button").attr("type","submit");
				$("#form").submit();
			}
		});
		
		$("#apply_button").on("click", function(){
			if($("#idCheck").val() == ""){
				alert("로그인을 해주세요");
				window.location.replace("../login/login");
			}else if($("#idCheck").val() != ""){
				$("#form").attr("action", "doApply");
				$("#apply_button").attr("type","submit");
				$("#form").submit();
			}
		});
		
		$("#addOrDeleteWish_button").on("click", function(){
			if($("#idCheck").val() == ""){
				alert("로그인을 해주세요");
			}else if($("#idCheck").val() != ""){
				$("#form").attr("action", "addOrDeleteWish");
				$("#addOrDeleteWish_button").attr("type","submit");
				$("#form").submit();
			}
		});
	})