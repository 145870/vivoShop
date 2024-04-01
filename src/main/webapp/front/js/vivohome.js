$(function(){
	     $("#head-nav li").mouseover(function(){
	        //显示总容器
	        $("#navDiv").css('height','350px');
	        // 获取第几个元素触发
	        var index = $(this).index();
	        //隐藏所有
	        $('.navDiv').hide();
	        //只显示当前
	        $('.navDiv').eq(index).show();
	    });
	
	    $(".navDiv").mouseover(function(){
	        // 显示总容器
	        $("#navDiv").css('height', '350px');
	        
	        // 获取当前元素的索引
	        var index = $(this).index('.navDiv');
	        
	        // 隐藏所有 .navDiv
	        $('.navDiv').hide();
	        
	        // 显示当前对应的 .navDiv
	        $('.navDiv').eq(index).show();
	    });
	    
	    //移出列表
	    $("#navDiv").mouseout(function(event){
	        //设置总容器
	        $("#navDiv").css('height','0');
	        //隐藏所有
	        if ($(event.relatedTarget).closest('#head-nav').length === 0 && $(event.relatedTarget).closest('#sss').length === 0) {
	            $('.navDiv').fadeOut();
	        }
	    });
		$("#box").mouseout(function(){
		   //设置总容器
		   $("#navDiv").css('height','0');
		   //隐藏所有
		   if ($(event.relatedTarget).closest('#head-nav').length === 0 && $(event.relatedTarget).closest('#sss').length === 0) {
		       $('.navDiv').fadeOut();
		   }
		});
		//给搜索框添加事件
		$("#sou").click(function(){
			$("#sss").css('height','434px').css('display','block').css('opacity','1');
			$("#sou-tu").css('margin-left','0px');
			$("#span-X").css('margin-left','300px');
			$("#sou-ul").css('display','block');
			$("##sou-ul li a").css('margin-left','0');
		});
		//给x添加事件
		$("#span-X").click(function(){
			$("#sss").css('height','0').fadeOut().css('transition','3s');
			$("#sou-ul").fadeOut().css().css('transition','1s');
		});
		
		
		
		
		
		
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
			
			
		
		
		
	});
	