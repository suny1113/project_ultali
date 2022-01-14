

$(function(){
		$("#submit").on("click", function(){
			if($("#secret").is(':checked')){
				$("#c_inq_secretinq").val(1)
			}else{
				$("#c_inq_secretinq").val(0)
			}
			$("#submit").attr("type","submit");
			$("#form").submit(); 
		});
		
	})