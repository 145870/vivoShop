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
#product-specifications .layui-table-checked {
	background-color: rgb(244, 244, 255);
}
}
#product-specifications .layui-laydate .layui-this, .layui-laydate .layui-this>div {
    background-color: rgb(85, 170, 255) !important;
    color: #fff !important;
}
/* 重写 */
#product-specifications .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

.layui-laydate .layui-this, .layui-laydate .layui-this>div {
     background-color: rgb(85, 170, 255) !important;
    color: #fff !important;
}
/* 重写 */
#product-specifications .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#product-specifications-select span:not(.no){
	width: 80px;
}

/* 重写 */
#product-specifications-select div:last-child button:hover {
	color: rgb(85, 170, 255);
	background-color: rgb(250, 250, 250);
}

/* 重写表格样式 */
#product-specifications-body .tabel .layui-laypage .layui-laypage-curr .layui-laypage-em
	{
	background-color: rgb(89, 189, 255);
}

#product-specifications-body .tabel .layui-table-click, .layui-table-hover,
	.layui-table[lay-even] tbody tr:nth-child(even) {
	background-color: rgb(250, 250, 255);
}

#product-specifications-body .tabel .layui-form-checked[lay-skin=primary]>i
	{
	border-color: rgb(89, 189, 255) !important;
	background-color: rgb(89, 189, 255);
	color: #fff;
}

#product-specifications-body {
	padding: 16px;
}


#product-specifications-body .buttons {
	margin-bottom: 20px;
}

#product-specifications{
	margin: 20px;
}
</style>
	<div id="product-specifications" class="layui-font-14">

		<!-- 查询区域 -->
		<div id='product-specifications-select'>
			<form class="layui-form layui-col-space20">
				<!-- 商品名称 -->
				<div class="layui-col-md3 layui-input-group">
					<span style='width:80px;text-align: right;' class="layui-input-prefix">商品名称:</span> 
					<input style="width:200px;" name="pname" type="text" id="product-name" placeholder="商品名称" class="layui-input">
				</div>
				<!-- 规格名称 -->
				<div class="layui-col-md3 layui-input-group">
					<span style='width:80px;text-align: right;' class="layui-input-prefix">规格名称:</span> 
					<input style="width:200px;" name="psname" type="text" id="product-name" placeholder="规格名称" class="layui-input">
				</div>
				

				<div class="layui-col-md3">
					<button style="width: 125px; color: rgb(85, 170, 255);" class="layui-btn layui-btn-primary layui-btn-radius">搜索</button>
				</div>
			</form>
		</div>
		
		
		<hr style="margin-top: 25px;">
		
		
		<!-- 显示内容 -->
		<div id="product-specifications-body">
			<div class="buttons">
				<button onclick="addProdcutspecifications()" class="layui-btn layui-bg-blue">添加规格</button>
				<button onclick="refreshPSAndClearForm()" style="float: right;" class="layui-btn layui-bg-blue">
						<i class="layui-icon layui-icon-refresh" style=""></i>
				</button>
			</div>

			<div class="tabel">
				<table class="layui-hide" id="product-specifications-body-table">
				</table>
				<script type="text/html" id="product_specifications_operate">
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
		
		//刷新并清空表单
		function refreshPSAndClearForm(){
			$("#product-specifications-select input").val("");
			
			refreshPSTable();
		}
		//该页面的表格
		var pstable;
		// 已知数据渲染
		function refreshPSTable(){
			// 销毁当前表格实例
			if(pstable){
				pstable.reload({}); // 先清空数据
				pstable.reload('null'); // 然后销毁表格
			}
			
			var productid = $("#product-specifications-select input[name='id']").val();
			pstable=table.render({
				elem : '#product-specifications-body-table',
				cols : [[ //标题栏
					{
		                field: 'psid',
		                hide: true // 隐藏列
		            },{
		                field: 'pid',
		                hide: true // 隐藏列
		            },{
						field : 'pname',
						title : '商品名称',
						width : 200,
						merge: true
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
				limits : [ 10, 15, 20 ],
				limit : 5,
				done: function(){
			        tableMerge.render(this);
			    }
			// 每页默认显示的数量
			});
		}
		refreshPSTable();
		
	
		
		//修改规格
		function updateProdcutspecifications(data){
			$.ajax({
				url:"/vivoShop/background/gopages/goUpdateProductSpecifications",
				data:{
					pid:data.pid,
					psid:data.psid,
					psname:data.ps_name,
					psvals:data.ps_val
				},
				dataType:'text',
				type:'post',
				success:function(html){
					var index=layer.open({
			        	type:1,
			            title: '编辑规格',
			            shadeClose: true,
			            maxmin: true,
			            area: ['430px', '365px'],
			            content: html,
			            resize: false
			        });
					
					
					 $("#updateProductSprcifications").submit(function(){
						 event.preventDefault();
						 layer.confirm('是否确认修改？', {icon: 3}, function(){
								//确认
								//var formData = $("#editProductpanel").serialize();
								var formData = $("#updateProductSprcifications").serializeArray();
								console.log(formData)

								 // 检查除了name为isnew以外的所有字段是否都有值
							    for (var i = 0; i < formData.length; i++) {												        if (formData[i].name !== "description" && formData[i].value === "") {
							            isValid = false;
										layer.msg('内容不能为空!', {icon: 0,time:1000});
							            return;
							        }
							    }
								 
								//修改
								$.ajax({
									url:"/vivoShop/background/pages/function/productSpecifications/update",
									data:formData,
									dataType:'text',
									type:'post',
									success:function(txt){
										if(txt=="修改成功"){
											layer.msg('修改成功', {icon: 1});
										}else{
											layer.msg(txt, {icon: 0});
										}
										layer.close(index);
										//重新渲染
										refreshPSTable();
									},error: function(xhr, status, error) {
										//console.log(xhr)
										layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 0});
								    }
								})
						        
						        
						 }, function(){
						        //取消
							 if(index1){
								 layer.close(index1);
							 }
						 });
						 
						 
					})
					
				},error: function(xhr, status, error) {
					//console.log(xhr)
					layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 0});
				}
			})
		}
		
		
 
		// 触发单元格工具事件
		table.on('tool(product-specifications-body-table)',function(obj) { // 双击 toolDouble
			var data = obj.data; // 获得当前行数据
			var index1;
			if (obj.event === 'edit') {
				updateProdcutspecifications(data);
			} else if (obj.event === 'del') {
				delProdcutspecifications(data)
			}			
		});
		
		
		//搜索
		$("#product-specifications-select form").submit(function(event){
			event.preventDefault();

		    // 将表单转换为序列化对象
		    var formData = $(this).serializeArray();
			// 将数组转换为对象
		    var serializedData = formData.reduce(function(obj, item) {
		        obj[item.name] = item.value;
		        return obj;
		    }, {});
			
		    // 重新加载表格数据
		    pstable.reload({
		        url: '/vivoShop/background/pages/function/product_specifications/selAll',
		        where: serializedData
		    });
		})
		
		//删除规格
		function delProdcutspecifications(data){
			layer.confirm('确认删除吗?',{icon: 3}, function(index){
			     $.ajax({
			    	 url:"/vivoShop/background/pages/function/product_specifications/delete",
			    	 data:{id:data.psid},
			    	 type:"post",
			    	 success:function(txt){
			    		 if(txt=="1451"){
						    	layer.msg('删除失败,发生外键异常请先删除关联数据', {icon: 2});
						    	return;
						    }
						if(txt=="true"){
							layer.msg('删除成功', {icon: 1});
							refreshPSTable();
						}else{
							layer.msg('删除失败 '+ txt, {icon: 0});
						}
					},error: function(xhr, status, error) {
						//console.log(xhr)	
						layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 0});
					}
			     })
				
			     layer.close(index);
			 });
		}
	</script>



</body>
</html>
