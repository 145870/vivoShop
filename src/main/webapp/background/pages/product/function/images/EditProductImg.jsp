<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<!--  
	<script src="/vivoShop/static/jquery-3.5.1.min.js"></script>
     <link href="/vivoShop/background/lib/layui/css/layui.css" rel="stylesheet">
	<script type="text/javascript" src="/vivoShop/background/lib/layui/layui.js"></script>
-->

</head>
<body>
<style>
#EditProductImg .layui-form {
	margin: 0 auto;
	width: 345px;
	padding: 20px;
}

#EditProductImg .layui-form-onswitch {
	border-color: rgb(85, 170, 255);
	background-color: rgb(85, 170, 255);
}

#EditProductImg .layui-table-checked {
	background-color: rgb(244, 244, 255);
}

/* 重写 */
#EditProductImg .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

#EditProductImg .layui-laydate .layui-this, .layui-laydate .layui-this>div
	{
	background-color: rgb(85, 170, 255) !important;
}

/* 重写 */
#EditProductImg .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#EditProductImg .layui-input-group>.layui-input-prefix {
	width: 150px;
	text-align: right;
	font-weight: bold;
}

#EditProductImg .layui-input {
	width: 200px;
}

#EditProductImg .layui-input-group {
	margin-bottom: 20px;
}
</style>
	<form class="layui-form" id="EditProductImg" style="margin-top: 30px">
		<input name="oldurl" value = "${oldurl}" hidden/>
		<input name="id" value = "${id}" hidden/>
		<!-- 后缀 -->
		<input name="suffix" value = "${suffix}" hidden/>
		<!--  -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">存储路径:</div>
			<input type="text" value="${url}" name="url" placeholder="images/commodity/" class="layui-input right-text">
		</div>
		
		<div class="layui-input-group">
			<div class="layui-input-prefix">文件名:</div>
			<input type="text" name="name" value="${name}" placeholder="空则随机名称" class="layui-input right-text">
		</div>
		<!-- 分类 -->
		<div class="layui-input-group">
			<span class="layui-input-prefix">类别:</span> 
			<c:choose>
			  <c:when test="${type eq '0'}">
			    <select name="type">
			      <option value="">请选择</option>
			      <option value="0" selected>缩略图</option>
			      <option value="1">大图</option>
			      <option value="2">介绍图</option>
			    </select>
			  </c:when>
			  <c:when test="${type eq '1'}">
			    <select name="type">
			      <option value="">请选择</option>
			      <option value="0">缩略图</option>
			      <option value="1" selected>大图</option>
			      <option value="2">介绍图</option>
			    </select>
			  </c:when>
			  <c:when test="${type eq '2'}">
			    <select name="type">
			      <option value="">请选择</option>
			      <option value="0">缩略图</option>
			      <option value="1">大图</option>
			      <option value="2" selected>介绍图</option>
			    </select>
			  </c:when>
			  <c:otherwise>
			    <select name="type">
			      <option value="" selected>请选择</option>
			      <option value="0">缩略图</option>
			      <option value="1">大图</option>
			      <option value="2">介绍图</option>
			    </select>
			  </c:otherwise>
			</c:choose>
		</div>
		
		<!--  -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">图片上传:</div>
			<div class="layui-upload-drag" id="EditProductImg-upload" style="width:138px;">
  				<div class="upload-no" style="display: none;">
  					<i class="layui-icon layui-icon-upload" style="color:rgb(155,178,255)"></i> 
  					<div style="color:rgb(117,117,117)">点击上传，或将文件拖拽到此处</div>
  				</div>
  				<div class="upload-ok">
    				<img src="${img}" style="max-width: 100%">
    				<hr> 
    				
    				<div style="color:rgb(117,117,117)">
    					已选择文件
    					<br>
    					<span>${filename}</span>
    				</div>
 				</div>
			</div>
		</div>

		 <button style="position: absolute;right: 60px;bottom: 30px" class="layui-btn layui-bg-blue">确认修改</button>
	</form>
</body>
<script type="text/javascript">
var upload = layui.upload;
//渲染上传组件
upload.render({
  elem: '#EditProductImg-upload',
  url: '', // 实际使用时改成您自己的上传接口即可。
  auto:false,
  accept: 'images', // 只允许上传图片文件
  choose: function(obj){
    // 用户选择文件后立即渲染预览
    obj.preview(function(index, file, result){
    	$("#EditProductImg-upload .upload-no").hide()
    	$("#EditProductImg-upload .upload-ok").show();
      	$('#EditProductImg-upload .upload-ok img').attr('src', result); // 显示预览图
      	
      	var fileName = file.name;
        var extension = fileName.split('.').pop();
        
     	// 获取文件名（不包括扩展名）
        var fileNameWithoutExtension = fileName.substring(0, fileName.lastIndexOf('.'));
     	
        $("#EditProductImg input[name='suffix']").val(extension);
        if($("#EditProductImg input[name='name']").val()==""){
        	$("#EditProductImg input[name='name']").val(fileNameWithoutExtension)
        }
        $("#EditProductImg .upload-ok span").html(fileName);
    });

  }
});

	
</script>
</html>