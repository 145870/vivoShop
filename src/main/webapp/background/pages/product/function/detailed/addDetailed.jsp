<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加规格</title>

<!--     <link href="/vivoShop/background/lib/layui/css/layui.css" rel="stylesheet">
	<script type="text/javascript" src="/vivoShop/background/lib/layui/layui.js"></script> -->


</head>
<body>
<style>
#addNewProduct .layui-form {
	margin: 0 auto;
	width: 345px;
	padding: 20px;
}

#addNewProduct .layui-form-onswitch {
	border-color: rgb(85, 170, 255);
	background-color: rgb(85, 170, 255);
}

#addNewProduct .layui-table-checked {
	background-color: rgb(244, 244, 255);
}

/* 重写 */
#addNewProduct .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

#addNewProduct .layui-laydate .layui-this, .layui-laydate .layui-this>div
	{
	background-color: rgb(85, 170, 255) !important;
}

/* 重写 */
#addNewProduct .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#addNewProduct .layui-input-group>.layui-input-prefix {
	width: 175px;
	text-align: right;
	font-weight: bold;
}

#addNewProduct .layui-input {
	width: 200px;
}

#addNewProduct .layui-input-group {
	margin-bottom: 20px;
}
</style>
	<form class="layui-form" id="addNewProduct" style="margin-top: 30px">
		<!-- 规格名 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">规格名称:</div>
			<input type="text" name="name" placeholder="" class="layui-input right-text">
		</div>
		
		<!-- 描述 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">产品描述:</div>
			<textarea style="resize: none;width:200px;" name="description" placeholder="产品描述" class="layui-textarea right-text"></textarea>
		</div>

		 <button style="margin-top: 30px;position: absolute;right: 60px;" class="layui-btn layui-bg-blue">确认添加</button>
	</form>
</body>
<script type="text/javascript">

	
</script>
</html>