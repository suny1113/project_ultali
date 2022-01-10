$(function(){
		$(".answerWrite").on("click", function(){
			$(".answerWrite").attr("type","submit");
			$("#form").attr("action", "answerWrite");
			$("#form").submit(); 
		});
	

	
	})
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="boardList?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
	

	