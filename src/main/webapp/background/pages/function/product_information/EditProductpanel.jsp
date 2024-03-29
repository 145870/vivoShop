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
#editProductpanel .layui-form {
	margin: 0 auto;
	width: 345px;
	padding: 20px;
}

#editProductpanel .layui-form-onswitch {
	border-color: rgb(85, 170, 255);
	background-color: rgb(85, 170, 255);
}

#editProductpanel .layui-table-checked {
	background-color: rgb(244, 244, 255);
}

/* 重写 */
#editProductpanel .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

#editProductpanel .layui-laydate .layui-this, .layui-laydate .layui-this>div
	{
	background-color: rgb(85, 170, 255) !important;
}

/* 重写 */
#editProductpanel .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#editProductpanel .layui-input-group>.layui-input-prefix {
	width: 175px;
	text-align: right;
	font-weight: bold;
}

#editProductpanel .layui-input {
	width: 200px;
}

#editProductpanel .layui-input-group {
	margin-bottom: 20px;
}
</style>
	<form class="layui-form" id="editProductpanel" style="margin-top: 30px">
		<input name='id' value='${product.id}' hidden>
		<!-- 产品名 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">产品名:</div>
			<input type="text" name="name" placeholder="" class="layui-input right-text"
				value="${product.informationName}">
		</div>
		<!-- 分类 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">分类:</div>
			<select class="layui-input" name="type">
    <option value="">请选择</option>
    <c:forEach items="${product_type}" var="name">
        <c:choose>
            <c:when test="${name.className eq product.className}">
                <option value="${name.id}" selected>${name.className}</option>
            </c:when>
            <c:otherwise>
                <option value="${name.id}">${name.className}</option>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</select>
		</div>
		<!-- 上架状态 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">上架状态:</div>
			<select name="status">
				<option value="">请选择</option>
				<c:choose>
					<c:when test="${product.informationStatus eq 0}">
						<option value="0" selected>已上架</option>
					</c:when>
					<c:otherwise>
						<option value="0">已上架</option>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${product.informationStatus eq 1}">
						<option value="1" selected>未上架</option>
					</c:when>
					<c:otherwise>
						<option value="1">未上架</option>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${product.informationStatus eq 2}">
						<option value="2" selected>已下架</option>
					</c:when>
					<c:otherwise>
						<option value="2">已下架</option>
					</c:otherwise>
				</c:choose>
			</select>
		</div>
		<!-- 是否新品 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">是否新品:</div>
			<input type="checkbox" name="isNew" lay-skin="switch" ${product.isLast == 0 ? 'checked' : ''}>
		</div>
		<!-- 描述 -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">产品描述:</div>
			<textarea style="resize: none;" name="description" placeholder="产品描述" class="layui-textarea right-text">${product.description}</textarea>
		</div>

		 <button style="margin-top: 30px;position: absolute;right: 60px;" class="layui-btn layui-bg-blue">确认修改</button>
	</form>
</body>
<script type="text/javascript">

	
</script>
</html>