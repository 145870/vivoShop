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
			
			<input name='id' value='${productid}' hidden="">
				
				<div class="layui-col-md6 layui-input-group">
					<span style='width:80px;text-align: right;' class="layui-input-prefix">规格名称:</span> 
					<input style="width:200px;" name="name" type="text" id="product-name" placeholder="规格名称" class="layui-input">
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
				<button onclick="updateProdcutspecifications()" class="layui-btn layui-bg-blue">编辑规格</button>
				<button onclick="delProdcutspecifications()" class="layui-btn layui-bg-blue">删除选中规格</button>
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
		
		refreshPSTable();
 
		// 触发单元格工具事件
		table.on('tool(product-specifications-body-table)',function(obj) { // 双击 toolDouble
			var data = obj.data; // 获得当前行数据
			var index1;
			if (obj.event === 'edit') {
				
			} else if (obj.event === 'del') {
				
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
		    pavtable.reload({
		        url: '/vivoShop/background/pages/function/product_specifications/selAll',
		        where: serializedData
		    });
		})
		
		//新增规格在pav.jsp中
		//修改规格
		function updateProdcutspecifications(){
			
		}
		//删除规格
		function delProdcutspecifications(){
			
		}
	</script>



</body>
</html>
