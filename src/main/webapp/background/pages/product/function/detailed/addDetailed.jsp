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
		<input name='id' value='${productid}' hidden>
		<c:choose>
    		<c:when test="${not empty psList}">
        		<c:forEach items="${psList}" var="ps" varStatus="loop">
            		<div class="layui-input-group layui-col-md3">
                		<span class="layui-input-prefix">${ps.specificationsName}:</span>
                		<select name="spec_${loop.index}">
                    		<option value="">请选择</option>
                    		<c:forEach items="${valList[loop.index]}" var="v">
                        		<option>${v}</option>
                   			</c:forEach>
                		</select>
            		</div>
        		</c:forEach>
        		
        		<div class="layui-input-group layui-col-md6">
					<span class="layui-input-prefix">售价:</span>
   					<input name='price' type="number" min='0' lay-affix="number" placeholder="售价" step="0.1" lay-precision="2" class="layui-input">
				</div>
				
				<button style="margin-top: 30px;position: absolute;right: 60px;" class="layui-btn layui-bg-blue">确认添加</button>
    		</c:when>
    		<c:otherwise>
        		<div>psList为空时显示的内容</div>
    		 </c:otherwise>
		</c:choose> 
	</form>
</body>
<script type="text/javascript">

	
</script>
</html>