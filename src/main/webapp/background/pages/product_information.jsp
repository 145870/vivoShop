<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title></title>
	<script type="text/javascript" src="/vivoShop/background/lib/layui/layui.js"></script>
	<link href="/vivoShop/background/lib/layui/css/layui.css" rel="stylesheet">
</head>


<body>
	<style type="text/css">
/* 重写 */
#product-information .layui-table-checked {
	background-color: rgb(244, 244, 255);
}
}
#product-information .layui-laydate .layui-this, .layui-laydate .layui-this>div {
    background-color: rgb(85, 170, 255) !important;
    color: #fff !important;
}
/* 重写 */
#product-information .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

.layui-laydate .layui-this, .layui-laydate .layui-this>div {
     background-color: rgb(85, 170, 255) !important;
    color: #fff !important;
}
/* 重写 */
#product-information .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#product-information-select span {
	width: 80px;
}

/* 重写 */
#product-information-select div:last-child button:hover {
	color: rgb(85, 170, 255);
	background-color: rgb(250, 250, 250);
}

/* 重写表格样式 */
#product-information-body .tabel .layui-laypage .layui-laypage-curr .layui-laypage-em
	{
	background-color: rgb(89, 189, 255);
}

#product-information-body .tabel .layui-table-click, .layui-table-hover,
	.layui-table[lay-even] tbody tr:nth-child(even) {
	background-color: rgb(250, 250, 255);
}

#product-information-body .tabel .layui-form-checked[lay-skin=primary]>i
	{
	border-color: rgb(89, 189, 255) !important;
	background-color: rgb(89, 189, 255);
	color: #fff;
}

#product-information-body {
	padding: 16px;
}

#product-information-body .buttons {
	margin-bottom: 20px;
}
</style>
	<div id="product-information" class="layui-font-14">

		<!-- 查询区域 -->
		<div id='product-information-select'>
			<form class="layui-form">
				<div class="layui-row layui-col-space16">
					<div class="layui-col-md3 layui-input-group">
						<span class="layui-input-prefix">产品名称:</span> <input type="text"
							id="product-name" placeholder="产品名" class="layui-input">
					</div>

					<div class="layui-col-md3 layui-input-group">
						<span class="layui-input-prefix">是否新品:</span> <select>
							<option value="">请选择</option>
							<option value="0">是</option>
							<option value="1">否</option>
						</select>
					</div>


					<div class="layui-col-md6">
						<span>日期范围:</span>
						<div class="layui-inline" id="product-select-date">
							<div class="layui-input-inline">
								<input type="text" autocomplete="off"
									id="product-select-start-date" class="layui-input"
									placeholder="开始日期">
							</div>
							<span>至</span>
							<div class="layui-input-inline">
								<input type="text" autocomplete="off"
									id="product-select-end-date" class="layui-input"
									placeholder="结束日期">
							</div>
						</div>
					</div>
				</div>
				<div class="layui-row layui-col-space16">
					<div class="layui-col-md3 layui-input-group">
						<span class="layui-input-prefix">产品类别:</span> 
						<select>
							<option value="">请选择</option>
							<c:forEach items="${product_type}" var='name'>
							<option value="${name.id}">${name.className}</option>
							</c:forEach>
						</select>

					</div>

					<div class="layui-col-md3 layui-input-group">
						<span class="layui-input-prefix">上架状态:</span> <select id="appda">
							<option value="">请选择</option>
							<option value="0">已上架</option>
							<option value="1">未上架</option>
							<option value="2">已下架</option>
						</select>
					</div>

					<div class="layui-col-md3">
						<button style="width: 125px; color: rgb(85, 170, 255);"
							type="button"
							class="layui-btn layui-btn-primary layui-btn-radius">搜索</button>
					</div>
				</div>
			</form>
		</div>
		<hr style="margin-top: 25px;">
		<!-- 显示内容 -->
		<div id="product-information-body">
			<div class="buttons">
				<button onclick="addNewProdcut()" class="layui-btn layui-bg-blue">添加新产品</button>
				<button onclick="updateCheckedProdcut()" class="layui-btn layui-bg-blue">编辑单个产品</button>
				<button onclick="delCheckedProdcut()" class="layui-btn layui-bg-blue">删除选中产品</button>
				<button onclick="refreshTable()" class="layui-btn layui-bg-blue">批量上架</button>
				<button onclick="refreshTable()" style="float: right;" class="layui-btn layui-bg-blue">
						<i class="layui-icon layui-icon-refresh" style=""></i>
				</button>
			</div>

			<div class="tabel">
				<table class="layui-hide" id="product-information-body-table">
				</table>
				<script type="text/html" id="barDemo">
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
		var form = layui.form;

		// 当表单元素被动态插入时，需主动进行组件渲染才能显示
		form.render(); // 渲染全部表单

		var laydate = layui.laydate;
		// 日期范围 - 左右面板独立选择模式
		laydate
				.render({
					elem : '#product-select-date',
					range : [ '#product-select-start-date',
							'#product-select-end-date' ]
				});

		//表格渲染
		var table = layui.table;
		var dropdown = layui.dropdown;
		
		var inst;
		// 已知数据渲染
		function refreshTable(){
			// 销毁当前表格实例
			if(inst){
				inst.reload({}); // 先清空数据
				inst.reload('null'); // 然后销毁表格
			}
			
			inst=table.render({
				elem : '#product-information-body-table',
				cols : [ [ //标题栏
				{
					type : 'checkbox',
					fixed : 'left'
				},{
	                field: 'id',
	                hide: true // 隐藏列
	            },{
					field : 'information_name',
					title : '产品名',
					width : 100
				}, {
					field : 'description',
					title : '描述',
					minWidth : 120
				}, {
					field : 'type',
					title : '分类',
					width : 80
				}, {
					field : 'status',
					title : '上架状态',
					width : 100
				}, {
					field : 'is_last',
					title : '是否新品',
					width : 100
				}, {
					field : 'create_time',
					title : '创建时间',
					width : 200
				}, {
					field : 'shelves_time',
					title : '上市时间',
					width : 200
				}, {
					fixed : 'right',
					title : '操作',
					width : 134,
					minWidth : 125,
					toolbar : '#barDemo'
				} ] ],
				url : "pages/function/product_information/selAll",
				//skin: 'line', // 表格风格
				//even: true,
				page : true, // 是否显示分页
				limits : [ 5, 10, 15 ],
				limit : 5
			// 每页默认显示的数量
			});
		}
		refreshTable();
		  var REG_BODY = /<body[^>]*>([\s\S]*)<\/body>/;

	        function getBody(content){
	            var result = REG_BODY.exec(content);
	            if(result && result.length === 2)
	                return result[1];
	            return content;
	        }
		
	        
		// 触发单元格工具事件
		table.on('tool(product-information-body-table)',function(obj) { // 双击 toolDouble
							var data = obj.data; // 获得当前行数据
							var index1;
							if (obj.event === 'edit') {
								updateProduct(data);
							} else if (obj.event === 'more') {
								// 更多 - 下拉菜单
								dropdown
										.render({
											elem : this, // 触发事件的 DOM 对象
											show : true, // 外部事件触发即显示
											data : [ {
												title : '查看详细',
												id : 'selAll'
											}, {
												title : '查看产品图',
												id : 'selImg'
											}, {
												title : '删除该产品',
												id : 'del'
											}, {
												title : '访问商品页',
												id : 'go'
											}, ],
											click : function(menudata) {
												 if(menudata.id === 'selAll'){
												   layer.msg('查看操作，当前行 ID:'+ data.id);
												 } else if(menudata.id === 'selImg'){
												   
												 } else if(menudata.id === 'del'){
													 delProdcut(data)
												}else if(menudata.id === 'go'){
													//跳转
													window.location.href = "/vivoShop/";
												}
											},
											align : 'right', // 右对齐弹出
											style : 'box-shadow: 1px 1px 10px rgb(0 0 0 / 12%);' // 设置额外样式
										})
							}
							
							
						});
		
		//新增产品
		function addNewProdcut(){
			var index;
			$.ajax({
				url:"/vivoShop/background/pages/function/product_information/addNewProduct.jsp",
				data:{},
				success:function(html){
					index=layer.open({
				   		type:1,
				   		title: '新增产品',
				   		shadeClose: true,
				   		maxmin: true,
				   		area: ['470px', '540px'],
				   		content: html,
				   		resize: false
					});
					form.render();
					laydate.render({
					    elem: '#addNewProduct-shelves_time',
					    type: 'datetime',
					    fullPanel: true
					});
					
					$("#addNewProduct").submit(function(){
							event.preventDefault();
							var formData = $("#addNewProduct").serializeArray();
							// 检查除了name为isnew以外的所有字段是否都有值
							for (var i = 0; i < formData.length; i++) {												        if (formData[i].name !== "description" && formData[i].value === "") {
								isValid = false;
								layer.msg('内容不能为空!', {icon: 0,time:1000});
								return;
							}
						}
						//新增
						$.ajax({
							url:"/vivoShop/background/pages/function/product_information/add",
							data:formData,
							dataType:'text',
							type:'get',
							success:function(txt){
								if(txt=="true"){
									layer.msg('添加成功', {icon: 1});
								}else{
									layer.msg('添加失败', {icon: 0});
								}
								if(index){
									 layer.close(index);
									 //重新渲染
									 refreshTable();
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
		//修改商品
		function updateProduct (data){
			$.ajax({
			    url: '/vivoShop/background/gopages/goEditProductpane',
			    data:{
			    	name:data.information_name,
			    	id:data.id,
			    	type:data.type,
			    	status:data.status,
			    	is_last:data.is_last,
			    	description:data.description
			    },
			    success: function(html) {
			    	index1=layer.open({
			        	type:1,
			            title: '编辑' + data.information_name,
			            shadeClose: true,
			            maxmin: true,
			            area: ['470px', '540px'],
			            content: html,
			            resize: false
			        });
			        
			        form.render();
			        
			        $("#editProductpanel").submit(function(){
						 event.preventDefault();
						 layer.confirm('是否确认修改？', {icon: 3}, function(){
								//确认
								//var formData = $("#editProductpanel").serialize();
								var formData = $("#editProductpanel").serializeArray();


								 // 检查除了name为isnew以外的所有字段是否都有值
							    for (var i = 0; i < formData.length; i++) {												        if (formData[i].name !== "description" && formData[i].value === "") {
							            isValid = false;
										layer.msg('内容不能为空!', {icon: 0,time:1000});
							            return;
							        }
							    }
								//修改
								$.ajax({
									url:"/vivoShop/background/pages/function/product_information/update",
									data:formData,
									dataType:'text',
									type:'get',
									success:function(txt){
										if(txt=="true"){
											layer.msg('修改成功', {icon: 1});
										}else{
											layer.msg('修改失败', {icon: 0});
										}
									},error: function(xhr, status, error) {
										//console.log(xhr)
										layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 0});
								    }
								})
						        
						        if(index1){
									 layer.close(index1);
									 //重新渲染
									 refreshTable();
								}
						 }, function(){
						        //取消
							 if(index1){
								 layer.close(index1);
							 }
						 });
						 
						 
					})
			    }
			
			});
		}
		//修改选中商品
		function updateCheckedProdcut(){
			//获取被选中的行的内容
			var datas=table.checkStatus("product-information-body-table");
			if(datas.data.length){
				updateProduct(datas.data[0]);
			}else{
				layer.msg('请选中一行!', {icon: 0,time:1300});
			}
		}
		//删除商品
		function delProdcut(data){
			 layer.confirm('删除 ['+ data.information_name +'] 么?',{icon: 3}, function(index){
			     $.ajax({
			    	 url:"/vivoShop/background/pages/function/product_information/delete",
			    	 data:{id:data.id},
			    	 success:function(txt){
						if(txt=="true"){
							layer.msg('删除成功', {icon: 1});
							refreshTable();
						}else{
							layer.msg('删除失败', {icon: 0});
						}
					},error: function(xhr, status, error) {
						//console.log(xhr)	
						layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 0});
					}
			     })
				
			     layer.close(index);
			 });
		}
		//删除选中商品
		function delCheckedProdcut(){
			//获取被选中的行的内容
			var datas=table.checkStatus("product-information-body-table");
			if(datas.data.length){
				layer.confirm('删除么?',{icon: 3}, function(index){
					datas.data.forEach(function(row) {
						$.ajax({
					    	 url:"/vivoShop/background/pages/function/product_information/delete",
					    	 data:{id:row.id},
					    	 success:function(txt){
								if(txt=="true"){
									
								}else{
									layer.msg('删除失败：'+row.information_name, {icon: 0});
								}
							},error: function(xhr, status, error) {
								//console.log(xhr)	
								layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 0});
							}
					     })
					});
					layer.msg('删除完成', {icon: 1});
					refreshTable();
					layer.close(index);
				 });
				
			}else{
				layer.msg('请选中一行!', {icon: 0,time:1300});
			}
		}
	</script>



</body>
</html>
