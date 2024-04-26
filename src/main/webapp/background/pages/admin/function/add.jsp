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
#addAdmin .layui-form {
	margin: 0 auto;
	width: 345px;
	padding: 20px;
}

#addAdmin .layui-form-onswitch {
	border-color: rgb(85, 170, 255);
	background-color: rgb(85, 170, 255);
}

#addAdmin .layui-table-checked {
	background-color: rgb(244, 244, 255);
}

/* 重写 */
#addAdmin .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

#addAdmin .layui-laydate .layui-this, .layui-laydate .layui-this>div
	{
	background-color: rgb(85, 170, 255) !important;
}

/* 重写 */
#addAdmin .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#addAdmin .layui-input-group>.layui-input-prefix {
	width: 150px;
	text-align: right;
	font-weight: bold;
}

#addAdmin .layui-input {
	width: 200px;
}

#addAdmin .layui-input-group {
	margin-bottom: 20px;
}
</style>
	<form class="layui-form" id="addAdmin" style="margin-top: 30px">
		<!-- 账号 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">账号:</div>
			<input type="text" name="account" placeholder="请输入账号" class="layui-input right-text" lay-filter="ranAdminAccount" lay-affix="refresh">
		</div>
		
		<!-- 密码 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">密码:</div>
			<input type="password" name="pwd" placeholder="请输入密码" class="layui-input right-text" lay-affix="eye">
		</div>
		
		
		<!-- 昵称 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">昵称:</div>
			<input type="text" name="nickname" placeholder="请输入昵称" class="layui-input right-text">
		</div>
		
		<!-- 手机号 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">手机号:</div>
			<input type="text" name="phone" placeholder="请输入手机号" class="layui-input right-text">
		</div>
		
		<!-- 姓名 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">姓名:</div>
			<input type="text" name="name" placeholder="请输入姓名" class="layui-input right-text">
		</div>
		
		<div class="layui-input-group">
			<div class="layui-input-prefix">权限类别:</div> 
			<select name='type'>
				<option value="">请选择</option>
				<c:forEach items="${admin_type}" var='name'>
					<option value="${name.id}">${name.typeName}</option>
				</c:forEach>
			</select>

		</div>
	
		<!-- 性别 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">性别:</div>
			<select name="sex">
     			<option value="">请选择</option>
     			<option value="0">男</option>
     			<option value="1">女</option>
  			</select>
		</div>
		
		
		 <button style="margin-top: 30px;position: absolute;right: 60px;" class="layui-btn layui-bg-blue">确认添加</button>
	</form>
	<script type="text/javascript">

	
	</script>
</body>

</html>