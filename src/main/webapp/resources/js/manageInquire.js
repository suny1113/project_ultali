    function xSize(e)
    {
        var xe = document.getElementById('inquire-detail-event'),
            t;

        e.onfocus = function()
        {
            t = setInterval(
                function()
                {
                    xe.value = e.value;
                    e.style.height = (xe.scrollHeight + 12) + 'px';
                }, 100);
        }

        e.onblur = function()
        {
            clearInterval(t);
        }
    }

    xSize(document.getElementById('inquire-detail'));
    

	function reSize(e)
    {
        var xe = document.getElementById('inquire-answer-write-event'),
            t;

        e.onfocus = function()
        {
            t = setInterval(
                function()
                {
                    xe.value = e.value;
                    e.style.height = (xe.scrollHeight + 12) + 'px';
                }, 100);
        }

        e.onblur = function()
        {
            clearInterval(t);
        }
    }

    reSize(document.getElementById('inquire-answer-write'));


	function reSize2(e)
    {
        var xe = document.getElementById('inquire-answer-event'),
            t;

        e.onfocus = function()
        {
            t = setInterval(
                function()
                {
                    xe.value = e.value;
                    e.style.height = (xe.scrollHeight + 12) + 'px';
                }, 100);
        }

        e.onblur = function()
        {
            clearInterval(t);
        }
    }

    reSize2(document.getElementById('inquire-answer'));
    
