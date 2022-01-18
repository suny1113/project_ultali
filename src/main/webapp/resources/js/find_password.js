//서버에서 전송받아온 값 저장할 변수
var x;
var code = ""
var id = ""
// 인증번호 일치 여부
var doubleChk = $("#doubleChk").val()



$(function(){
	
	$("#chk-authNum").hide()
	$("#chk-btn").hide()
	$("#accept-authNum").show()
	$("#warn-id").hide()
	$("#warn-name").hide()
	$("#warn-tel").hide()
	$("#warn-btn").hide()


    $("#accept-authNum").click(function(){
    	if($("#input-id").val() == ""){
    		$("#warn-id").show()
    		$("#warn-name").hide()
    		$("#warn-tel").hide()
    	}else if($("#input-name").val() == ""){
    		$("#warn-name").show()
    		$("#warn-id").hide()
    		$("#warn-tel").hide()
    	}else if($("#input-tel").val() == ""){
    		$("#warn-tel").show()
    		$("#warn-id").hide()
    		$("#warn-name").hide()
    	}else{
    		$("#warn-name").hide()
    		$("#warn-tel").hide()
    		var name = $("#input-name").val()
    		var tel = $("#input-tel").val()
    		var id = $("#input-id").val()
	    	$.ajax({
	    		type : "post",
	    		url : "checkAuthNumPw",
	    		data : {"mem_name" : name, "mem_phone" : tel, "mem_id" : id},
	    		success : function(result){
	    			if(result=="error"){
	    				alert("입력한 정보와 일치하는 계정 정보가 없습니다.")
	    			}else{
	    				alert("인증번호가 발송되었습니다.\n제한시간 안에 인증번호를 입력하세요.")
	    				$("#accept-authNum").hide()
    					$("#chk-authNum").show()
    					$("#chk-btn").show()
    					$("#input-id").attr("readnoly", true)
    					$("#input-name").attr("readonly", true)
    					$("#input-tel").attr("readonly", true)
    					
	    				code = result
	
						var time = 180
						var min = ""
						var sec = ""
							
							x = setInterval(function(){
								min = parseInt(time/60)
								sec = time%60
								
								time--
								document.getElementById("timer").innerHTML = min + "분" + sec + "초"
								
								if(time < 0){
									clearInterval(x)
									document.getElementById("timer").innerHTML = ""
									alert("인증시간이 만료되었습니다.")
									$("#chk-authNum").hide()
						    		$("#chk-btn").hide()
						    		$("#accept-authNum").show()
									
								}
								
						}, 1000)
	    				
	    			}
	    		}
	    	})
    	}
    })
    
    $("#chk-btn").click(function(){
    	if($("#chk-authNum").val() == code && $("#chk-authNum").val() != ""){
			alert("인증번호가 일치합니다.")
			clearInterval(x)
			document.getElementById("timer").innerHTML = ""
			$("#warn-btn").hide()
			doubleChk = "true"
		}else{
			alert("인증번호가 일치하지 않습니다.")
			doubleChk = "false"
		}
    })
    
    $("#submit-btn").click(function(){
    	if(doubleChk == "true"){
    		$("#frm").submit()
    	}else{
    		$("#warn-btn").show()
    	}
    })
    
})	