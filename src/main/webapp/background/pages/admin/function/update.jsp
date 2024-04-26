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
#updateAdmin .layui-form {
	margin: 0 auto;
	width: 345px;
	padding: 20px;
}

#updateAdmin .layui-form-onswitch {
	border-color: rgb(85, 170, 255);
	background-color: rgb(85, 170, 255);
}

#updateAdmin .layui-table-checked {
	background-color: rgb(244, 244, 255);
}

/* 重写 */
#updateAdmin .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

#updateAdmin .layui-laydate .layui-this, .layui-laydate .layui-this>div
	{
	background-color: rgb(85, 170, 255) !important;
}

/* 重写 */
#updateAdmin .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#updateAdmin .layui-input-group>.layui-input-prefix {
	width: 150px;
	text-align: right;
	font-weight: bold;
}

#updateAdmin .layui-input {
	width: 200px;
}

#updateAdmin .layui-input-group {
	margin-bottom: 20px;
}
</style>
	<form class="layui-form" id="updateAdmin" style="margin-top: 30px">
		<input name='id' value='${id}' hidden/>
		<!-- 账号 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">账号:</div>
			<input value='${account}' type="text" name="account" placeholder="请输入账号" class="layui-input right-text" lay-filter="ranAdminAccount" lay-affix="refresh">
		</div>
		
		<!-- 密码 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">密码:</div>
			<input type="password" name="pwd" placeholder="请输入密码" class="layui-input right-text" lay-affix="eye">
		</div>
		
		
		<!-- 昵称 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">昵称:</div>
			<input value='${nickname}' type="text" name="nickname" placeholder="请输入昵称" class="layui-input right-text">
		</div>
		
		<!-- 手机号 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">手机号:</div>
			<input value='${phone}' type="text" name="phone" placeholder="请输入手机号" class="layui-input right-text">
		</div>
		
		<!-- 姓名 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">姓名:</div>
			<input value='${admin_name}' type="text" name="name" placeholder="请输入姓名" class="layui-input right-text">
		</div>
		
		<div class="layui-input-group">
			<div class="layui-input-prefix">权限类别:</div> 
			<select name='type'>
				<option value="">请选择</option>
				<c:forEach items="${admin_type}" var='name'>
    				<option value="${name.id}" <c:if test="${name.id eq typeId}">selected</c:if>>${name.typeName}</option>
				</c:forEach>
			</select>

		</div>
	
		<!-- 性别 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">性别:</div>
			<select name="sex">
     			<option value="" <c:if test="${empty sex}">selected</c:if>>请选择</option>
				<option value="0" <c:if test="${sex eq '0'}">selected</c:if>>男</option>
				<option value="1" <c:if test="${sex eq '1'}">selected</c:if>>女</option>
  			</select>
		</div>
		
		
		 <button style="margin-top: 30px;position: absolute;right: 60px;" class="layui-btn layui-bg-blue">确认修改</button>
	</form>
	<script type="text/javascript">
 		
	</script>
</body>

</html>