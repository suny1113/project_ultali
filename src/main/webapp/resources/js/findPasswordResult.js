$(function(){
		
		
		
		
    $("#pw").keyup(function(){
        $("#warn").html("");
    })
    
    $("#rePw").keyup(function(){
        if($("#pw").val() =="" && $("#rePw").val() == ""){
            $("#warn").hide()
        }else if($("#pw").val() != $("#rePw").val()){
            $("#warn").html("비밀번호가 일치하지 않습니다.")
            $("#warn").css("color", "#f82a2aa3")
        }else{
            $("#warn").html("비밀번호가 일치합니다.")
            $("#warn").css("color", "#199894b3")
        }
    })
    
    $("#submit-btn").click(function(){
        
        if($("#pw").val() != $("#rePw").val() ||
           $("#pw").val() == "" || $("rePw").val() == "" ){
            alert("비밀번호가 일치하지 않습니다.")
        }else if($("#pw").val() == $("#rePw").val()){
            $("#frm").attr("action", "changePw")
            $("#frm").attr("method", "POST")
            $("#frm").submit();
            alert("비밀번호가 변경되었습니다.")
        }
        
    })
})