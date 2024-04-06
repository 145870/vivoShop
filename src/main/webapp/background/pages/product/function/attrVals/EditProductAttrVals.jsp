<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改规格</title>

<!--     <link href="/vivoShop/background/lib/layui/css/layui.css" rel="stylesheet">
	<script type="text/javascript" src="/vivoShop/background/lib/layui/layui.js"></script> -->


</head>
<body>
<style>
#updateProductAttrVals {
    height: 265px;
    width: 345px;
    margin: 0 auto;
    overflow: auto; /* 添加滚动条 */
}
#updateProductAttrVals .layui-form {
	padding: 20px;
}
#updateProductAttrVals span{
	min-width:70px;
	font-weight: bold;
	text-align: right;
}

#updateProductAttrVals div.layui-input-group{
	margin: 20px;
}
#updateProductAttrVals .layui-input{
	width:200px;
}

 #updateProductAttrVals .layui-form-select dl dd.layui-this {
   color: rgb(102, 117, 255);
}

</style>
	<form class="layui-form" id="updateProductAttrVals" style="margin-top: 30px">
		<input name='id' value='${requestScope.id}' hidden>
        		<c:forEach items="${psList}" var="ps" varStatus="loop">
    <div class="layui-input-group">
        <span class="layui-input-prefix">${ps.specificationsName}:</span>
        <select name="spec_${loop.index}">
            <option value="">请选择</option>
            <c:forEach items="${valList[loop.index]}" var="v">
                <c:choose>
                    <c:when test="${v eq spec[loop.index]}"><!-- 判断是否是默认值 -->
                        <option selected>${v}</option><!-- 默认选中 -->
                    </c:when>
                    <c:otherwise>
                        <option>${v}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
    </div>
</c:forEach>
        		
        		<div class="layui-input-group">
					<span class="layui-input-prefix">售价:</span>
   					<input value='${price}' name='price' type="number" min='0' lay-affix="number" placeholder="售价" step="0.1" lay-precision="2" class="layui-input">
				</div>
				
				<button style="margin-top: 30px;position: absolute;right: 75px;" class="layui-btn layui-bg-blue">确认修改</button>
	</form>
</body>
<script type="text/javascript">

	
</script>
</html>