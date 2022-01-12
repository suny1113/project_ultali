$(document).ready(function() {
			$('#fullpage').fullpage({
				anchors: ['인트로', '홈페이지 소개', '모임 장점', '홈페이지 이동'],
				navigation: true,
				navigationPosition: 'left',
				navigationTooltips: ['인트로', '홈페이지 소개', '모임 장점', '홈페이지 이동']
			});
		})
		
		
 const content = "우리가 이어지는 공간\n울타리";
    const text = document.querySelector(".text");
    let index = 0;

    function typing() {
      let txt = content[index++];
      text.innerHTML += txt === "\n" ? "<br/>" : txt;
      if (index > content.length) {
        text.innerHTML = "우리가 이어지는 공간<br/>울타리";
      }
    }
setInterval(typing, 200)