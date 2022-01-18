/**
 * 
 */

var chknickname = 0;
var idLimit = /^[a-zA-Z0-9-_]{5,20}$/; //정규식 5~20자 (a~z, A~Z, 0~9, -, _만 입력가능)

function idCheck(){
   var id = $(mem_id).val();
   console.log(id);
   if (!idLimit.test(id)) { //입력값과 정규식 범위와 같지 않다면
   // id의 오류 문구삽입
      $(idError).html("5~20자의 영문 소대문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
   }else{
      $.ajax({
      url:'nicknameCheck', // Controller에서 인식할 주소
      type : 'get', // post 로 전달
      data:{new_id : id},
      success:function(result){
         console.log(result);
         if(result==="is_ok"){
            $(idError).html("사용할 수 있는 ID 입니다.");
            chknickname = 1;
            
         }else{
            $(idError).html("5~20자의 영문 소대문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
            chknickname = 0;
         }
         console.log(chknickname);
      },
      error:function(){
         alert("에러입니다.")
      }
   });
   }

};

      function registerform_check(){
      var id = $(mem_id);
      var password = $(mem_pw);
      var phone = $(mem_phone);
      var email = $(mem_email);
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
         $(new_pwchk).focus();
		 return false;
      }
      
      var regExp = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;

      if(!regExp.test(email.val())){
         alert("이메일은 @를 영문+숫자 포함하여 점(.), 하이픈(-),언더바(_)만 사용 가능합니다.");
         email.focus();
         return false;
      }
      
      if(id.val() == ""){
         alert("닉네임을 입력하세요")
         id.focus();
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
      console.log(chknickname)
      if(chknickname == 1){
         document.register_form.submit();
      }else{
         alert("사용 불가능한 닉네임 입니다.")
      }
   }
   
   