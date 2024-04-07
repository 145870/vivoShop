<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<!--     <link href="/vivoShop/background/lib/layui/css/layui.css" rel="stylesheet">
	<script type="text/javascript" src="/vivoShop/background/lib/layui/layui.js"></script> -->


</head>
<body>
<style>
#addProductSpecifications .layui-form {
	margin: 0 auto;
	width: 345px;
	padding: 20px;
}

#addProductSpecifications .layui-form-onswitch {
	border-color: rgb(85, 170, 255);
	background-color: rgb(85, 170, 255);
}

#addProductSpecifications .layui-table-checked {
	background-color: rgb(244, 244, 255);
}

/* 重写 */
#addProductSpecifications .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

#addProductSpecifications .layui-laydate .layui-this, .layui-laydate .layui-this>div
	{
	background-color: rgb(85, 170, 255) !important;
}

/* 重写 */
#addProductSpecifications .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#addProductSpecifications .layui-input-group>.layui-input-prefix {
	width: 140px;
	text-align: right;
	font-weight: bold;
}

#addProductSpecifications .layui-input {
	width: 200px;
}

#addProductSpecifications .layui-input-group {
	margin-bottom: 20px;
}
</style>
	<form class="layui-form" id="addProductSpecifications" style="margin-top: 30px">
		<!-- 规格名 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">规格名称:</div>
			<input type="text" name="name" placeholder="" class="layui-input right-text">
		</div>
		<!-- 规格值 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">规格值:</div>
			<textarea style="resize: none;width:200px;" name="val" placeholder="产品描述" class="layui-textarea right-text"></textarea>
		</div>
		<div style = "position: absolute;left: 140px;margin-top: -16px;font-size: 11px;color: red;">使用逗号(,)进行分割</div>

		 <button style="margin-top: 30px;position: absolute;right: 60px;" class="layui-btn layui-bg-blue">确认添加</button>
	</form>
</body>

</html>