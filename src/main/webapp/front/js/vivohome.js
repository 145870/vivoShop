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
	            $("#navDiv").css('display', 'block');
	            
	            // 获取当前元素的索引
	            var index = $(this).index('.navDiv');
	            
	            // 隐藏所有 .navDiv
	            $('.navDiv').hide();
	            
	            // 显示当前对应的 .navDiv
	            $('.navDiv').eq(index).show();
	        });
	    
	    //移出列表
	       $("#navDiv").mouseout(function(e){
	           //设置总容器
	           $("#navDiv").css('height','0');
	           //隐藏所有
	           if ($(e.relatedTarget).closest('#head-nav').length === 0) {
	               $('.navDiv').hide();
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
			
		
	});
	