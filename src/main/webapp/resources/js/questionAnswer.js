$(function(){
//		$(".answerWrite").on("click", function(){
//			$(".answerWrite").attr("type","submit");
//			$("#form").attr("action", "answerWrite");
//			$("#form").submit(); 
//		});
	
	

		$("#answerWrite1").on("click", function(){
			console.log(1);
			$("#c_inq_answer_answer").val($("#text1").val());
			$("#c_inq_no").val($("#c_inq_no1").val());
			console.log($("#c_inq_answer_answer").val());
			$("#answerWrite1").attr("type","submit");
			$("#form").attr("action", "answerWrite");
			$("#form").submit(); 
		});
			
		$("#answerWrite2").on("click", function(){
			console.log(2);
			$("#c_inq_answer_answer").val($("#text2").val());
			$("#c_inq_no").val($("#c_inq_no2").val());
			console.log($("#c_inq_answer_answer").val());
			$("#answerWrite2").attr("type","submit");
			$("#form").attr("action", "answerWrite");
			$("#form").submit(); 
		});	
	
	})

	

	