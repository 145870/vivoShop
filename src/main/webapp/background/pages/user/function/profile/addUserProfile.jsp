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
</style>
	<form class="layui-form" id="addUserProfile" style="margin-top: 30px">
		<!-- 账号 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">用户账号:</div>
			<input type="text" name="account" placeholder="" class="layui-input right-text">
		</div>
		
		<!-- 昵称 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">:</div>
			<input type="text" name="account" placeholder="" class="layui-input right-text">
		</div>
		<!-- 分类 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">:</div>
			<select class="layui-input" name="type">
    <option value="">请选择</option>
    <c:forEach items="${product_type}" var="name">
          <option value="${name.id}">${name.className}</option>
    </c:forEach>
</select>
		</div>
		<!-- 上市时间 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">上市时间:</div>
			<div class="layui-input-inline">
			 <input type="text" class="layui-input" name='date' id="addNewProduct-shelves_time" placeholder="yyyy-MM-dd HH:mm:ss">
     		</div>
		</div>
		<!-- 是否新品 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">是否新品:</div>
			<input type="checkbox" name="isNew" lay-skin="switch" ${product.isLast == 0 ? 'checked' : ''}>
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