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
#updateProductSprcifications .layui-form {
	margin: 0 auto;
	width: 345px;
	padding: 20px;
}

#updateProductSprcifications .layui-form-onswitch {
	border-color: rgb(85, 170, 255);
	background-color: rgb(85, 170, 255);
}

#updateProductSprcifications .layui-table-checked {
	background-color: rgb(244, 244, 255);
}

/* 重写 */
#updateProductSprcifications .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

#updateProductSprcifications .layui-laydate .layui-this, .layui-laydate .layui-this>div
	{
	background-color: rgb(85, 170, 255) !important;
}

/* 重写 */
#updateProductSprcifications .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#updateProductSprcifications .layui-input-group>.layui-input-prefix {
	width: 140px;
	text-align: right;
	font-weight: bold;
}

#updateProductSprcifications .layui-input {
	width: 200px;
}

#updateProductSprcifications .layui-input-group {
	margin-bottom: 20px;
}
</style>
	<form class="layui-form" id="updateProductSprcifications" style="margin-top: 30px">
		<input name="pid" value="${pid}" hidden>
		<input name="psid" value="${psid}" hidden>
		<!-- 规格名 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">规格名称:</div>
			<input type="text" value="${psname}" name="name" placeholder="规格名称" class="layui-input right-text">
		</div>
		<!-- 规格值 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">规格值:</div>
			<textarea style="resize: none;width:200px;" name="val" placeholder="规格值" class="layui-textarea right-text">${vals}</textarea>
		</div>
		<div style = "position: absolute;left: 140px;margin-top: -16px;font-size: 11px;color: red;">可重复添加一行一个</div>

		 <button style="margin-top: 30px;position: absolute;right: 60px;" class="layui-btn layui-bg-blue">确认修改</button>
	</form>
</body>

</html>