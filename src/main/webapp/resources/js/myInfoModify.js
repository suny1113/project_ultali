/**
 * 
 */
	var chknickname = 0;
	
/*    function checknickname(){
        var nickname = $(new_nickname).val();
        $.ajax({
            url:'nicknameCheck', // Controller 에서 인식할 주소
            type:'get', // POST 방식으로 전달
            data:{new_nickname:nickname},
            success:function(result){
				console.log(result);
            	if(result === "is_ok"){ // cnt가 1이 아니면 사용이 가능한 닉네임이다.
            		$('.nickname_ok').css("display","inline-block");
            		$('.nickname_already').css("display","none");
					chknickname = 1;
					console.log(chknickname);
            	}else{ // cnt 가 1인 경우
            		$('.nickname_ok').css("display","none");
            		$('.nickname_already').css("display","inline-block");
					chknickname = 1;
					console.log(chknickname);
            	}
            },
            error:function(){
            	alert("에러입니다.");
            }
        });

    };*/


	function joinform_check(){
		/*var nickname = $(new_nickname);*/
		var password = $(new_pw);
		var phone = $(new_phone);
		
		if(password.val() == ""){
			alert("비밀번호를 입력하세요")
			password.focus();
			return false;
		}
		
		//비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
  		var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		if(!pwdCheck.test(password.val())){
		 	alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
		    password.focus();
		    return false;	
		}
		
		if(password.val() != $(new_pwchk).val()){
			alert("비밀번호가 일치하지 않습니다.");
			console.log(password.val());
			console.log($(new_pwchk).val());
			$(new_pwchk).focus();
			return false;
		}
		if(phone.val() == ""){
			alert("핸드폰번호를 입력하세요")
			phone.focus();
			return false;
		}
		
		var reg = /^[0-9]+/g; //숫자만 입력하는 정규식
		if(!reg.test(phone.val())){
			alert("핸드폰 번호는 숫자만 입력할 수 있습니다.");
			phone.focus();
			return false;
		}
		
		// 유효성 검사의 포인트
		document.join_form.submit();

	}
    	