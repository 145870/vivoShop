$("#erji-ul li").mouseover(function(){
		    //显示总容器
		    $("#erji-box").css('height','400px');
		    // 获取第几个元素触发
		    var index = $(this).index();
		    //隐藏所有
		    $('.erji-div').hide();
		    //只显示当前
		    $('.erji-div').eq(index).show();

		}).mouseout(function(){
			var index = $(this).index();
			var div=$('#erji-box .erji-div').eq(index);
			if(isMouseInTooltip(event,div)){
				
			}else{
				$('.erji-div').hide();
			}
			
		});
		$('.erji-div').mouseout(function(){
			$(this).hide()
		})
		
			function isMouseInTooltip(event, menu) {
			    var Left = menu.offset().left - 20;
			    var Right = Left + menu.outerWidth();
			    var Top = menu.offset().top;
			    var Bottom = Top + menu.outerHeight();
			
			    var mouseX = event.pageX;
			    var mouseY = event.pageY;
			
			    // 判断鼠标位置是否在悬浮范围 加上左边距的范围内
			    if (mouseX >= Left && mouseX <= Right && mouseY >= Top && mouseY <= Bottom) {
			        return true; // 在范围内
			    } else {
			        return false; // 不在范围内
			    }
			}