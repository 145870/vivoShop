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
#addProductAttrVals {
    height: 265px;
    width: 345px;
    margin: 0 auto;
    overflow: auto; /* 添加滚动条 */
}
#addProductAttrVals .layui-form {
	padding: 20px;
}
#addProductAttrVals span{
	min-width:70px;
	font-weight: bold;
	text-align: right;
}

#addProductAttrVals div.layui-input-group{
	margin: 20px;
}
#addProductAttrVals .layui-input{
	width:200px;
}

 #addProductAttrVals .layui-form-select dl dd.layui-this {
   color: rgb(102, 117, 255);
}

</style>
	<form class="layui-form" id="addProductAttrVals" style="margin-top: 30px">
		<input name='id' value='${productid}' hidden>
        		<c:forEach items="${psList}" var="ps" varStatus="loop">
            		<div class="layui-input-group">
                		<span class="layui-input-prefix">${ps.specificationsName}:</span>
                		<select name="spec_${loop.index}">
                    		<option value="">请选择</option>
                    		<c:forEach items="${valList[loop.index]}" var="v">
                        		<option>${v}</option>
                   			</c:forEach>
                		</select>
            		</div>
        		</c:forEach>
        		<!-- 数量 -->
				<div class="layui-input-group">
					<div class="layui-input-prefix">库存数量:</div> 
					<input type="number" name="count" lay-affix="number" placeholder="数量" class="layui-input right-text" lay-precision="1" min='0'>
				</div>
        		
        		<div class="layui-input-group">
					<span class="layui-input-prefix">售价:</span>
   					<input name='price' type="number" min='0' lay-affix="number" placeholder="售价" step="0.1" lay-precision="2" class="layui-input">
				</div>
				
				<button style="margin-top: 30px;position: absolute;right: 75px;" class="layui-btn layui-bg-blue">确认添加</button>
	</form>
</body>
<script type="text/javascript">

	
</script>
</html>