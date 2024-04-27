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
#orders .layui-table-checked {
	background-color: rgb(244, 244, 255);
}

#orders .layui-laydate .layui-this, .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
	color: #fff !important;
}
/* 重写 */
#orders .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

.layui-laydate .layui-this, .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
	color: #fff !important;
}
/* 重写 */
#orders .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#orders-select span {
	width: 100px;
	text-align: right;
}

/* 重写 */
#orders-select div:last-child button:hover {
	color: rgb(85, 170, 255);
	background-color: rgb(250, 250, 250);
}

/* 重写表格样式 */
#orders-body .tabel .layui-laypage .layui-laypage-curr .layui-laypage-em
	{
	background-color: rgb(89, 189, 255);
}

#orders-body .tabel .layui-table-click, .layui-table-hover, .layui-table[lay-even] tbody tr:nth-child(even)
	{
	background-color: rgb(250, 250, 255);
}

#orders-body .tabel .layui-form-checked[lay-skin=primary]>i {
	border-color: rgb(89, 189, 255) !important;
	background-color: rgb(89, 189, 255);
	color: #fff;
}

#orders-body {
	padding: 16px;
}

#orders-body .buttons {
	margin-bottom: 20px;
}
</style>
	<div id="orders" class="layui-font-14">

		<!-- 查询区域 -->
		<div id='orders-select'>
			<form class="layui-form">
				<div class="layui-row layui-col-space16">
					<!-- id -->
					<div class="layui-col-md3 layui-input-group">
						<span class="layui-input-prefix">单号:</span> <input name="id"
							type="text" placeholder="请输入单号" class="layui-input">
					</div>

					<!-- 收件人姓名 -->
					<div class="layui-col-md3 layui-input-group">
						<span class="layui-input-prefix">收件人姓名:</span> <input name="name"
							type="text" placeholder="请输入姓名" class="layui-input">
					</div>

					<!-- 收件人手机号 -->
					<div class="layui-col-md3 layui-input-group">
						<span style="width:120px" class="layui-input-prefix">收件人手机号:</span> <input name="phone"
							type="text" placeholder="请输入手机号" class="layui-input">
					</div>

					<!-- 订单状态 -->
					<div class="layui-row layui-col-space16">
						<div class="layui-col-md3 layui-input-group">
							<span class="layui-input-prefix">订单状态:</span> 
							<select name='state'>
								<option value="">请选择</option>
								<option value="0">未支付</option>
								<option value="1">未发货</option>
								<option value="2">已发货</option>
								<option value="3">已收货</option>
							</select>
						</div>
						
						<!-- 是否有售后 -->
						<div class="layui-col-md3 layui-input-group">
							<span class="layui-input-prefix">是否售后:</span> 
							<select name='service'>
								<option value="">请选择</option>
								<option value="0">是</option>
								<option value="1">否</option>
							</select>
						</div>
					</div>

					<div class="layui-row layui-col-space16">
						<!-- 创建时间 -->
						<div class="layui-col-md6" id="orders-select-date">
							<div class="layui-col-md6 layui-input-group">
								<span class="layui-input-prefix">创建时间:</span> <input style=""
									name='startTime' type="text" autocomplete="off"
									id="orders-select-start-date" class="layui-input"
									placeholder="开始日期">
							</div>

							<div class="layui-col-md6 layui-input-group">
								<span style="width: 30px" class="layui-input-prefix">至</span> <input
									style="" name='endTime' type="text" autocomplete="off"
									id="orders-select-end-date" class="layui-input"
									placeholder="结束日期">
							</div>
						</div>


						<div class="layui-col-md3">
							<button style="width: 180px; color: rgb(85, 170, 255);"
								class="layui-btn layui-btn-primary layui-btn-radius">
								搜索</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<hr style="margin-top: 25px;">
		<!-- 显示内容 -->
		<div id="orders-body">
			<div class="buttons">
				<button onclick="updateCheckOrders()"class="layui-btn layui-bg-blue">编辑选中订单信息</button>
				<button onclick="deleteCheckOrders()"class="layui-btn layui-bg-blue">删除选中订单</button>
				
				<button onclick="refreshAndClearordersSelectForm()"style="float: right;" class="layui-btn layui-bg-blue">
					<i class="layui-icon layui-icon-refresh" style=""></i>
				</button>
			</div>

			<div class="tabel">
				<table class="layui-hide" id="orders-body-table">
				</table>

				<script type="text/html" id="orders-table-operate">
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
		// 日期范围 - 左右面板独立选择模式
		laydate.render({
			elem : '#orders-select-date',
			range : [ '#orders-select-start-date', '#orders-select-end-date' ],
			type : 'datetime'
		});

		//刷新并清空表单
		function refreshAndClearordersSelectForm() {
			$('#orders-select input').val('');
			$('#orders-select select').val('');

			refreshordersTable();
		}
		var ordersinst;
		// 已知数据渲染
		function refreshordersTable() {
			// 销毁当前表格实例
			if (ordersinst) {
				ordersinst.reload({}); // 先清空数据
				ordersinst.reload('null'); // 然后销毁表格
			}

			ordersinst = table.render({
				elem : '#orders-body-table',
				cols : [
					[ // 第一级标题栏
				     	{ type: 'checkbox', fixed: 'left',rowspan: 2},
				     	{ field: 'id', title: '单号', width: 150, fixed: 'left', sort: true, rowspan: 2 },
				     	{ field: 'address_name', title: '收件人姓名', width: 120, rowspan: 2 },
				     	{ field: 'phone', title: '电话号码', width: 120, rowspan: 2 },
				     	{ title: '地址', colspan: 3 },
				     	{ field: 'address', title: '详细地址', minWidth: 120, rowspan: 2 },
				     	{ field: 'int_orders_status',hide:true,rowspan: 2  },
				     	{ field: 'orders_status', title: '订单状态', width: 120, sort: true,rowspan: 2  },
				     	{ field: 'create_time', title: '下单时间', width: 200, sort: true,rowspan: 2  },
				     	{ field: 'service_id',hide:true,rowspan: 2},
				     	{ field: 'service', title: '是否售后', width: 200, sort: true,rowspan: 2  },
				     	{ fixed: 'right', title: '操作',rowspan: 2,width: 134, minWidth: 125, toolbar: '#orders-table-operate' }
				     	
				 	],
				 	[ // 第二级标题栏
				     	{ field: 'province', title: '省', width: 100 },
				     	{ field: 'city', title: '市', width: 100 },
				     	{ field: 'district', title: '区/县', width: 100 }
				 	]
				],
				url : "/vivoShop/background/pages/function/orders/selAll",
				//skin: 'line', // 表格风格
				//even: true,
				page : true, // 是否显示分页
				limits : [ 5, 10, 15 ],
				limit : 5
			// 每页默认显示的数量
			});
		}
		refreshordersTable();

		//搜索
		$("#orders-select form").submit(function(event) {
			event.preventDefault();

			// 将表单转换为序列化对象
			var formData = $(this).serializeArray();
			// 将数组转换为对象
			var serializedData = formData.reduce(function(obj, item) {
				obj[item.name] = item.value;
				return obj;
			}, {});

			// 重新加载表格数据
			ordersinst.reload({
				url : '/vivoShop/background/pages/function/orders/selAll',
				where : serializedData
			});
		})

		// 触发单元格工具事件
		table.on('tool(orders-body-table)', function(obj) { // 双击 toolDouble
			var data = obj.data; // 获得当前行数据
			var index1;
			if (obj.event === 'edit') {
				updateOrders(data);
			} else if (obj.event === 'more') {
				// 更多 - 下拉菜单
				dropdown
						.render({
							elem : this, // 触发事件的 DOM 对象
							show : true, // 外部事件触发即显示
							data : [ {
								title : '查看详细',
								id : 'sel'
							}, {
								title : '删除',
								id : 'del'
							} ],
							click : function(menudata) {
								 if(menudata.id === 'sel'){
									 //查看详细
								   
								 } else if(menudata.id === 'del'){
									 deleteOrders(data)
								}
							},
							align : 'right', // 右对齐弹出
							style : 'box-shadow: 1px 1px 10px rgb(0 0 0 / 12%);' // 设置额外样式
						})
				deleteorders(data);
			}
		});
		
		
		function updateCheckOrders(){
			//获取被选中的行的内容
			var datas = table.checkStatus("orders-body-table");
			if (datas.data.length) {
				updateOrders(datas.data[0]);
			} else {
				layer.msg('请选中一行!', {
					icon : 0,
					time : 1300
				});
			}
		}
		
		function updateOrders(data){
			$.ajax({
				url : '/vivoShop/background/gopages/goUpdateOrders',
				data : {
					id : data.id,
					address_name:data.address_name,
					phone:data.phone,
					int_orders_status:data.int_orders_status,
					province:data.province,
					address:data.address,
					city:data.city,
					district:data.district
				},success : function(html) {
					var index = layer.open({
						type : 1,
						title : '编辑订单',
						shadeClose : true,
						maxmin : true,
						area : [ '700px', '600px' ],
						content : html,
						resize : false
					});
					form.render();
					$("#updateOrders").off('submit').submit(function() {
						event.preventDefault();
						//确认
						var formData = $("#updateOrders").serializeArray();

						for (var i = 0; i < formData.length; i++) {
							// 检查其他字段是否为空
							if (formData[i].value === "") {
								layer.msg('内容不能为空!',{icon : 0,time : 1000});
								return;
							}
						}
						layer.confirm('是否确认修改？',{icon : 3},function() {
							
							//修改
							$.ajax({
								url : "/vivoShop/background/pages/function/orders/update",
								data : formData,
								dataType : 'text',
								type : 'post',
								success : function(txt) {
									if (txt == "true") {
										layer.msg('修改成功',{icon : 1});
										if (index) {
											layer.close(index);
											//重新渲染
											refreshordersTable();
										}
									} else {
										layer.msg('修改失败,'+ txt,{icon : 2});
									}
								},error : function(xhr,status,error) {
									layer.msg('请求出错，状态码：'+ xhr.status+ '，状态描述：'+ xhr.statusText,{icon : 0});
								}
							})
						},function() {
							//取消
							if (index) {layer.close(index);}
						});
					})
				}
			});
		}
		
		function deleteCheckOrders(){
			//获取被选中的行的内容
			var datas=table.checkStatus("orders-body-table");
			if(datas.data.length){
				layer.confirm('确认删除么?',{icon: 3}, function(index){
					datas.data.forEach(function(row) {
						$.ajax({
					    	 url:"/vivoShop/background/pages/function/orders/delete",
					    	 data:{id:row.id},
					    	 type:"post",
					    	 success:function(txt){
					    		 if(txt=="1451"){
								    	layer.msg('删除失败,发生外键异常请先删除关联数据', {icon: 2});
								    	return;
								    }
									if(txt=="true"){
										
									}else{
										layer.msg('删除失败 '+txt, {icon: 0});
									}
									refreshordersTable();
							},error: function(xhr, status, error) {
								//console.log(xhr)	
								layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 0});
							}
					     })
					});
					layer.msg('删除完成', {icon: 1});
					
					layer.close(index);
				 });
				
			}else{
				layer.msg('请选中一行!', {icon: 0,time:1300});
			}
		}
		
		//删除
		function deleteOrders(data){
			layer.confirm('确认删除么?',{icon: 3}, function(index){
					$.ajax({
				    	 url:"/vivoShop/background/pages/function/orders/delete",
				    	 data:{id:data.id},
				    	 type:"post",
				    	 success:function(txt){
				    		if(txt=="1451"){
						    	layer.msg('删除失败,发生外键异常请先删除关联数据', {icon: 2});
						    	return;
						    }
							if(txt=="true"){
								
							}else{
								layer.msg('删除失败 '+txt, {icon: 0});
							}
							refreshordersTable();
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
