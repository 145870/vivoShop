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
.layui-laydate-footer span[lay-type=date] {
    color: rgb(102, 117, 255);
}
	
/* 重写 */
#inventory-update .layui-table-checked {
	background-color: rgb(244, 244, 255);
}
}
#inventory-update .layui-laydate .layui-this, .layui-laydate .layui-this>div {
    background-color: rgb(85, 170, 255) !important;
    color: #fff !important;
}
/* 重写 */
#inventory-update .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

.layui-laydate .layui-this, .layui-laydate .layui-this>div {
     background-color: rgb(85, 170, 255) !important;
    color: #fff !important;
}
/* 重写 */
#inventory-update .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#inventory-update-select span {
	width: 80px;
}

/* 重写 */
#inventory-update-select div:last-child button:hover {
	color: rgb(85, 170, 255);
	background-color: rgb(250, 250, 250);
}

/* 重写表格样式 */
#inventory-update-body .tabel .layui-laypage .layui-laypage-curr .layui-laypage-em
	{
	background-color: rgb(89, 189, 255);
}

#inventory-update-body .tabel .layui-table-click, .layui-table-hover,
	.layui-table[lay-even] tbody tr:nth-child(even) {
	background-color: rgb(250, 250, 255);
}

#inventory-update-body .tabel .layui-form-checked[lay-skin=primary]>i
	{
	border-color: rgb(89, 189, 255) !important;
	background-color: rgb(89, 189, 255);
	color: #fff;
}

#inventory-update-body {
	padding: 16px;
}

#inventory-update-body .buttons {
	margin-bottom: 20px;
}

</style>
	<div id="inventory-update" class="layui-font-14">

		<!-- 查询区域 -->
		<div id='inventory-update-select'>
			<form class="layui-form">
				<div class="layui-row layui-col-space16">
					<!-- 产品名称 -->
					<div class="layui-col-md3 layui-input-group">
						<span class="layui-input-prefix">产品名称:</span> 
						<input name="name" type="text" id="product-name" placeholder="产品名" class="layui-input">
					</div>

					<!-- 类别 -->
					<div class="layui-col-md3 layui-input-group">
						<span class="layui-input-prefix">类型:</span> 
						<select name="type">
							<option value="">请选择</option>
							<option value="0">入库</option>
							<option value="1">出库</option>
							<option value="2">调整</option>
						</select>
					</div>


					<div class="layui-col-md3 layui-input-group">
						<span class="layui-input-prefix">操作员:</span> 
						<select name='adminID'>
							<option value="">请选择</option>
							<c:forEach items="${admin_list}" var='a'>
							<option value="${a.id}">${a.adminName}</option>
							</c:forEach>
						</select>
					</div>
					
				</div>
				<div class="layui-row layui-col-space16">
				<!-- 时间 -->
				<div class="layui-col-md6" id = "inventory-update-select-date">
					<div class="layui-col-md6 layui-input-group">
						<span class="layui-input-prefix">变动时间:</span>
						<input style="width:240px" name='startTime' type="text" autocomplete="off" id="inventory-update-select-start-date" class="layui-input" placeholder="开始日期">
					</div>
					
					<div class="layui-col-md6 layui-input-group">
						<span style="width:30px" class="layui-input-prefix">至</span>
						<input style="width:240px" name='endTime' type="text" autocomplete="off" id="inventory-update-select-end-date" class="layui-input" placeholder="结束日期">
					</div>
						
				</div>
					
					
					<div class="layui-col-md3">
						<button style="width: 180px; color: rgb(85, 170, 255);"class="layui-btn layui-btn-primary layui-btn-radius">
						搜索
						</button>
					</div>
				</div>
			</form>
		</div>
		<hr style="margin-top: 25px;">
		<!-- 显示内容 -->
		<div id="inventory-update-body">
			<div class="buttons">
				<button onclick="deleteCheckIU()" class="layui-btn layui-bg-blue">删除选中记录</button>
				<button onclick="refreshIUAndClearForm()" style="float: right;" class="layui-btn layui-bg-blue">
						<i class="layui-icon layui-icon-refresh" style=""></i>
				</button>
			</div>

			<div class="tabel">
				<table class="layui-hide" id="inventory-update-body-table">
				</table>
			<script type="text/html" id="inventory-update-table-operate">
			 	<div class="layui-clear-space">
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
		laydate
				.render({
					elem : '#inventory-update-select-date',
					range : [ '#inventory-update-select-start-date',
							'#inventory-update-select-end-date' ],
					type: 'datetime'
				});

		//表格渲染
		function refreshIUAndClearForm() {
	        $('#inventory-update-select input').val('');
	        $('#inventory-update-select select').val('');
	        
	        form.render();
	        refreshIUTable();
	    }
		
		var IUinst;
		// 已知数据渲染
		function refreshIUTable(){
			// 销毁当前表格实例
			if(IUinst){
				IUinst.reload({}); // 先清空数据
				IUinst.reload('null'); // 然后销毁表格
			}
			
			IUinst=table.render({
				elem : '#inventory-update-body-table',
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
					width : 150
				}, {
					field : 'attr_vals',
					title : '搭配值',
					minWidth : 120
				}, {
					field : 'type',
					title : '变动类型',
					width : 120,
					sort: true
				}, {
					field : 'old_quantity',
					title : '修改前数量',
					width : 120,
					sort: true
				}, {
					field : 'new_quantity',
					title : '修改后数量',
					width : 120,
					sort: true
				}, {
					field : 'update_time',
					title : '变动时间',
					width : 200,
					sort: true
				}, {
					field : 'reason',
					title : '原因',
					width : 200,
					
				},{
					field : 'admin_name',
					title : '操作员',
					width : 200,
					sort: true
				}, {
					fixed : 'right',
					title : '操作',
					width : 134,
					minWidth : 125,
					toolbar : '#inventory-update-table-operate'
				} ] ],
				url : "pages/function/inventory_update/selWhere",
				//skin: 'line', // 表格风格
				//even: true,
				page : true, // 是否显示分页
				limits : [ 5, 10, 15 ],
				limit : 5
			// 每页默认显示的数量
			});
		}
		
		refreshIUTable();
	        
		// 触发单元格工具事件
		table.on('tool(inventory-update-body-table)',function(obj) { // 双击 toolDouble
			var data = obj.data; // 获得当前行数据
			var index1;
			if (obj.event === 'del') {
				deleteIUById(data.id);
			}
		});
		
		$("#inventory-update-select form").submit(function(event){
			event.preventDefault();

		    // 将表单转换为序列化对象
		    var formData = $(this).serializeArray();
			// 将数组转换为对象
		    var serializedData = formData.reduce(function(obj, item) {
		        obj[item.name] = item.value;
		        return obj;
		    }, {});
			
		    // 重新加载表格数据
		    IUinst.reload({
		        url: '/vivoShop/background/pages/function/inventory_update/selWhere',
		        where: serializedData
		    });
		})
		
		function deleteCheckIU(){
			var datas=table.checkStatus("inventory-update-body-table");
			if(datas.data.length){
				layer.confirm('确认删除么?',{icon: 3}, function(index){
					datas.data.forEach(function(row) {
						$.ajax({
					    	 url:"/vivoShop/background/pages/function/inventory_update/delete",
					    	 data:{id:row.id},
					    	 type:'post',
					    	 success:function(txt){
					    		 if(txt=="false"){
									layer.msg('删除失败 '+txt, {icon: 2});
								 }
					    		 refreshIUTable();
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
		
		function deleteIUById(id){
			layer.confirm('确认删除吗?',{icon: 3}, function(index){
					$.ajax({
				    	 url:"/vivoShop/background/pages/function/inventory_update/delete",
				    	 data:{id:id},
				    	 type:'post',
				    	 success:function(txt){
				    		 if(txt=="false"){
								layer.msg('删除失败 '+txt, {icon: 2});
							 }else{
								 layer.msg('删除成功', {icon: 1});
							 }
				    		 
				    		 refreshIUTable();
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
