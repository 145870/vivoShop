<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title></title>
	<%--
	<script type="text/javascript" src="/vivoShop/background/lib/layui/layui.js"></script>
	<link href="/vivoShop/background/lib/layui/css/layui.css" rel="stylesheet">
	
	<script type="text/javascript" src="/vivoShop/static/jquery-3.5.1.min.js"></script>
	 --%>
</head>


<body>
	<style type="text/css">
/* 重写 */
#product-img .layui-table-checked {
	background-color: rgb(244, 244, 255);
}
}
#product-img .layui-laydate .layui-this, .layui-laydate .layui-this>div {
    background-color: rgb(85, 170, 255) !important;
    color: #fff !important;
}
/* 重写 */
#product-img .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

.layui-laydate .layui-this, .layui-laydate .layui-this>div {
     background-color: rgb(85, 170, 255) !important;
    color: #fff !important;
}
/* 重写 */
#product-img .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#product-img-select span:not(.no){
	width: 80px;
}

/* 重写 */
#product-img-select div:last-child button:hover {
	color: rgb(85, 170, 255);
	background-color: rgb(250, 250, 250);
}

/* 重写表格样式 */
#product-img-body .tabel .layui-laypage .layui-laypage-curr .layui-laypage-em
	{
	background-color: rgb(89, 189, 255);
}

#product-img-body .tabel .layui-table-click, .layui-table-hover,
	.layui-table[lay-even] tbody tr:nth-child(even) {
	background-color: rgb(250, 250, 255);
}

#product-img-body .tabel .layui-form-checked[lay-skin=primary]>i
	{
	border-color: rgb(89, 189, 255) !important;
	background-color: rgb(89, 189, 255);
	color: #fff;
}

#product-img-body {
	padding: 16px;
}


#product-img-body .buttons {
	margin-bottom: 20px;
}

#product-img{
	margin: 20px;
}
</style>
	<div id="product-img" class="layui-font-14">

		<!-- 查询区域 -->
		<div id='product-img-select'>
			<form class="layui-form layui-col-space20">
			
			<div class="layui-col-md3 layui-input-group">
				<span class="layui-input-prefix">类别:</span> 
				<select name="type">
					<option value="">请选择</option>
					<option value="0">缩略图</option>
					<option value="1">大图</option>
					<option value="2">介绍图</option>
				</select>
			</div>
			
			<div class="layui-col-md6">
						<span>上架时间:</span>
						<div class="layui-inline" id="product-img-select-date">
							<div class="layui-input-inline">
								<input name='startTime' type="text" autocomplete="off"
									id="product-img-select-start-date" class="layui-input"
									placeholder="开始日期">
							</div>
							<span>至</span>
							<div class="layui-input-inline">
								<input name='endTime' type="text" autocomplete="off"
									id="product-img-select-end-date" class="layui-input"
									placeholder="结束日期">
							</div>
						</div>
			</div>

			<div class="layui-col-md3">
				<button style="width: 125px; color: rgb(85, 170, 255);" class="layui-btn layui-btn-primary layui-btn-radius">搜索</button>
			</div>
			</form>
		</div>
		
		
		<hr style="margin-top: 25px;">
		
		
		<!-- 显示内容 -->
		<div id="product-img-body">
			<div class="buttons">
				
				<button onclick="addNewProdcutimg()" class="layui-btn layui-bg-blue">添加图片</button>
				<button onclick="updateCheckProductImg()" class="layui-btn layui-bg-blue">修改图片</button>
				<button onclick="delCheckedProductimg()" class="layui-btn layui-bg-blue">删除选中图片</button>
				
				<!--
				暂时丢弃放入到其他页面
				<button sztyle='margin-left: 20px' onclick="openProduct_Specifications()" class="layui-btn layui-bg-blue">查看该商品所有规格</button>
				-->
				<button onclick="refreshAndClearImgSelectForm()" style="float: right;" class="layui-btn layui-bg-blue">
						<i class="layui-icon layui-icon-refresh" style=""></i>
				</button>
			</div>

			<div class="tabel">
				<table class="layui-hide" id="product-img-body-table">
				</table>
				<!-- 图片 -->
				<script type="text/html" id="product-img-thumbnail">
			  		<img src="{{d.img}}" style="max-height:140px;max-width:240px;cursor: pointer;" onclick="showImage('{{d.img}}')"/>
				</script>
				
				
				<script type="text/html" id="product-img-table-operate">
			  <div class="layui-clear-space">
			    <a class="layui-btn layui-btn-xs layui-bg-blue" lay-event="edit">编辑</a>
			    <a class="layui-btn layui-btn-xs layui-bg-blue" lay-event="del">删除</a>
			  </div>
			</script>
			</div>

		</div>
	</div>
	
	<script>
		// 当表单元素被动态插入时，需主动进行组件渲染才能显示
		form.render(); // 渲染全部表单
		laydate.render({
			elem : '#product-img-select-date',
			range : [ '#product-img-select-start-date',
					'#product-img-select-end-date' ]
		});
		//刷新并清空表单
		function refreshAndClearImgSelectForm(){
			$('#product-img-select input').val('');
			$('#product-img-select select').val('');
			
			refreshImgsTable();
		}
		//该页面的表格
		var imginst;
		// 已知数据渲染
		function refreshImgsTable(){
			// 销毁当前表格实例
			if(imginst){
				imginst.reload({}); // 先清空数据
				imginst.reload('null'); // 然后销毁表格
			}
			
			imginst=table.render({
				elem : '#product-img-body-table',
				lineStyle: 'height: 160px;',
				cols : [[
					{
						type : 'checkbox',
						fixed : 'left'
					},{
		                field: 'id',
		                hide: true // 隐藏列
		            },{
						title : '缩略图',
						field : 'img',
						width : 300,
						toolbar : '#product-img-thumbnail'
		            },{
						field : 'url',
						title : '图片路径',
						width : 200
					}, {
						field : 'type',
						title : '分类',
						width : 100,
						sort: true
					},{
						field : 'create_time',
						title : '创建时间',
						width : 200,
						sort: true
					},{
						fixed : 'right',
						title : '操作',
						width : 134,
						minWidth : 125,
						toolbar : '#product-img-table-operate'
					}
					]],
				url : '/vivoShop/background/pages/function/product_imgs/selAll',
				//skin: 'line', // 表格风格
				//even: true,
				page : true, // 是否显示分页
				limits : [ 5, 10, 15 ],
				limit : 5
			// 每页默认显示的数量
			});
		}
		refreshImgsTable()
		//搜索
		$("#product-img-select form").submit(function(event){
			event.preventDefault();

		    // 将表单转换为序列化对象
		    var formData = $(this).serializeArray();
			// 将数组转换为对象
		    var serializedData = formData.reduce(function(obj, item) {
		        obj[item.name] = item.value;
		        return obj;
		    }, {});
			
		    // 重新加载表格数据
		    imginst.reload({
		        url: '/vivoShop/background/pages/function/product_imgs/selAll',
		        where: serializedData
		    });
		})
		
		//新增图片
		function addNewProdcutimg(){
			$.ajax({
		   		url:'/vivoShop/background/pages/product/function/images/addProductImg.jsp',
		    	success:function(html){
		    		var index=layer.open({
				   		type:1,
				   		title: '新增图片',
				   		shadeClose: true,
				   		maxmin: false,
				   		resize:false,
				   		area: ['444px', '600px'],
				   		content: html,
					});
		    		
		    		form.render();
		    		
		    		$("#addProductImg").off("submit").on("submit", function(event){
		    			  event.preventDefault(); // 阻止表单提交

		    			    // 获取表单数据
		    			    var formData = {
		    			    	url: $("#addProductImg input[name='url']").val(),
		    			        name: $("#addProductImg input[name='name']").val(),
		    			        type: $("#addProductImg select[name='type']").val(),
		    			        suffix: $("#addProductImg input[name='suffix']").val(),
		    			        imageUrl: $('#addProductImg-upload .upload-ok img').attr('src')
		    			    };

		    			 	// 验证表单数据是否为空
		    			    if(formData.type === "" || formData.imageUrl === "") {
		    			    	layer.msg('请填写完整信息！', {icon: 2});
		    			        return;
		    			    }
		    			    
		    			 	// 验证路径是否合法
		    			    var validPathRegex = /^[^\.]+$/; // 正则表达式，表示路径不能包含点号（文件后缀）
		    			    if(!validPathRegex.test(formData.url)&&formData.url!="") {
		    			    	layer.msg("路径不能包含文件后缀！",{icon: 0});
		    			        return;
		    			    }
		    				// 包含非法字符的正则表达式
		    				var invalidCharsRegex = /[`~!@#$%^&*()_\-+=<>?:"{}|,.;'\\[\]·！#￥（——）：；“”‘、，|《。》？、【】[\]]/im;
		    	    		if (invalidCharsRegex.test(formData.url)) {
		    	    			layer.msg("路径包含非法字符！",{icon: 0});
		    	        		return;
		    	   			}
		    	    		
		    				if(!validPathRegex.test(formData.name)&&formData.name!=""){
		    					layer.msg("文件名不能包含文件后缀！",{icon: 0});
		    			        return;
		    				}
		    				
		    				var reg = /[`~!@#$%^&*()_\-+=<>?:"{}|,.\/;'\\[\]·！#￥（——）：；“”‘、，|《。》？、【】[\]]/im;
		    				if(reg.test(formData.name)){
		    					layer.msg("文件名包含非法字符！",{icon: 0});
		    					return;
		    				}
		    			    
		    			    $.ajax({
		    			   		url:'/vivoShop/background/pages/function/product_imgs/add',
		    			   		data:formData,
		    			   		type: 'POST',
								dataType:'text',
		    			   		success:function(txt){
		    			    		if(txt=="新增成功"){
		    			    			layer.msg('新增成功', {icon: 1});
		    			    		}else{
										layer.msg(txt, {icon: 2});
									}
		    			    		if(index){
										 layer.close(index);
										 //重新渲染
										 refreshImgsTable();
									}
		    			    		
		    			    	},error: function(xhr, status, error) {
									//console.log(xhr)
									layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 0});
								}
		    			    	
		    			    })
					});
		    	},error: function(xhr, status, error) {
					//console.log(xhr)	
					layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 2});
				}
			})
		}
		
		//修改图片
		function updateProductImg(data){
			$.ajax({
			    url: '/vivoShop/background/gopages/goEditProductImg',
			    data:{
			    	id:data.id,
			    	type:data.type,
			    	img:data.img,
			    	url:data.url
			    }, 
			    success: function(html) {
			    	var index=layer.open({
				   		type:1,
				   		title: '修改图片',
				   		shadeClose: true,
				   		maxmin: false,
				   		resize:false,
				   		area: ['444px', '600px'],
				   		content: html
					});
			    	
			    	form.render();
			    	$("#EditProductImg").off("submit").on("submit", function(event){
		    			  event.preventDefault(); // 阻止表单提交

		    			    // 获取表单数据
		    			    var formData = {
		    			    	oldurl: $("#EditProductImg input[name='oldurl']").val(),
		    					id: $("#EditProductImg input[name='id']").val(),
		    			    	url: $("#EditProductImg input[name='url']").val(),
		    			        name: $("#EditProductImg input[name='name']").val(),
		    			        type: $("#EditProductImg select[name='type']").val(),
		    			        suffix: $("#EditProductImg input[name='suffix']").val(),
		    			        imageUrl: $('#EditProductImg-upload .upload-ok img').attr('src')
		    			    };

		    			 	// 验证表单数据是否为空
		    			    if(formData.type === "" || formData.imageUrl === "") {
		    			    	layer.msg('请填写完整信息！', {icon: 2});
		    			        return;
		    			    }
		    			    
		    			 	// 验证路径是否合法
		    			    var validPathRegex = /^[^\.]+$/; // 正则表达式，表示路径不能包含点号（文件后缀）
		    			    if(!validPathRegex.test(formData.url)&&formData.url!="") {
		    			    	layer.msg("路径不能包含文件后缀！",{icon: 0});
		    			        return;
		    			    }
		    				// 包含非法字符的正则表达式
		    				var invalidCharsRegex = /[`~!@#$%^&*()_\-+=<>?:"{}|,.;'\\[\]·！#￥（——）：；“”‘、，|《。》？、【】[\]]/im;
		    	    		if (invalidCharsRegex.test(formData.url)) {
		    	    			layer.msg("路径包含非法字符！",{icon: 0});
		    	        		return;
		    	   			}
		    	    		
		    				if(!validPathRegex.test(formData.name)&&formData.name!=""){
		    					layer.msg("文件名不能包含文件后缀！",{icon: 0});
		    			        return;
		    				}
		    				
		    				var reg = /[`~!@#$%^&*()_\-+=<>?:"{}|,.\/;'\\[\]·！#￥（——）：；“”‘、，|《。》？、【】[\]]/im;
		    				if(reg.test(formData.name)){
		    					layer.msg("文件名包含非法字符！",{icon: 0});
		    					return;
		    				}
		    			    
		    			    $.ajax({
		    			   		url:'/vivoShop/background/pages/function/product_imgs/update',
		    			   		data:formData,
		    			   		type: 'POST',
								dataType:'text',
		    			   		success:function(txt){
		    			    		if(txt=="修改成功"){
		    			    			layer.msg('修改成功', {icon: 1});
		    			    		}else{
										layer.msg(txt, {icon: 2});
									}
		    			    		if(index){
										 layer.close(index);
										 //重新渲染
										 refreshImgsTable();
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
			});
		}
		
		//修改选中
		function updateCheckProductImg(){
			//获取被选中的行的内容
			var datas=table.checkStatus("product-img-body-table");
			if(datas.data.length){
				updateProductImg(datas.data[0]);
			}else{
				layer.msg('请选中一行!', {icon: 0,time:1300});
			}
		}
		
		
		//删除图片
		function delProductImg(data){
			layer.confirm('确认删除么?',{icon: 3}, function(index){
				layer.close(index);
					$.ajax({
				    	 url:"/vivoShop/background/pages/function/product_imgs/delete",
				    	 data:{
				    		 id:data.id,
				    		 url:data.url
				    		 },
				    	 type:"post",
				    	 success:function(txt){
							if(txt=="true"){
								layer.msg('删除成功', {icon: 1});
							}else{
								layer.msg('删除失败', {icon: 2});
							}
							refreshImgsTable();
						},error: function(xhr, status, error) {
							//console.log(xhr)	
							layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 2});
						}
				     })
			 });
		}
		
		//删除选中
		function delCheckedProductimg(){
		    var datas=table.checkStatus("product-img-body-table");
		    if(datas.data.length){
		        layer.confirm('确认删除选中么?',{icon: 3}, function(index){
		            layer.close(index);
		            datas.data.forEach(function(row) {
		                $.ajax({
		                     url:"/vivoShop/background/pages/function/product_imgs/delete",
		                     data:{
		                         id:row.id,
		                         url:row.url
		                     },
		                     type:"post",
		                     success:function(txt){
		                            if(txt=="true"){
		                                
		                            }else{
		                                layer.msg('删除失败', {icon: 2});
		                            }
		                            refreshImgsTable();
		                        },error: function(xhr, status, error) {
		                            //console.log(xhr)    
		                            layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 2});
		                        }
		                     });
		            });
		            layer.msg('删除完成', {icon: 1});
		        });
		    }else{
		        layer.msg('请选中一行!', {icon: 0,time:1300});
		    }
		}
	
		
		// 触发单元格工具事件
		table.on('tool(product-img-body-table)',function(obj) { // 双击 toolDouble
			var data = obj.data; // 获得当前行数据
			var index1;
			if (obj.event === 'edit') {
				updateProductImg(data);
			} else if (obj.event === 'del') {
				delProductImg(data);
			}
		});
		
		
		//刷新并清空表单
		function refreshPSAndClearForm(){
			$("#product-specifications-select input").val("");
			
			refreshpImgTable()
		}
		//该页面的表格
		var pImgtable;
		// 已知数据渲染
		function refreshpImgTable(){
			// 销毁当前表格实例
			if(pImgtable){
				pImgtable.reload({}); // 先清空数据
				pImgtable.reload('null'); // 然后销毁表格
			}
			
			var productid = $("#product-specifications-select input[name='id']").val();
			pImgtable=table.render({
				elem : '#product-specifications-body-table',
				cols : [[ //标题栏
					{
						type : 'checkbox',
						fixed : 'left'
					},{
		                field: 'id',
		                hide: true // 隐藏列
		            },{
						field : 'ps_name',
						title : '规格名称',
						width : 200
					}, {
						field : 'ps_val',
						title : '规格值',
						minWidth : 400
					}, {
						fixed : 'right',
						title : '操作',
						width : 134,
						minWidth : 125,
						toolbar : '#product_specifications_operate'
					} ]],
				url : '/vivoShop/background/pages/function/product_specifications/selAll',
				page : true, // 是否显示分页
				limits : [ 5, 10, 15 ],
				limit : 5
			// 每页默认显示的数量
			});
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
		
	
		
	</script>



</body>
</html>
