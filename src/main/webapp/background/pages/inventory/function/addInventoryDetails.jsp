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
#addInventoryDetails .layui-form {
	margin: 0 auto;
	width: 345px;
	padding: 20px;
}

#addInventoryDetails .layui-form-onswitch {
	border-color: rgb(85, 170, 255);
	background-color: rgb(85, 170, 255);
}

#addInventoryDetails .layui-table-checked {
	background-color: rgb(244, 244, 255);
}

/* 重写 */
#addInventoryDetails .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

#addInventoryDetails .layui-laydate .layui-this, .layui-laydate .layui-this>div
	{
	background-color: rgb(85, 170, 255) !important;
}

/* 重写 */
#addInventoryDetails .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#addInventoryDetails .layui-input-group>.layui-input-prefix {
	width: 185px;
	text-align: right;
	font-weight: bold;
}

#addInventoryDetails .layui-input {
	width: 200px;
}

#addInventoryDetails .layui-input-group {
	margin-bottom: 20px;
}
</style>
	<form class="layui-form" id="addInventoryDetails" style="margin-top: 30px">
		<!-- 产品名 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">商品名称:</div>
			<select lay-filter="pname"  name="pname" lay-search="">
     			<option value="">请选择或搜索</option>
			    <c:forEach items="${pList}" var="p">
			    	<option value="${p.id}">${p.informationName}</option>
			    </c:forEach>
  			</select>
		</div>
	
		<!-- 规格值 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">未添加库存的组合:</div>
			<select name="pav" lay-search="">
     			<option value="">请先选择商品</option>
  			</select>
		</div>
		
		<!-- 数量 -->
				<div class="layui-input-group">
					<div class="layui-input-prefix">库存数量:</div> 
					<input type="number" name="count" lay-affix="number" placeholder="数量" class="layui-input right-text" lay-precision="1" min='0'>
				</div>
		
		 <button style="margin-top: 30px;position: absolute;right: 60px;" class="layui-btn layui-bg-blue">确认添加</button>
	</form>
</body>
</html>