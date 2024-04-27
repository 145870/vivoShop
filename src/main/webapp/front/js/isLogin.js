//该文件用于判断是否登录，如果没有跳转到登录页，在登录成功后上床作用域再重新打开该页面

$.ajax({
	url:'/vivoShop/static/setNavSession',
	type:'post',
	success:function(data){
		if(data == "false"){
			return;
		}
		
		//执行新增浏览记录
		var url = window.location.href;
	}
})