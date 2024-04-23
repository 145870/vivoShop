$.ajax({
	url:'/vivoShop/static/setNavSession',
	type:'post',
	async: false, 
	success:function(data){
		console.log("数据上传完成")
	}
})