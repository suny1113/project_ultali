$(function(){

		$("#answerWrite1").on("click", function(){
			$("#c_inq_answer_answer").val($("#text1").val());
			$("#c_inq_no").val($("#c_inq_no1").val());
			console.log($("#c_inq_answer_answer").val());
			$("#answerWrite1").attr("type","submit");
			$("#form").attr("action", "answerWrite");
			$("#form").submit(); 
		});
			
		$("#answerWrite2").on("click", function(){
			$("#c_inq_answer_answer").val($("#text2").val());
			$("#c_inq_no").val($("#c_inq_no2").val());
			console.log($("#c_inq_answer_answer").val());
			$("#answerWrite2").attr("type","submit");
			$("#form").attr("action", "answerWrite");
			$("#form").submit(); 
		});	
		
		$("#inquireWrite").on("click", function(){
		    var _left = Math.ceil(( window.screen.width - 714 )/2);
		    var _top = Math.ceil(( window.screen.height - 360 )/2); 
			$("#inquireWrite").val($("#text2").val());
			$("#c_no").val();
			var num = $('#c_no').val();
			var win = window.open("questionWrite?c_no="+$("#c_no").val(), "_blank", "location=no, width=714, height=360, scrollbars=no, fullscreen=no, status=no, toolbar=no, left=" + _left  + ",top=" + _top);
			$("#inquireWrite").val("문의작성");
		});	"submit"
	
	})

	

	