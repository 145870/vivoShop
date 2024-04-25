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
#updateUserProfile .layui-form {
	margin: 0 auto;
	width: 345px;
	pupdateing: 20px;
}

#updateUserProfile .layui-form-onswitch {
	border-color: rgb(85, 170, 255);
	background-color: rgb(85, 170, 255);
}

#updateUserProfile .layui-table-checked {
	background-color: rgb(244, 244, 255);
}

/* 重写 */
#updateUserProfile .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

#updateUserProfile .layui-laydate .layui-this, .layui-laydate .layui-this>div
	{
	background-color: rgb(85, 170, 255) !important;
}

/* 重写 */
#updateUserProfile .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#updateUserProfile .layui-input-group>.layui-input-prefix {
	width: 150px;
	text-align: right;
	font-weight: bold;
}

#updateUserProfile .layui-input {
	width: 200px;
}

#updateUserProfile .layui-input-group {
	margin-bottom: 20px;
}
</style>
	<form class="layui-form" id="updateUserProfile" style="margin-top: 30px">
		<input name='id' value='${id}' hidden>
		
		<!-- 账号 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">账号:</div>
			<input value='${account}' type="text" name="account" placeholder="请输入账号(必填)" class="layui-input right-text">
		</div>
		
		<!-- 密码 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">密码:</div>
			<input type="password" name="pwd" placeholder="请输入密码(必填)" class="layui-input right-text" lay-affix="eye">
		</div>
		
		
		<!-- 昵称 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">昵称:</div>
			<input value='${name}' type="text" name="name" placeholder="请输入昵称(必填)" class="layui-input right-text">
		</div>
		
		<!-- 手机号 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">手机号:</div>
			<input value='${phone}' type="text" name="phone" placeholder="请输入手机号(必填)" class="layui-input right-text">
		</div>
		
		<!-- 邮箱 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">邮箱:</div>
			<input value='${mailbox}' type="text" name="mailbox" placeholder="请输入邮箱(选填)" class="layui-input right-text">
		</div>
	
		<!-- 性别 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">性别:</div>
			<select name="sex" lay-search="">
     			<option value="">请选择</option>
     			<option value="0">男</option>
     			<option value="1">女</option>
  			</select>
		</div>
		
		<!-- 生日 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">生日:</div>
			<div class="layui-input-inline">
			 <input value="${birthday}" type="text" class="layui-input" name='birthday' id="updateUserDate" placeholder="请选择生日(选填)">
     		</div>
		</div>
		
		<!-- 地址 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">地址:</div>
			<div class="layui-input-inline">
			<textarea style="resize: none;width:200px;" name="address" placeholder="地址(选填)" class="layui-textarea right-text">${address}</textarea>
     		</div>
		</div>
		
		 <button style="margin-top: 30px;position: absolute;right: 60px;" class="layui-btn layui-bg-blue">确认添加</button>
	</form>
	<script type="text/javascript">
	laydate.render({
	    elem: '#updateUserDate'
	});
	</script>
</body>
</html>