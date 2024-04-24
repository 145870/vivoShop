<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
#user-profile .layui-table-checked {
	background-color: rgb(244, 244, 255);
}
#user-profile .layui-laydate .layui-this, .layui-laydate .layui-this>div {
    background-color: rgb(85, 170, 255) !important;
    color: #fff !important;
}
/* 重写 */
#user-profile .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

.layui-laydate .layui-this, .layui-laydate .layui-this>div {
     background-color: rgb(85, 170, 255) !important;
    color: #fff !important;
}
/* 重写 */
#user-profile .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#user-profile-select span {
	width: 80px;
}

/* 重写 */
#user-profile-select div:last-child button:hover {
	color: rgb(85, 170, 255);
	background-color: rgb(250, 250, 250);
}

/* 重写表格样式 */
#user-profile-body .tabel .layui-laypage .layui-laypage-curr .layui-laypage-em
	{
	background-color: rgb(89, 189, 255);
}

#user-profile-body .tabel .layui-table-click, .layui-table-hover,
	.layui-table[lay-even] tbody tr:nth-child(even) {
	background-color: rgb(250, 250, 255);
}

#user-profile-body .tabel .layui-form-checked[lay-skin=primary]>i
	{
	border-color: rgb(89, 189, 255) !important;
	background-color: rgb(89, 189, 255);
	color: #fff;
}

#user-profile-body {
	padding: 16px;
}

#user-profile-body .buttons {
	margin-bottom: 20px;
}
</style>
	<div id="user-profile" class="layui-font-14">

		<!-- 查询区域 -->
		<div id='user-profile-select'>
			<form class="layui-form">
				<div class="layui-row layui-col-space16">
					<!-- 账号 -->
					<div class="layui-col-md3 layui-input-group">
						<span class="layui-input-prefix">用户账号:</span> 
						<input name="account" type="text" id="product-name" placeholder="请输入账号" class="layui-input">
					</div>
					
					<!-- 昵称 -->
					<div class="layui-col-md3 layui-input-group">
						<span class="layui-input-prefix">用户昵称:</span> 
						<input name="name" type="text" id="product-name" placeholder="请输入昵称" class="layui-input">
					</div>
					
					<!-- 手机号 -->
					<div class="layui-col-md3 layui-input-group">
						<span class="layui-input-prefix">手机号:</span> 
						<input name="phone" type="text" id="product-name" placeholder="请输入手机号" class="layui-input">
					</div>
					
					<!-- 邮箱 -->
					<div class="layui-col-md3 layui-input-group">
						<span class="layui-input-prefix">用户邮箱:</span> 
						<input name="email" type="text" id="product-name" placeholder="请输入邮箱" class="layui-input">
					</div>

					
				<div class="layui-row layui-col-space16">
				<!-- 注册时间 -->
					<div class="layui-col-md6" id = "user-profile-select-date">
						<div class="layui-col-md6 layui-input-group">
							<span class="layui-input-prefix">注册时间:</span>
							<input style="width:240px" name='startTime' type="text" autocomplete="off" id="user-profile-select-start-date" class="layui-input" placeholder="开始日期">
						</div>
						
						<div class="layui-col-md6 layui-input-group">
							<span style="width:30px" class="layui-input-prefix">至</span>
							<input style="width:240px" name='endTime' type="text" autocomplete="off" id="user-profile-select-end-date" class="layui-input" placeholder="结束日期">
						</div>
					</div>
					
					
					<div class="layui-col-md3">
						<button style="width: 180px; color: rgb(85, 170, 255);"class="layui-btn layui-btn-primary layui-btn-radius">
						搜索
						</button>
					</div>
				</div>
				</div>
			</form>
		</div>
		<hr style="margin-top: 25px;">
		<!-- 显示内容 -->
		<div id="user-profile-body">
			<div class="buttons">
				<button onclick="addUserProfile()" class="layui-btn layui-bg-blue">新增用户</button>
				<button onclick="" class="layui-btn layui-bg-blue">修改用户资料</button>
				<button onclick="" class="layui-btn layui-bg-blue">删除用户信息</button>
				<button onclick="refreshAndClearUserProfileSelectForm()" style="float: right;" class="layui-btn layui-bg-blue">
						<i class="layui-icon layui-icon-refresh" style=""></i>
				</button>
			</div>

			<div class="tabel">
				<table class="layui-hide" id="user-profile-body-table">
				</table>
				
				<!-- 图片 -->
				<script type="text/html" id="user-head-img-thumbnail">
			  		<img src="{{d.img}}" style="max-height:60px;max-width:60px;cursor: pointer;" onclick="showImage('{{d.img}}')"/>
				</script>
				
				
				<script type="text/html" id="user-profile-table-operate">
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
		laydate
				.render({
					elem : '#user-profile-select-date',
					range : [ '#user-profile-select-start-date',
							'#user-profile-select-end-date' ],
							type:'datetime'
				});
		
		//刷新并清空表单
		function refreshAndClearUserProfileSelectForm(){
			$('#user-profile-select input').val('');
			
			refreshUPTable();
		}
		var UPinst;
		// 已知数据渲染
		function refreshUPTable(){
			// 销毁当前表格实例
			if(UPinst){
				UPinst.reload({}); // 先清空数据
				UPinst.reload('null'); // 然后销毁表格
			}
			
			UPinst=table.render({
				elem : '#user-profile-body-table',
				lineStyle: 'height: 90px;',
				cols : [ [ //标题栏
				{
					type : 'checkbox',
					fixed : 'left'
				},{
	                field: 'id',
	                title:'ID',
	               	width:50,
	               	fixed : 'left',
	               	sort: true
	            },{
					field : 'account_number',
					title : '账号',
					width : 120
				}, {
					field : 'user_name',
					title : '昵称',
					minWidth : 100
				},{
					title : '头像',
					field : 'img',
					width : 90,
					toolbar : '#user-head-img-thumbnail'
	            },{
					field : 'phone',
					title : '手机号',
					width : 120,
				}, {
					field : 'mailbox',
					title : '邮箱',
					width : 150
				},  {
					field : 'address',
					title : '地址',
					minWidth : 150
				},{
					field : 'sex',
					title : '性别',
					width : 80,
					sort: true
				}, {
					field : 'birthday',
					title : '生日',
					width : 120,
					sort: true
				},{
					field : 'create_time',
					title : '创建时间',
					width : 200,
					sort: true
				},  {
					fixed : 'right',
					title : '操作',
					width : 134,
					minWidth : 125,
					toolbar : '#user-profile-table-operate'
				} ] ],
				url : "/vivoShop/background/pages/function/user_profile/selAll",
				//skin: 'line', // 表格风格
				//even: true,
				page : true, // 是否显示分页
				limits : [ 5, 10, 15 ],
				limit : 5
			// 每页默认显示的数量
			});
		}      
		refreshUPTable();
		
		//搜索
		$("#user-profile-select form").submit(function(event){
			event.preventDefault();

		    // 将表单转换为序列化对象
		    var formData = $(this).serializeArray();
			// 将数组转换为对象
		    var serializedData = formData.reduce(function(obj, item) {
		        obj[item.name] = item.value;
		        return obj;
		    }, {});
			
		    // 重新加载表格数据
		    UPinst.reload({
		        url: '/vivoShop/background/pages/function/user_profile/selAll',
		        where: serializedData
		    });
		})
		
		// 触发单元格工具事件
		table.on('tool(user-profile-body-table)',function(obj) { // 双击 toolDouble
			var data = obj.data; // 获得当前行数据
			var index1;
			if (obj.event === 'edit') {
				updateProduct(data);
			} else if (obj.event === 'more') {
				// 更多 - 下拉菜单
				dropdown.render({
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
							 //查看详细
						   	openDetaile(data);
						 } else if(menudata.id === 'selImg'){
							 //查看图片
						   	openImgs(data)
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
		
		//新增用户
		function addUserProfile(){
			$.ajax({
		   		url:'/vivoShop/background/pages/user/function/profile/add.jsp',
		    	success:function(html){
		    		imgindex=layer.open({
				   		type:1,
				   		title: '新增用户',
				   		shadeClose: true,
				   		maxmin: false,
				   		resize:false,
				   		area: ['444px', '560px'],
				   		content: html,
					});
		    		form.render();
		    		
		    	},error: function(xhr, status, error) {
					//console.log(xhr)	
					layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 2});
				}
			})
		}
		
		
	</script>



</body>
</html>
