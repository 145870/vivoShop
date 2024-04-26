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
#admin .layui-table-checked {
	background-color: rgb(244, 244, 255);
}

#admin .layui-laydate .layui-this, .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
	color: #fff !important;
}
/* 重写 */
#admin .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

.layui-laydate .layui-this, .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
	color: #fff !important;
}
/* 重写 */
#admin .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#admin-select span {
	width: 80px;
}

/* 重写 */
#admin-select div:last-child button:hover {
	color: rgb(85, 170, 255);
	background-color: rgb(250, 250, 250);
}

/* 重写表格样式 */
#admin-body .tabel .layui-laypage .layui-laypage-curr .layui-laypage-em
	{
	background-color: rgb(89, 189, 255);
}

#admin-body .tabel .layui-table-click, .layui-table-hover, .layui-table[lay-even] tbody tr:nth-child(even)
	{
	background-color: rgb(250, 250, 255);
}

#admin-body .tabel .layui-form-checked[lay-skin=primary]>i {
	border-color: rgb(89, 189, 255) !important;
	background-color: rgb(89, 189, 255);
	color: #fff;
}

#admin-body {
	padding: 16px;
}

#admin-body .buttons {
	margin-bottom: 20px;
}
</style>
	<div id="admin" class="layui-font-14">

		<!-- 查询区域 -->
		<div id='admin-select'>
			<form class="layui-form">
				<div class="layui-row layui-col-space16">
					<!-- 账号 -->
					<div class="layui-col-md3 layui-input-group">
						<span class="layui-input-prefix">账号:</span> <input name="account"
							type="text" placeholder="请输入账号" class="layui-input">
					</div>

					<!-- 姓名 -->
					<div class="layui-col-md3 layui-input-group">
						<span class="layui-input-prefix">姓名:</span> <input name="name"
							type="text" placeholder="请输入姓名" class="layui-input">
					</div>

					<!-- 手机号 -->
					<div class="layui-col-md3 layui-input-group">
						<span class="layui-input-prefix">手机号:</span> <input name="phone"
							type="text" placeholder="请输入手机号" class="layui-input">
					</div>


					<div class="layui-row layui-col-space16">
						<div class="layui-col-md3 layui-input-group">
							<span class="layui-input-prefix">权限类别:</span> <select name='type'>
								<option value="">请选择</option>
								<c:forEach items="${admin_type}" var='name'>
									<option value="${name.id}">${name.typeName}</option>
								</c:forEach>
							</select>

						</div>

						<!-- 性别 -->
						<div class="layui-col-md3 layui-input-group">
							<span class="layui-input-prefix">性别:</span> <select name='sex'>
								<option value="">请选择</option>
								<option value="0">男</option>
								<option value="1">女</option>
							</select>
						</div>
					</div>


					<div class="layui-row layui-col-space16">
						<!-- 创建时间 -->
						<div class="layui-col-md6" id="admin-select-date">
							<div class="layui-col-md6 layui-input-group">
								<span class="layui-input-prefix">创建时间:</span> <input style=""
									name='startTime' type="text" autocomplete="off"
									id="admin-select-start-date" class="layui-input"
									placeholder="开始日期">
							</div>

							<div class="layui-col-md6 layui-input-group">
								<span style="width: 30px" class="layui-input-prefix">至</span> <input
									style="" name='endTime' type="text" autocomplete="off"
									id="admin-select-end-date" class="layui-input"
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
		<div id="admin-body">
			<div class="buttons">
				<button onclick="addAdmin()" class="layui-btn layui-bg-blue">新增管理员</button>
				<button onclick="updateCheckAdmin()"
					class="layui-btn layui-bg-blue">修改管理员资料</button>
				<button onclick="refreshAndClearAdminSelectForm()"
					style="float: right;" class="layui-btn layui-bg-blue">
					<i class="layui-icon layui-icon-refresh" style=""></i>
				</button>
			</div>

			<div class="tabel">
				<table class="layui-hide" id="admin-body-table">
				</table>

				<script type="text/html" id="admin-table-operate">
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
		// 日期范围 - 左右面板独立选择模式
		laydate.render({
			elem : '#admin-select-date',
			range : [ '#admin-select-start-date', '#admin-select-end-date' ],
			type : 'datetime'
		});

		//刷新并清空表单
		function refreshAndClearAdminSelectForm() {
			$('#admin-select input').val('');
			$('#admin-select select').val('');

			refreshAdminTable();
		}
		var Admininst;
		// 已知数据渲染
		function refreshAdminTable() {
			// 销毁当前表格实例
			if (Admininst) {
				Admininst.reload({}); // 先清空数据
				Admininst.reload('null'); // 然后销毁表格
			}

			Admininst = table.render({
				elem : '#admin-body-table',
				cols : [ [ //标题栏
				{
					type : 'checkbox',
					fixed : 'left'
				}, {
					field : 'id',
					title : 'ID',
					width : 50,
					fixed : 'left',
					sort : true
				}, {
					field : 'account',
					title : '账号',
					width : 120
				}, {
					field : 'nickname',
					title : '昵称',
					minWidth : 100
				}, {
					title : '姓名',
					field : 'admin_name',
					width : 90
				}, {
					field : 'phone',
					title : '手机号',
					width : 120,
				}, {
					field : 'sex',
					title : '性别',
					width : 80,
					sort : true
				}, {
					field : 'admin_type_id',
					hide : true
				// 隐藏列
				}, {
					field : 'admin_type',
					title : '权限类别',
					width : 120,
					sort : true
				}, {
					field : 'create_time',
					title : '创建时间',
					width : 200,
					sort : true
				}, {
					fixed : 'right',
					title : '操作',
					width : 134,
					minWidth : 125,
					toolbar : '#admin-table-operate'
				} ] ],
				url : "/vivoShop/background/pages/function/admin/selAll",
				//skin: 'line', // 表格风格
				//even: true,
				page : true, // 是否显示分页
				limits : [ 5, 10, 15 ],
				limit : 5
			// 每页默认显示的数量
			});
		}
		refreshAdminTable();

		//搜索
		$("#admin-select form").submit(function(event) {
			event.preventDefault();

			// 将表单转换为序列化对象
			var formData = $(this).serializeArray();
			// 将数组转换为对象
			var serializedData = formData.reduce(function(obj, item) {
				obj[item.name] = item.value;
				return obj;
			}, {});

			// 重新加载表格数据
			Admininst.reload({
				url : '/vivoShop/background/pages/function/admin/selAll',
				where : serializedData
			});
		})

		// 触发单元格工具事件
		table.on('tool(admin-body-table)', function(obj) { // 双击 toolDouble
			var data = obj.data; // 获得当前行数据
			var index1;
			if (obj.event === 'edit') {
				updateAdmin(data);
			} else if (obj.event === 'del') {
				deleteAdmin(data);
			}
		});

		//新增
		function addAdmin() {
			$.ajax({
				url : '/vivoShop/background/pages/admin/function/add.jsp',
				success : function(html) {
					var index = layer.open({
					type : 1,
					title : '新增',
					shadeClose : true,
					maxmin : false,
					resize : false,
					area : [ '444px', '600px' ],
					content : html,
				});
				form.render();
				$("#addAdmin").off("submit").on("submit",function(event) {
					event.preventDefault();
					var formData = $("#addAdmin").serializeArray();
					// 检查
					for (var i = 0; i < formData.length; i++) {
						// 检查其他字段是否为空
						if (formData[i].value === "") {
							layer.msg('内容不能为空!', {
								icon : 0,
								time : 1000
							});
							return;
						}
					}
					//新增
					$.ajax({
						url : "/vivoShop/background/pages/function/admin/add",
						data : formData,
						dataType : 'text',
						type : 'post',
						success : function(txt) {
							if (txt == "true") {
								layer.msg('添加成功',{icon : 1});
								if (index) {
									layer.close(index);
									//重新渲染
									refreshAdminTable();
								}
							} else {
								layer.msg('添加失败,'+ txt,{icon : 2});
							}
						},
						error:function(xhr,status,error) {
							//console.log(xhr)
							layer.msg('请求出错，状态码：'+ xhr.status+ '，状态描述：'+ xhr.statusText,{icon : 0});
						}
					});
				});
				},error : function(xhr, status, error) {
						//console.log(xhr)	
						layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：'+ xhr.statusText, {icon : 2});
					}
				})
		}

		//修改
		function updateAdmin(data) {
			$.ajax({
				url : '/vivoShop/background/gopages/goUpdateAdmin',
				data : {
					id : data.id,
					account : data.account,
					nickname : data.nickname,
					admin_name : data.admin_name,
					sex : data.sex,
					phone : data.phone,
					typeId : data.admin_type_id
				},success : function(html) {
					var index = layer.open({
						type : 1,
						title : '编辑资料',
						shadeClose : true,
						maxmin : true,
						area : [ '470px', '600px' ],
						content : html,
						resize : false
					});
					form.render();					$("#updateAdmin").off('submit').submit(function() {
						event.preventDefault();
						//确认
						var formData = $("#updateAdmin").serializeArray();

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
								url : "/vivoShop/background/pages/function/admin/update",
								data : formData,
								dataType : 'text',
								type : 'post',
								success : function(txt) {
									if (txt == "true") {
										layer.msg('修改成功',{icon : 1});
										if (index) {
											layer.close(index);
											//重新渲染
											refreshAdminTable();
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

		function updateCheckAdmin() {
			//获取被选中的行的内容
			var datas = table.checkStatus("admin-body-table");
			if (datas.data.length) {
				updateAdmin(datas.data[0]);
			} else {
				layer.msg('请选中一行!', {
					icon : 0,
					time : 1300
				});
			}
		}

		function deleteAdmin(data) {
			layer
					.confirm(
							'确认删除吗?',
							{
								icon : 3
							},
							function(index) {
								layer.close(index);
								$
										.ajax({
											url : "/vivoShop/background/pages/function/admin/delete",
											data : {
												id : data.id
											},
											type : "post",
											success : function(txt) {
												if (txt == "1451") {
													layer
															.msg(
																	'删除失败,发生外键异常请先删除关联数据',
																	{
																		icon : 2
																	});
													return;
												}
												if (txt == "true") {
													layer.msg('删除成功', {
														icon : 1
													});
												} else {
													layer.msg('删除失败 '+txt, {
														icon : 2
													});
												}
												refreshAdminTable();
											},
											error : function(xhr, status, error) {
												//console.log(xhr)	
												layer.msg('请求出错，状态码：'
														+ xhr.status + '，状态描述：'
														+ xhr.statusText, {
													icon : 2
												});
											}
										})
							});
		}


	</script>



</body>
</html>
