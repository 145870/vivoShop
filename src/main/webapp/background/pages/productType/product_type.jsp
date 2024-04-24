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
#product-type .layui-table-checked {
	background-color: rgb(244, 244, 255);
}
}
#product-type .layui-laydate .layui-this, .layui-laydate .layui-this>div {
    background-color: rgb(85, 170, 255) !important;
    color: #fff !important;
}
/* 重写 */
#product-type .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

.layui-laydate .layui-this, .layui-laydate .layui-this>div {
     background-color: rgb(85, 170, 255) !important;
    color: #fff !important;
}
/* 重写 */
#product-type .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#product-type-select span {
	width: 80px;
}

/* 重写 */
#product-type-select div:last-child button:hover {
	color: rgb(85, 170, 255);
	background-color: rgb(250, 250, 250);
}

/* 重写表格样式 */
#product-type-body .tabel .layui-laypage .layui-laypage-curr .layui-laypage-em
	{
	background-color: rgb(89, 189, 255);
}

#product-type-body .tabel .layui-table-click, .layui-table-hover,
	.layui-table[lay-even] tbody tr:nth-child(even) {
	background-color: rgb(250, 250, 255);
}

#product-type-body .tabel .layui-form-checked[lay-skin=primary]>i
	{
	border-color: rgb(89, 189, 255) !important;
	background-color: rgb(89, 189, 255);
	color: #fff;
}

#product-type-body {
	padding: 16px;
}

#product-type-body .buttons {
	margin-bottom: 20px;
}
</style>
	<div id="product-type" class="layui-font-14">

		<!-- 查询区域 -->
		<div id='product-type-select'>
			<form class="layui-form"> 
				<div class="layui-row layui-col-space16">
					<div class="layui-col-md5 layui-input-group">
						<span class="layui-input-prefix">类别名称:</span> 
						
						<input name="name" type="text"  placeholder="类别名" class="layui-input">
					</div>

					<div class="layui-col-md3">
						<button style="width: 125px; color: rgb(85, 170, 255);"
							class="layui-btn layui-btn-primary layui-btn-radius">搜索</button>
					</div>
				</div>
			</form>
		</div>
		<hr style="margin-top: 25px;">
		<!-- 显示内容 -->
		<div id="product-type-body">
			<div class="buttons">
				<button onclick="addPType()" class="layui-btn layui-bg-blue">添加类别</button>
				<button onclick="updateCheckPType()" class="layui-btn layui-bg-blue">编辑类别</button>
				<button onclick="delCheckedProductType()" class="layui-btn layui-bg-blue">删除选中类别</button>
				<button onclick="refreshPTAndClearForm()" style="float: right;" class="layui-btn layui-bg-blue">
						<i class="layui-icon layui-icon-refresh" style=""></i>
				</button>
			</div>

			<div class="tabel">
				<table class="layui-hide" id="product-type-body-table">
				</table>
				<script type="text/html" id="product-type-table-operate">
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
		laydate
				.render({
					elem : '#product-select-date',
					range : [ '#product-select-start-date',
							'#product-select-end-date' ]
				});

		//表格渲染
		
		
		function refreshPTAndClearForm() {
	        // 清空表单内容
	        $('#product-type-select input').val('');
	       
	        refreshPTTable();
	    }
		
		var PTinst;
		// 已知数据渲染
		function refreshPTTable(){
			// 销毁当前表格实例
			if(PTinst){
				PTinst.reload({}); // 先清空数据
				PTinst.reload('null'); // 然后销毁表格
			}
			
			PTinst=table.render({
				elem : '#product-type-body-table',
				cols : [ [ //标题栏
				{
					type : 'checkbox',
					fixed : 'left'
				},{
	                field: 'id',
	                title : 'id',
	                fixed : 'left',
					width : 150
	            },{
					field : 'type_name',
					title : '类别名称',
					minWidth : 150
				},{
					fixed : 'right',
					title : '操作',
					width : 134,
					minWidth : 125,
					toolbar : '#product-type-table-operate'
				} ] ],
				url : "/vivoShop/background/pages/function/product_type/selectWhere",
				//skin: 'line', // 表格风格
				//even: true,
				page : true, // 是否显示分页
				limits : [ 5, 10, 15 ],
				limit : 5
			// 每页默认显示的数量
			});
		}
		refreshPTTable();
 
		// 触发单元格工具事件
		table.on('tool(product-type-body-table)',function(obj) { // 双击 toolDouble
							var data = obj.data; // 获得当前行数据
							var index1;
							if (obj.event === 'edit') {
								updatePType(data);
							} else if (obj.event === 'del') {
								delProductType(data);
							}
							
							
						});
		
		$("#product-type-select form").submit(function(event){
			event.preventDefault();

		    // 将表单转换为序列化对象
		    var formData = $(this).serializeArray();
			// 将数组转换为对象
		    var serializedData = formData.reduce(function(obj, item) {
		        obj[item.name] = item.value;
		        return obj;
		    }, {});
			
		    // 重新加载表格数据
		    PTinst.reload({
		        url: '/vivoShop/background/pages/function/product_type/selectWhere',
		        where: serializedData
		    });
		})
		
		
		function addPType(){
			layer.prompt({title: '新增类别'}, function(value, index, elem){
				 if(value === ''){
				    layer.msg('请输入内容',{icon:2}); 
				    return;
				 }
				 layer.close(index);
				 
				 $.ajax({
					 url:"/vivoShop/background/pages/function/product_type/add",
					 type:"post",
					 data:{
						 value : value
					 },
					 dataType:'text',
					 success:function(txt){
						 if(txt=="新增成功"){
							layer.msg('新增成功!', {icon: 1});
						 }else{
							 layer.msg(txt, {icon: 2});
						 }
						 refreshPTTable();
					 },error: function(xhr, status, error) {
							//console.log(xhr)	
							layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 2});
					}
				 	
				 });
			});
		}
		function updateCheckPType(){
			//获取被选中的行的内容
			var datas=table.checkStatus("product-type-body-table");
			if(datas.data.length){
				updatePType(datas.data[0]);
			}else{
				layer.msg('请选中一行!', {icon: 0,time:1300});
			}
		}
		function updatePType(data){
			layer.prompt({title: '修改类别',value:data.type_name}, function(value, index, elem){
				
				 if(value === ''){
				    layer.msg('请输入内容',{icon:2}); 
				    return;
				 }
				 layer.close(index);
				 
				 $.ajax({
					 url:"/vivoShop/background/pages/function/product_type/update",
					 type:"post",
					 data:{
						 id:data.id,
						 value : value
					 },
					 dataType:'text',
					 success:function(txt){
						 if(txt=="修改成功"){
							layer.msg('修改成功!', {icon: 1});
						 }else{
							 layer.msg(txt, {icon: 2});
						 }
						 refreshPTTable();
					 },error: function(xhr, status, error) {
							//console.log(xhr)	
							layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 2});
					}
				 	
				 });
			});

		}
		
		
		//删除选中
		function delCheckedProductType(){
			//获取被选中的行的内容
			var datas=table.checkStatus("product-type-body-table");
			if(datas.data.length){
				layer.confirm('确认删除么?',{icon: 3}, function(index){
					datas.data.forEach(function(row) {
						$.ajax({
					    	 url:"/vivoShop/background/pages/function/product_type/delete",
					    	 data:{id:row.id},
					    	 type:"post",
					    	 success:function(txt){
					    		 if(txt=="1451"){
						    			layer.msg('删除失败,发生外键异常请先删除关联数据', {icon: 2});
						    			return;
						    		}
								refreshPTTable();
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
		function delProductType(data){
			layer.confirm('确认删除么?',{icon: 3}, function(index){
					$.ajax({
				    	 url:"/vivoShop/background/pages/function/product_type/delete",
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
								layer.msg('删除失败', {icon: 0});
							}
							refreshPTTable();
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
