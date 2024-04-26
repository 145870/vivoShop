<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title></title>
<!-- 
		<script type="text/javascript" src="/vivoShop/background/lib/layui/layui.js"></script>
	<link href="/vivoShop/background/lib/layui/css/layui.css" rel="stylesheet">
	 -->
</head>


<body>
	<style type="text/css">
/* 重写 */
#inventory-details .layui-table-checked {
	background-color: rgb(244, 244, 255);
}

}
#inventory-details .layui-laydate .layui-this, .layui-laydate .layui-this>div
	{
	background-color: rgb(85, 170, 255) !important;
	color: #fff !important;
}
/* 重写 */
#inventory-details .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

.layui-laydate .layui-this, .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
	color: #fff !important;
}
/* 重写 */
#inventory-details .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#inventory-details-select span {
	width: 80px;
}

/* 重写 */
#inventory-details-select div:last-child button:hover {
	color: rgb(85, 170, 255);
	background-color: rgb(250, 250, 250);
}

/* 重写表格样式 */
#inventory-details-body .tabel .layui-laypage .layui-laypage-curr .layui-laypage-em
	{
	background-color: rgb(89, 189, 255);
}

#inventory-details-body .tabel .layui-table-click, .layui-table-hover,
	.layui-table[lay-even] tbody tr:nth-child(even) {
	background-color: rgb(250, 250, 255);
}

#inventory-details-body .tabel .layui-form-checked[lay-skin=primary]>i {
	border-color: rgb(89, 189, 255) !important;
	background-color: rgb(89, 189, 255);
	color: #fff;
}

#inventory-details-body {
	padding: 16px;
}

#inventory-details-body .buttons {
	margin-bottom: 20px;
}
</style>
	<div id="inventory-details" class="layui-font-14">

		<!-- 查询区域 -->
		<div id='inventory-details-select'>
			<form class="layui-form" style="padding: 20px; margin-bottom: 50px">
				<div class="layui-col-md3 layui-input-group">
					<span class="layui-input-prefix">产品名称:</span> 
					<input name="name"
						type="text" id="product-name" placeholder="产品名"
						class="layui-input">
				</div>

				<div class="layui-col-md3 layui-input-group">
					<span class="layui-input-prefix">产品类别:</span> <select name='type'>
						<option value="">请选择</option>
						<c:forEach items="${product_type}" var='name'>
							<option value="${name.id}">${name.className}</option>
						</c:forEach>
					</select>

				</div>

				<div class="layui-col-md3">
					<button
						style="width: 125px; color: rgb(85, 170, 255); margin-left: 50px"
						class="layui-btn layui-btn-primary layui-btn-radius">搜索</button>
				</div>
			</form>
		</div>
		<hr style="margin-top: 25px;">
		<!-- 显示内容 -->
		<div id="inventory-details-body">
			<div class="buttons">
				<button onclick="addInventoryDetails()"
					class="layui-btn layui-bg-blue">添加库存信息</button>

				<button onclick="refreshIDAndClearForm()" style="float: right;"
					class="layui-btn layui-bg-blue">
					<i class="layui-icon layui-icon-refresh" style=""></i>
				</button>
			</div>

			<div class="tabel">
				<table class="layui-hide" id="inventory-details-body-table">
				</table>


				<script type="text/html" id="inventory-details-table-operate">
			  		<div class="layui-clear-space">
			   			<a class="layui-btn layui-btn-xs layui-bg-blue" lay-event="edit">编辑</a>
			    		<a class="layui-btn layui-btn-xs layui-bg-blue" lay-event="more">
			     	 	更多 
			      		<i class="layui-icon layui-icon-down"></i>
			   			 </a>
					</div>
				</script>
			</div>

		</div>
	</div>
	<script>

		// 当表单元素被动态插入时，需主动进行组件渲染才能显示
		form.render(); // 渲染全部表单
		
		//搜索
		$("#inventory-details-select form").submit(function(){
			event.preventDefault();

		    // 将表单转换为序列化对象
		    var formData = $(this).serializeArray();
			// 将数组转换为对象
		    var serializedData = formData.reduce(function(obj, item) {
		        obj[item.name] = item.value;
		        return obj;
		    }, {});
		    // 重新加载表格数据
		    IDinst.reload({
		        url: '/vivoShop/background/pages/function/inventory_details/selWhere',
		        where: serializedData
		    });
		});
		

		//刷新并清空表单
		function refreshIDAndClearForm(){
			$("#inventory-details-select input").val("");
			$("#inventory-details-select select").val("");
			refreshIDTable();
		}
		var IDinst;
		// 已知数据渲染
		function refreshIDTable(){
			// 销毁当前表格实例
			if(IDinst){
				IDinst.reload({}); // 先清空数据
				IDinst.reload('null'); // 然后销毁表格
			}
			
			IDinst=table.render({
				elem : '#inventory-details-body-table',
				cols : [ [ //标题栏
				{
	                field: 'id',
	                hide: true // 隐藏列
	            },{
					field : 'product_name',
					title : '商品名称名',
					width : 150,
					merge: true
				},{
					field : 'attr_vals',
					title : '规格值',
					minWidth : 200
				}, {
					field : 'quantity',
					title : '库存数量',
					width : 160,
					sort: true
				},{
					fixed : 'right',
					title : '操作',
					width : 134,
					minWidth : 125,
					toolbar : '#inventory-details-table-operate'
				}] ],
				url : "pages/function/inventory_details/selWhere",
				//skin: 'line', // 表格风格
				//even: true,
				page : true, // 是否显示分页
				limits : [ 5, 10, 15 ],
				limit : 5,
				done: function(){
			        tableMerge.render(this)
			    }
			// 每页默认显示的数量
			});
		}
		refreshIDTable();
		
		
		
		//添加库存
		function addInventoryDetails(){
			$.ajax({
				url:"/vivoShop/background/gopages/goAddInventoryDetails",
				success:function(html){
					var index=layer.open({
				   		type:1,
				   		title: '新增库存',
				   		shadeClose: true,
				   		maxmin: true,
				   		area: ['470px', '350px'],
				   		content: html,
				   		resize: false
					});
					
					form.render();
					// select 事件
					form.on('select(pname)', function(data){
						var elem = data.elem; // 获得 select 原始 DOM 对象
						var value = data.value; // 获得被选中的值
					    var othis = data.othis; // 获得 select 元素被替换后的 jQuery 对象
					    
					    var selecte = $('#addInventoryDetails select[name="pav"]').empty();;
					    if(value===''){
					    	selecte.append('<option value="">请先选择商品</option>');
					    	// 重新渲染指定的<select>元素
					    	form.render('select');
					    	return;
					    }
					    //获取到指定商品id的商品搭配
					    $.ajax({
					    	url:"/vivoShop/background/pages/function/inventory_details/getpav",
					    	type:"post",
					    	data:{pid:value},
					    	dataType:"json",
					   		success:function(data){
					   			if (data && Object.keys(data).length > 0) {
					   				selecte.append('<option value="">请选择或搜索</option>');
						   			for(var key in data){	
						   				selecte.append('<option value="'+key+'">'+data[key]+'</option>');
						   			}
					   			} else {
					   				selecte.append('<option value="">没有待添加的组合</option>');
					   			}
					   			// 重新渲染指定的<select>元素
						    	form.render('select');
					   		},error: function(xhr, status, error) {
								//console.log(xhr)	
								layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 0});
							}
					    });
					    
					});
					 
					//确认添加事件
					$("#addInventoryDetails").off("submit").on("submit", function(event){
						event.preventDefault(); // 阻止表单默认提交行为
						var formData = $(this).serializeArray(); // 获取表单数据
						for (var i = 0; i < formData.length; i++) {
							if (formData[i].value === "") {
						    	layer.msg('内容不能为空!', {icon: 0, time: 1000});
						        return false; // 返回 false 阻止表单提交
						    }
						}
						    
						//新增
						$.ajax({
							url:"/vivoShop/background/pages/function/inventory_details/add",
							data:formData,
							dataType:'text',
							type:'get',
							success:function(txt){
								if(txt=="true"){
									layer.msg('添加成功', {icon: 1});
								}else{
									layer.msg('添加失败 '+ txt, {icon: 0});
								}
								if(index){
									layer.close(index);
									//重新渲染
									refreshIDTable();
								}
							},error: function(xhr, status, error) {
									//console.log(xhr)
									layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 0});
							}
						});
					});
				}
			});		  
		}
		
		
		table.on('tool(inventory-details-body-table)',function(obj) { // 双击 toolDouble
			var data = obj.data; // 获得当前行数据
			var index1;
			if (obj.event === 'edit') {
				updateIPCount(data);
			} else if (obj.event === 'more') {
				// 更多 - 下拉菜单
				dropdown.render({
							elem : this, // 触发事件的 DOM 对象
							show : true, // 外部事件触发即显示
							data : [ {
								title : '入库',
								id : 'enter'
							}, {
								title : '出库',
								id : 'goOut'
							}, {
								title : '删除',
								id : 'del'
							} ],
							click : function(menudata) {
								 if(menudata.id === 'enter'){
									 //入库
									 layer.prompt({title: '入库'}, function(value, index, elem){
											
										 if(value === ''){
										    layer.msg('请输入内容',{icon:2}); 
										    return;
										 }
										 const numValue = Number(value);
										    // 检查是否是整数
										    if (!Number.isInteger(numValue)) {
										        layer.msg('请输入整数',{icon:2});
										        return false;
										    }

										    // 检查是否大于 0
										    if (numValue <= 0) {
										        layer.msg('请输入大于0的数字',{icon:2});
										        return false;
										    }
										 
										 layer.close(index);
										 
										 $.ajax({
											 url:"/vivoShop/background/pages/function/inventory_details/enter",
											 type:"post",
											 data:{
												 id:data.id,
												 count:value
											 },
											 dataType:'text',
											 success:function(txt){
												 if(txt=="true"){
													layer.msg('入库成功!', {icon: 1});
												 }else{
													 layer.msg('入库失败! '+ txt, {icon: 2});
												 }
												 refreshIDTable();
											 },error: function(xhr, status, error) {
													//console.log(xhr)	
													layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 2});
											}
										 	
										 });
									});
								 } else if(menudata.id === 'goOut'){
									 //出库
									 layer.prompt({title: '出库'}, function(value, index, elem){
											
										 if(value === ''){
										    layer.msg('请输入内容',{icon:2}); 
										    return;
										 }
										 const numValue = Number(value);
										    // 检查是否是整数
										    if (!Number.isInteger(numValue)) {
										        layer.msg('请输入整数',{icon:2});
										        return false;
										    }

										    // 检查是否大于 0
										    if (numValue <= 0) {
										        layer.msg('请输入大于0的数字',{icon:2});
										        return false;
										    }
										 
										 layer.close(index);
										 
										 $.ajax({
											 url:"/vivoShop/background/pages/function/inventory_details/goOut",
											 type:"post",
											 data:{
												 id:data.id,
												 count:value
											 },
											 dataType:'text',
											 success:function(txt){
												 if(txt=="true"){
													layer.msg('出库成功!', {icon: 1});
												 }else if(txt=="false"){
													 layer.msg('出库失败! '+ txt, {icon: 2});
												 }else{
													 layer.msg(txt, {icon: 2});
												 }
												 refreshIDTable();
											 },error: function(xhr, status, error) {
													//console.log(xhr)	
													layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 2});
											}
										 	
										 });
									});
								 } else if(menudata.id === 'del'){
									 deleteInventoryDetails(data);
								 }
							},
							align : 'right', // 右对齐弹出
							style : 'box-shadow: 1px 1px 10px rgb(0 0 0 / 12%);' // 设置额外样式
						})
				
			}
			
			
		});
		
		//修改数量
		function updateIPCount(data){
			layer.prompt({title: '修改数量',value:data.quantity}, function(value, index, elem){
				
				 if(value === ''){
				    layer.msg('请输入内容',{icon:2}); 
				    return;
				 }
				 const numValue = Number(value);
				    // 检查是否是整数
				    if (!Number.isInteger(numValue)) {
				        layer.msg('请输入整数',{icon:2});
				        return false;
				    }

				    // 检查是否大于 0
				    if (numValue <= 0) {
				        layer.msg('请输入大于0的数字',{icon:2});
				        return false;
				    }
				 
				 layer.close(index);
				 
				 $.ajax({
					 url:"/vivoShop/background/pages/function/inventory_details/update",
					 type:"post",
					 data:{
						 id:data.id,
						 count : value
					 },
					 dataType:'text',
					 success:function(txt){
						 if(txt=="true"){
							layer.msg('修改成功!', {icon: 1});
						 }else{
							 layer.msg('修改失败! '+ txt, {icon: 2});
						 }
						 refreshIDTable();
					 },error: function(xhr, status, error) {
							//console.log(xhr)	
							layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 2});
					}
				 	
				 });
			});

		}
		
		
		//删除
		function deleteInventoryDetails(data){
			layer.confirm('确认删除么?',{icon: 3}, function(index){
					$.ajax({
				    	 url:"/vivoShop/background/pages/function/inventory_details/delete",
				    	 data:{id:data.id},
				    	 type:"post",
				    	 success:function(txt){
				    		if(txt=="1451"){
						    	layer.msg('删除失败,发生外键异常请先删除关联数据', {icon: 2});
						    	return;
						    }
							if(txt=="true"){
								layer.msg('删除成功', {icon: 1});
							}else{
								layer.msg('删除失败 '+txt, {icon: 0});
							}
							refreshIDTable();
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
