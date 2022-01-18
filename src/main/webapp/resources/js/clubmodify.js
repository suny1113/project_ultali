
	$(function(){
	// 	대분류 카테고리가 바뀌면 실행하는 메서드 or 히든에 값을 넘겨줌
		$("#majorNoSelect").change(function() {
			var subNoSelect =  $('#subNoSelect')[0];
			console.log($(this).val());
			
			// 만약 대분류가 1이면 이읏도어 소분류 카테고리 생성
			// 다른 카테고리거나 카테고리를 선택안하면 소분류를 없애기 위해 class="sub"를 줌
			if($(this).val() == 1){
				$(".sub").remove();
				subNoSelect.appendChild($("<option value='0' class='sub'>선택하세요 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='1' class='sub'>등산 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='2' class='sub'>차/오토바이 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='3' class='sub'>캠핑 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='4' class='sub'>여행 </option>")[0]);
			}else if($(this).val() == 2){
				$(".sub").remove();
				subNoSelect.appendChild($("<option name='sub_no' value='0' class='sub'>선택하세요 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='13' class='sub'>축구 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='14' class='sub'>농구 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='15' class='sub'>풋살 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='16' class='sub'>수영 </option>")[0]);
			}else if($(this).val() == 3){
				$(".sub").remove();
				subNoSelect.appendChild($("<option name='sub_no' value='0' class='sub'>선택하세요 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='21' class='sub'>요리 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='22' class='sub'>음료 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='23' class='sub'>디저트 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='24' class='sub'>빵 </option>")[0]);
				
			}else if($(this).val() == 4){
				$(".sub").remove();
				subNoSelect.appendChild($("<option name='sub_no' value='0' class='sub'>선택하세요 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='8' class='sub'>가죽 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='9' class='sub'>도자기 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='10' class='sub'>목공 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='11' class='sub'>플라워 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='12' class='sub'>비누 </option>")[0]);
				
			}else if($(this).val() == 5){
				$(".sub").remove();
				subNoSelect.appendChild($("<option name='sub_no' value='0' class='sub'>선택하세요 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='5' class='sub'>헬스 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='6' class='sub'>요가 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='7' class='sub'>필라테스 </option>")[0]);
				
			}else if($(this).val() == 6){
				$(".sub").remove();
				subNoSelect.appendChild($("<option name='sub_no' value='17' class='sub'>영어 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='18' class='sub'>외국어 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='19' class='sub'>컴퓨터 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='20' class='sub'>국가고시/공무원 </option>")[0]);
				
			}else if($(this).val() == 7){
				$(".sub").remove();
				subNoSelect.appendChild($("<option name='sub_no' value='0' class='sub'>소분류 선택 </option>")[0]);
				subNoSelect.appendChild($("<option name='sub_no' value='25' class='sub'>기타 </option>")[0]);
				
			}else{
				$(".sub").remove();
				$('input[name=sub_no]').val("선택하세요");
			}

		// 대분류 값 넘기기
			var target = document.getElementById("majorNoSelect");
			$('#major_no').val(target.options[target.selectedIndex].value)
		});
		
		// 소분류 값을 주기 위해 만든 메서드
		$("#subNoSelect").change(function() { 
			var target = document.getElementById("subNoSelect");
			$('#sub_no').val(target.options[target.selectedIndex].value);
		});
		
		// 지역 값을 주기 위해 만든 메서드
		$("#locSelect").change(function() { 
			var target = document.getElementById("locSelect");
			$('#c_loc').val(target.options[target.selectedIndex].value);
		
		});
		
		$("#submit").on("click", function(){
			var startDate = $('input[name=date]').val();
			var endDate = $('input[name=date2]').val();
		
			 //-을 구분자로 연,월,일로 잘라내어 배열로 반환
	        var startArray = startDate.split('-');
	        var endArray = endDate.split('-');   

	        //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
	        var start_date = new Date(startArray[0], startArray[1], startArray[2]);
	        var end_date = new Date(endArray[0], endArray[1], endArray[2]);



			if($('input[name=c_name]').val() == ""){
				alert("모임명을 입력해주세요");
			}else if($('input[name=major_no]').val() == "" || $('input[name=major_no]').val() == "선택하세요"){
				alert("분야를 선택하세요");
			}else if($('input[name=sub_no]').val() == "" || $('input[name=sub_no]').val() == "선택하세요" || $('input[name=sub_no]').val() == 0){
				alert("소분류를 선택하세요");
			}else if($('input[name=c_loc]').val() == "" || $('input[name=c_loc]').val() == "선택하세요"){
				alert("활동지역을 선택하세요");
			}else if($('input[name=c_place]').val() == ""){
				alert("세부장소를 입력하세요");
			}else if(startDate == ""){
				alert("시작날짜를 선택해주세요");
			}else if(endDate == ""){
				alert("종료날짜를 선택해주세요");
			}else if(start_date.getTime() > end_date.getTime()){
				alert("종료날짜보다 시작날짜가 작아야합니다.");
			}else if($('input[name=c_time]').val() == ""){
				alert("모임시간을 입력하세요");
			}else if($('input[name=c_count]').val() == ""){
				alert("모집인원을 입력하세요");
			}else if($('input[name=c_price]').val() == ""){
				alert("비용을 입력하세요");
			}else if($('input[name=c_count]').val() == ""){
				$('input[name=c_count]').val("!!!!!!!기본이미지 경로가 생기면 수정해야함 clubRegister.js")
			}else{
				$("#submit").attr("type","submit");
				$("#c_date").val(startDate.val() + endDate.val());
				$("#form").submit(); 
			}
		});
		
	})
