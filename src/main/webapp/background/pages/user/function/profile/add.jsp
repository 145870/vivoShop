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
#addUserProfile .layui-form {
	margin: 0 auto;
	width: 345px;
	padding: 20px;
}

#addUserProfile .layui-form-onswitch {
	border-color: rgb(85, 170, 255);
	background-color: rgb(85, 170, 255);
}

#addUserProfile .layui-table-checked {
	background-color: rgb(244, 244, 255);
}

/* 重写 */
#addUserProfile .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

#addUserProfile .layui-laydate .layui-this, .layui-laydate .layui-this>div
	{
	background-color: rgb(85, 170, 255) !important;
}

/* 重写 */
#addUserProfile .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#addUserProfile .layui-input-group>.layui-input-prefix {
	width: 150px;
	text-align: right;
	font-weight: bold;
}

#addUserProfile .layui-input {
	width: 200px;
}

#addUserProfile .layui-input-group {
	margin-bottom: 20px;
}
</style>
	<form class="layui-form" id="addUserProfile" style="margin-top: 30px">
		<!-- 账号 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">账号:</div>
			<input type="text" name="" placeholder="请输入账号(必填)" class="layui-input right-text">
		</div>
		
		<!-- 昵称 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">昵称:</div>
			<input type="text" name="" placeholder="请输入昵称(必填)" class="layui-input right-text">
		</div>
		
		<!-- 手机号 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">手机号:</div>
			<input type="text" name="" placeholder="请输入手机号(必填)" class="layui-input right-text">
		</div>
		
		<!-- 邮箱 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">邮箱:</div>
			<input type="text" name="" placeholder="请输入邮箱(选填)" class="layui-input right-text">
		</div>
	
		<!-- 性别 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">性别:</div>
			<select name="pav" lay-search="">
     			<option value="">请选择</option>
     			<option value="0">男</option>
     			<option value="1">女</option>
  			</select>
		</div>
		
		<!-- 生日 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">上市时间:</div>
			<div class="layui-input-inline">
			 <input type="text" class="layui-input" name='date' id="addUserDate" placeholder="请选择生日(选填)">
     		</div>
		</div>
		
		 <button style="margin-top: 30px;position: absolute;right: 60px;" class="layui-btn layui-bg-blue">确认添加</button>
	</form>
	<script type="text/javascript">
	laydate.render({
	    elem: '#addUserDate'
	});
	</script>
</body>

</html>