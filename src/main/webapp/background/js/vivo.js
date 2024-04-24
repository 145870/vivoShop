var xx=false;
var form = layui.form;
var upload = layui.upload;
var laydate = layui.laydate;
var table = layui.table;
var dropdown = layui.dropdown;
var layer = layui.layer;
var util = layui.util;
var element = layui.element;

// 自定义模块
var tableMerge = layui.tableMerge;

$(function(){
	//全局变量
	//动态切换标题状态
	
	// 封装tab功能
	var tab={
	    tabAdd: function(title,url,id){
	      // 新增一个 tab 项
	      element.tabAdd('home-tab', {
	        title: title,
			type:2,
			//tab插入的内容
	        content: "<div class='tab-body' tab-id='"+id+"'></div>",
	        id: id,
	        change: true // 是否添加完毕后即自动切换
	      })
		  //插入内容
		  $("#main-body .layui-tab-content .layui-tab-item .tab-body").each(function(){
		  	if($(this).attr('tab-id')==id){

		  		var $this=$(this);
				if(url=='javascript:;'){
					$this.html("404")
					return;
				}
		  		$.ajax({
		  		    url: url,
		  		    method: 'GET',
		  		    success: function(data) {
						$this.html(data)
		  			},
		  		    error: function(xhr, status, error) {
		  				console.log('请求失败：', error);
		  		    }
		  		});
		  	}
		  })
		  
	    },
	    tabDelete: function(othis){
			// 删除指定 tab 项
	      element.tabDelete('home-tab', "1"); // 删除
	      othis.addClass('layui-btn-disabled');
	    },
	    tabChange: function(id){
	      // 切换到指定 tab 项
	      element.tabChange('home-tab', id); // 切换到：标签3
	    }
	}
	
	//封装tips提示
	var tips={
		//tips显示方向 1上2右3下4左
		    tips: function(title,tips){
		      layer.tips(title, this, {
		        tips: tips
		      });
		    },
		    
		   tips_color: function(){
		      layer.tips('可自定义任意主题色', this, {
		        tips: [1, '#16b777']
		      });
		    },
		   tips_more: function(){
		      layer.tips('不会关闭之前的 tips', this, {
		        tipsMore: true
		      });
			}
	}
	
	//hover样式
	$("#collapse-icon i,#full-screen i").mouseenter(function(){
		$(this).css("color","rgb(65,95,255)")
	}).mouseleave(function(){
		$(this).css("color","rgb(31,31,31)")
	})
	
	//判断是否全屏如果是就取消如果不是就全屏
	function toggleFullScreen() {
	  if (!document.fullscreenElement) {  // 如果当前不在全屏模式
	    if (document.documentElement.requestFullscreen) {
	      document.documentElement.requestFullscreen(); // 请求全屏
	    } else if (document.documentElement.mozRequestFullScreen) { /* Firefox */
	      document.documentElement.mozRequestFullScreen();
	    } else if (document.documentElement.webkitRequestFullscreen) { /* Chrome, Safari & Opera */
	      document.documentElement.webkitRequestFullscreen();
	    } else if (document.documentElement.msRequestFullscreen) { /* IE/Edge */
	      document.documentElement.msRequestFullscreen();
	    }
		full_screen_sta="取消全屏"
		$("#full-screen i").removeClass("llayui-icon-screen-full").addClass("layui-icon-screen-restore")
	  } else { // 如果当前在全屏模式
	    if (document.exitFullscreen) {
	      document.exitFullscreen(); // 退出全屏
	    } else if (document.mozCancelFullScreen) { /* Firefox */
	      document.mozCancelFullScreen();
	    } else if (document.webkitExitFullscreen) { /* Chrome, Safari and Opera */
	      document.webkitExitFullscreen();
	    } else if (document.msExitFullscreen) { /* IE/Edge */
	      document.msExitFullscreen();
	    }
		full_screen_sta="全屏"
		$("#full-screen i").removeClass("layui-icon-screen-restore").addClass("layui-icon-screen-full")
	  }
	}

	//全屏切换
	$("#full-screen i").click(function(){
		toggleFullScreen()
	})
	
	$("#detailed-menu a").click(function(event){
		event.preventDefault(); // 阻止默认跳转行为		
		//判断是否有其他子菜单
		if($(this).parent().children().length==2){
				//判断是否展开
				if($(this).next('.sidebar-menu').hasClass('sidebar-menu-open')){
					//箭头方向
				    $(this).find('i:not(.left-icon)').removeClass('layui-edge-top').addClass('layui-edge-bottom')
					
					//删除class
					$(this).next('.sidebar-menu').removeClass('sidebar-menu-open');
					if ($("#app").hasClass("hideSidebar")) {
						//如果页面收缩直接返回不进行收缩
					    return;
					}
					//收缩
					$(this).next('.sidebar-menu').stop().slideUp();
				}else{
					
					$(this).find('i:not(.left-icon)').removeClass('layui-edge-bottom').addClass('layui-edge-top')
					$(this).next('.sidebar-menu').addClass('sidebar-menu-open');
				    // 折叠其他的菜单
				    $(this).parent().siblings().find('.sidebar-menu').removeClass('sidebar-menu-open').stop().slideUp();
				    // 修改其他菜单项的箭头方向
				    $(this).parent().siblings().find('a').find('i:not(.left-icon)').removeClass('layui-edge-top').addClass('layui-edge-bottom');
					
					//判断当前页面菜单状态是否折叠
					if($('#app').hasClass('hideSidebar')){
						return;
					}
					$(this).next('.sidebar-menu').stop().slideDown();
				}
				
		}else{
			//删除展开的属性
			$('.sidebar-menu').removeClass('sidebar-menu-open');
			// 折叠其他的菜单
			$(this).parent().siblings().find('.sidebar-menu').removeClass('sidebar-menu-open').stop().slideUp();
			// 修改其他菜单项的箭头方向
			$(this).parent().siblings().find('a').find('i:not(.left-icon)').removeClass('layui-edge-top').addClass('layui-edge-bottom');
			
			var url = $(this).attr('href');
			var title;
			if ($(this).has('span').length) {
			  title = $(this).children('span').html();
			} else {
			  title = $(this).html();
			}
			var index  = $('#detailed-menu a').index($(this));
			
			//切换字体颜色
			$(".menu").removeClass("sidebar-menu-selected");
			$(this).addClass("sidebar-menu-selected");
			//判断是否创建了这个标签如果有则切换
			for (var i = 0; i <$('.tab-body').length; i++) {
			    if($('.tab-body').eq(i).attr('tab-id')==index+1){
					//切换
					
			        tab.tabChange(index+1);
			        event.stopPropagation();
			        return;
			    }
			};
			xx=true;
			//因为索引从0开始所以加1
			//否则创建
			tab.tabAdd(title,url,index+1);
			tab.tabChange(index+1);
		}
	})
	
	// tab切换事件触发捕获
	element.on('tab(home-tab)', function(){
		//获取id值
		var tab_id=this.getAttribute('lay-id')-1;
		//获取a标签
		var a=$('#detailed-menu a').eq(tab_id)
		//更改字体
		$(".menu").removeClass("sidebar-menu-selected");
		a.addClass("sidebar-menu-selected");
		
		//标题
		var tit = ['首页'];
		var currentMenu = a;
		
		while (currentMenu.length) {
		    var parentMenuText = currentMenu.parent().parent().prev().find('span').text();
		    if (parentMenuText) {
		        tit.push(parentMenuText);
		        currentMenu = currentMenu.parent().parent().prev().find('a.menu');
		    } else {
		        break;
		    }
		}
		tit.push(a.text());
		//去重
		var uniqueArray = Array.from(new Set(tit));

		//切换标题
		toggleTheTitleStatus(uniqueArray);
		
		//判断是否有子菜单 筛选掉子菜单中的a
		if(a.not('.sidebar-menu .menu').length){
			//删除展开的属性
			$('.sidebar-menu').removeClass('sidebar-menu-open');
			// 折叠其他的菜单
			a.parent().siblings().find('.sidebar-menu').removeClass('sidebar-menu-open').stop().slideUp();
			// 修改其他菜单项的箭头方向
			a.parent().siblings().find('a').find('i:not(.left-icon)').removeClass('layui-edge-top').addClass('layui-edge-bottom');
		}else{
			//判断是否展开 如果没有就展开
			var menu=a.parent().parent();
			if(menu.hasClass('sidebar-menu-open')){
				
			}else{
				menu.prev('a').find('i:not(.left-icon)').removeClass('layui-edge-bottom').addClass('layui-edge-top')
				menu.addClass('sidebar-menu-open');
				
			    //折叠其他的菜单
				menu.parent().siblings().find('.sidebar-menu').removeClass('sidebar-menu-open').stop().slideUp();
			    // 修改其他菜单项的箭头方向
			    menu.parent().siblings().find('a').find('i:not(.left-icon)').removeClass('layui-edge-top').addClass('layui-edge-bottom');
			   
			   if ($("#app").hasClass("hideSidebar")) {
			   	//如果页面收缩直接返回不进行展开
			       return;
			   }
			   //展开
			   menu.stop().slideDown();
			}
		}
		
	});
	
	
	//折叠菜单功能
	$("#collapse-icon i").click(function(){
		//是否打开
	    if ($("#app").hasClass("openSidebar")) {
	        $(this).removeClass("layui-icon-shrink-right").addClass("layui-icon-spread-left");
	        $("#app").removeClass("openSidebar").addClass("hideSidebar");
	        $("#sidebar").animate({width: "55px"}, 300);
	        $("#right-body").animate({marginLeft: "55px"}, 300);
			
			$("#logo span").fadeOut(120);
			setTimeout(()=>{
				$("#logo img").animate({height: '12px'}, 200);
			},150)
			$('.left-icon').next('span').fadeOut(300);
			
			//折叠其他的菜单折叠但是不删除class
			$('.sidebar-menu').stop().slideUp();
			 // 修改其他菜单项的箭头方向
			$('.sidebar-menu').prev().find('i:last-child').removeClass('layui-edge-top').addClass('layui-edge-bottom');
	    } else {
			//筛选出所以a但是不属于.sidebar-menu .menu的a
			var a=$(".menu.sidebar-menu-selected:not(.sidebar-menu .menu)")
				//如果没有子菜单
				if(a.length){
					$('.sidebar-menu').removeClass('sidebar-menu-open');
				}
			
			//把选中的菜单也进行展开
			$('.sidebar-menu').each(function(){
				
				if($(this).hasClass('sidebar-menu-open')){
					$(this).slideDown();
					
				}
			})
			
			//切换图标
	        $(this).removeClass("layui-icon-spread-left").addClass("layui-icon-shrink-right");
			//切换状态
	        $("#app").removeClass("hideSidebar").addClass("openSidebar");
			//菜单
	        $("#sidebar").animate({width: "175px"}, 300);
			//内容
	        $("#right-body").animate({marginLeft: "175px"}, 300);
			///logo
			$("#logo img").animate({height: '20px'}, 200);
			setTimeout(()=>{
				$("#logo span").fadeIn(120);
			},100)
			$('.left-icon').next('span').fadeIn(300);
	    }
	});
	
	var dl = null; // 全局变量，用于存储 dl 的内容
	
	//悬浮提示
	$("#detailed-menu a:not(.sidebar-menu .menu)").mouseenter(function(event) {
	    //清空悬浮内容避免出错
	    $('.tooltip').fadeOut(200, function() {
	        $(this).remove();
	    });
	
	    if (dl != null) {
	        removeFloatMenu(); // 移除悬浮菜单
	    }
	
	    // 是否打开侧边栏菜单
	    if ($("#app").hasClass("openSidebar")) {
	        return;
	    }
	
	    //获取文本
	    var txt;
	    if ($(this).has('span').length) {
	        txt = $(this).children('span').html();
	    } else {
	        txt = $(this).html();
	    }
	
	    // 判断是否有其他子菜单
	    if ($(this).parent().children().length == 2) {
	        dl = $(this).parent().children(".sidebar-menu").addClass('float-menu layui-anim')
	
	        // 设置悬浮菜单位置和样式
	        dl.css({
	            position: 'absolute',
	            top: $(this).offset().top,
	            left: $(this).offset().left + $(this).outerWidth() + 3,
	            backgroundColor: 'rgb(48,65,86)',
				display: 'block',
	            width: '100px'
	        });
	
	        dl.find('.menu').css({
	            paddingLeft: 0,
	            textAlign: 'center',
	            fontSize: '10px'
	        });
	
			//触发动画
			dl.removeClass("layui-anim-scaleSpring");
			setTimeout(function(){
			  dl.addClass("layui-anim-scaleSpring");
			}); 
	    } else {
	        //如果没有则在右侧提示文本
	        var tooltip = $("<div>").css({
	            position: "absolute",
	            top: $(this).offset().top,
	            left: 70,
	            background: "rgb(48,49,51)",
	            color: 'white',
	            fontSize: '10px',
	            padding: "5px",
	            borderRadius: "2px",
	            boxShadow: "2px 2px 5px rgba(0, 0, 0, 0.2)",
	            zIndex: 9999
	        }).addClass('tooltip').html(txt);
	
	        var tooltip_arrow = $("<div>").css({
	            position: 'absolute',
	            width: 0,
	            height: 0,
	            borderTop: '5px solid transparent',
	            borderBottom: '5px solid transparent',
	            borderRight: '8px solid rgb(48,49,51)',
	            top: '50%',
	            left: '-8px',
	            transform: 'translateY(-50%)'
	        });
	
	        //添加尖角样式
	        tooltip.append(tooltip_arrow);
	        $("body").append(tooltip);
	        tooltip.hide().fadeIn(200);
	    }
	}).mouseleave(function() {
	    $('.tooltip').fadeOut(200, function() {
	        $(this).remove();
	    });
	})
	
	//鼠标移出 #detailed-menu a 元素时并隐藏子菜单
	$("#detailed-menu a:not(.sidebar-menu .menu)").on("mouseleave", function(event) {
	    // 判断鼠标是否在 .tooltip 加上左边距的范围内
	    if (dl != null && !isMouseInTooltip(event, dl)) {
	        removeFloatMenu();
	    }
	});
	
	$("body").on("mouseleave", ".float-menu", function() {
	    if (dl != null) {
	        removeFloatMenu();
	    }
	});
	
	//首页点击事件
	$("#title-list").on("click", "span:first-child", function() {
	    //触发切换首页事件
		tab.tabChange(1);
	});
	
	//个人资料悬浮
	$("#personal-data").mouseenter(function(){
	    $(this).find('div').stop().slideDown(200);
	}).mouseleave(function(e){
		var div=$(this).find('div');
		
		var Left = div.offset().left;
		var Right = Left + div.outerWidth();
		var Top = div.offset().top-10;
		var Bottom = Top + div.outerHeight();
		
		var mouseX = e.clientX;
	    var mouseY = e.clientY;
		
		// 判断鼠标位置是否在悬浮范围 加上左边距的范围内
		if (mouseX >= Left && mouseX <= Right && mouseY >= Top && mouseY <= Bottom) {
		    
		} else {
		     $(this).find('div').stop().slideUp(200);
		}
	});
	$("#personal-data div").mouseleave(function(e){
		$(this).stop().slideUp(200);
	});
	
	var full_screen_sta="全屏";
	//全屏悬浮提示
	$("#full-screen i").mouseenter(function(){
		var tooltip = $("<div>").css({
		    position: "absolute",
		    top: $(this).offset().top+40,
		    left: $(this).offset().left-3,
		    background: "rgb(48,49,51)",
		    color: 'white',
		    fontSize: '10px',
		    padding: "5px",
		    borderRadius: "2px",
		    boxShadow: "2px 2px 5px rgba(0, 0, 0, 0.2)",
		    zIndex: 9999
		}).addClass('tooltip').html(full_screen_sta);
			
		var tooltip_arrow = $("<div>").css({
		    position: 'absolute',
		    width: 0,
		    height: 0,
		    borderTop: 'none',
		    borderBottom: '8px solid rgb(48,49,51)', // 修改箭头方向为下方
		    borderRight: '5px solid transparent',
		    borderLeft: '5px solid transparent',
		    top: '-8px', // 调整箭头位置
		    left: '50%', // 水平居中
		    transform: 'translateX(-50%)', // 水平居中
		});
			
		//添加尖角样式
		tooltip.append(tooltip_arrow);
		$("body").append(tooltip);
		tooltip.hide().stop().fadeIn(300);
	}).mouseleave(function(){
		$(".tooltip").stop().fadeOut(300)
		setTimeout(function(){
			$(".tooltip").remove();
		},300)
	})
	
	//移除悬浮菜单
	function removeFloatMenu() {
			   dl.css({
			       position: 'static',
			       backgroundColor: 'rgb(31,45,61)',
			       width: 'auto',
				   display:'none'
			   }).removeClass('float-menu layui-anim-scaleSpring layui-anim');
			   				
			   dl.find('.menu').css({
			       paddingLeft: '55px',
			       textAlign: 'left',
			       fontSize: '13px'
			   });
			   
			   dl = null;
	}
	
	// 判断鼠标是否在 悬浮范围 加上左边距的范围内的函数
	function isMouseInTooltip(event, menu) {
	    var Left = menu.offset().left - 10;
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
	
	
	//动态切换标题状态
	function toggleTheTitleStatus(arrs){
		//判断需要触发几次如果是true则会触发两次第一次不进行执行
		if(xx){
			xx=false;
		}else{
			// 查找标题列表元素
			var titleList = $("#title-list").empty().animate({ "margin-left": "10px" }, 100);
			
			for (var i = 0; i < arrs.length; i++) {
				if(arrs[i]!=='首页'){
					 titleList.append("/")
				}
			    var span=$('<span>').text(arrs[i]).appendTo(titleList);
			}
			if(arrs.length!=1){
				titleList.find("span:first").css("color","rgb(0,0,0)")
			}
			titleList.animate({ "margin-left": "0" }, 100);
			$("#loading-line").animate({"width": "100%"}, 300, function() {
			        // 加载完成后执行的回调函数，将线的宽度设为0
			        $(this).css({"width": 0});
			      });
		}
	}
	
	
	
	// 初始化插入首页内容
	function init(){
		$("#main-body .layui-tab-content .layui-tab-item .tab-body").each(function(){
			if($(this).attr('tab-id')=='1'){
				var $this=$(this);
				$.ajax({
				    // url: 'pages/home.html',
					url:"/vivoShop/background/pages/home/home.jsp",
				    method: 'GET',
				    success: function(data) {
						$this.html(data)
					},
				    error: function(xhr, status, error) {
						console.log('请求失败：', error);
				    }
				});
			}
		})
	}
	init();
});

//新增规格
		function addProdcutspecifications(i){
			$.ajax({
				url:"/vivoShop/background/gopages/goAddProductSpecifications",
				success:function(html){
					var index=layer.open({
				   		type:1,
				   		title: '新增规格',
				   		shadeClose: true,
				   		maxmin: true,
				   		area: ['430px', '500px'],
				   		content: html,
					});
					form.render(); // 渲染全部表单
					
					$("#addProductSpecifications").off("submit").on("submit", function(event){
						
						event.preventDefault();
						var formData = $("#addProductSpecifications").serializeArray();
						// 检查所有字段是否都有值
						for (var i = 0; i < formData.length; i++) {												        
							if (formData[i].value === "") {
								layer.msg('内容不能为空!', {icon: 0,time:1000});
								return;
							}
						}
						console.log(formData)
					//新增
					$.ajax({
						
						url:"/vivoShop/background/pages/function/productSpecifications/add",
						data:formData,
						dataType:'text',
						type:'post',
						success:function(txt){
							if(txt=="新增成功"){
								layer.msg('添加成功', {icon: 1});
							}else{
								layer.msg(txt, {icon: 0});
							}
							if(index){
								 layer.close(index);
								 //重新渲染
								 refreshPSAndClearForm();
							}
							if(i=="pav"){
								layer.msg('操作完成请重新打开该页面', {icon: 0,time:1500});
							}
						},error: function(xhr, status, error) {
							//console.log(xhr)
							layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 0});
						}
					})
				});
				},error: function(xhr, status, error) {
					//console.log(xhr)	
					layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 0});
				}
			})
		}
		//退出登录，回到登录界面并删除管理员作用域信息
function escLogin(){
	// 使用Ajax请求删除session中的属性
	$.ajax({
		url: '/vivoShop/deleteSessionAttributes',
		type: 'POST',
		data: {
			keys: ['admin'] // 需要删除的session属性名
		},success: function(response) {
			console.log('作用域删除完成')
		}, error: function(error) {
			 // 删除失败
		}
	});
	window.location.href = 'admin_login.jsp';
}
// 点击图片时显示大图
		function showImage(imgUrl) {
		  layer.photos({
		    photos: {
		      "title": "商品图片", // 相册标题
		      "data": [
		        {
		          "src": imgUrl // 点击的图片地址
		        }
		      ]
		    },
		    shadeClose: true, // 是否点击遮罩关闭
		    closeBtn: 1, // 关闭按钮样式，0无，1有
		    anim: 5 // 动画类型
		  });
		}
		