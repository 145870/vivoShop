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

		<!--  -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">存储路径:</div>
			<input type="text" value="${url}" name="url" placeholder="images/commodity/" class="layui-input right-text">
		</div>
		
		<div class="layui-input-group">
			<div class="layui-input-prefix">文件名:</div>
			<input type="text" name="name" value="" placeholder="空则随机名称" class="layui-input right-text">
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
			      <option value="3">轮播图</option>
			    </select>
			  </c:when>
			  <c:when test="${type eq '1'}">
			    <select name="type">
			      <option value="">请选择</option>
			      <option value="0">缩略图</option>
			      <option value="1" selected>大图</option>
			      <option value="2">介绍图</option>
			      <option value="3">轮播图</option>
			    </select>
			  </c:when>
			  <c:when test="${type eq '2'}">
			    <select name="type">
			      <option value="">请选择</option>
			      <option value="0">缩略图</option>
			      <option value="1">大图</option>
			      <option value="2" selected>介绍图</option>
			      <option value="3">轮播图</option>
			    </select>
			  </c:when>
			  <c:when test="${type eq '3'}">
			    <select name="type">
			      <option value="">请选择</option>
			      <option value="0">缩略图</option>
			      <option value="1">大图</option>
			      <option value="2">介绍图</option>
			      <option value="3" selected>轮播图</option>
			    </select>
			  </c:when>
			  <c:otherwise>
			    <select name="type">
			      <option value="" selected>请选择</option>
			      <option value="0">缩略图</option>
			      <option value="1">大图</option>
			      <option value="2">介绍图</option>
			      <option value="3">轮播图</option>
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

		 <button type="button" id="EditProductImg-btn" style="position: absolute;right: 60px;bottom: 30px" class="layui-btn layui-bg-blue">确认修改</button>
	</form>
</body>
<script type="text/javascript">
var isUpdateImg=false;
//渲染上传组件
upload.render({
  elem: '#EditProductImg-upload',
  url: '/vivoShop/background/pages/function/product_imgs/update', 
  auto:false,
  data:{
	  oldurl:$("#EditProductImg input[name='oldurl']").val(),
	  id:$("#EditProductImg input[name='id']").val(),
	  url:function(){
		  return $("#EditProductImg input[name='url']").val();
	  },
	  name:function(){
		  return $("#EditProductImg input[name='name']").val();
	  },
	  type:function(){
		  return $("#EditProductImg select[name='type']").val();
	  }
  },
  accept: 'images', // 只允许上传图片文件
  choose: function(obj){
	isUpdateImg=true;
    // 用户选择文件后立即渲染预览
    obj.preview(function(index, file, result){
    	$("#EditProductImg-upload .upload-no").hide()
    	$("#EditProductImg-upload .upload-ok").show();
      	$('#EditProductImg-upload .upload-ok img').attr('src', result); // 显示预览图
      	
      	var fileName = file.name;
        var extension = fileName.split('.').pop();
        
     	// 获取文件名（不包括扩展名）
        var fileNameWithoutExtension = fileName.substring(0, fileName.lastIndexOf('.'));
     	
        if($("#EditProductImg input[name='name']").val()==""){
        	$("#EditProductImg input[name='name']").val(fileNameWithoutExtension);
        }
        $("#EditProductImg .upload-ok span").html(fileName);

    });

  },
  before: function(obj) {
	// 获取表单数据
	    formData = {
	    	url: $("#EditProductImg input[name='url']").val(),
	        name: $("#EditProductImg input[name='name']").val(),
	        type: $("#EditProductImg select[name='type']").val()
	    };

	 	// 验证表单数据是否为空
	    if(formData.type === "" || formData.imageUrl === "") {
	    	layer.msg('请填写完整信息！', {icon: 2});
	    	return false;
	    }
	    
	 	// 验证路径是否合法
	    var validPathRegex = /^[^\.]+$/; // 正则表达式，表示路径不能包含点号（文件后缀）
	    if(!validPathRegex.test(formData.url)&&formData.url!="") {
	    	layer.msg("路径不能包含文件后缀！",{icon: 0});
	    	return false;
	    }
		// 包含非法字符的正则表达式
		var invalidCharsRegex = /[`~!@#$%^&*()_\-+=<>?:"{}|,.;'\\[\]·！#￥（——）：；“”‘、，|《。》？、【】[\]]/im;
		if (invalidCharsRegex.test(formData.url)) {
			layer.msg("路径包含非法字符！",{icon: 0});
			return false;
		}
		
		if(!validPathRegex.test(formData.name)&&formData.name!=""){
			layer.msg("文件名不能包含文件后缀！",{icon: 0});
			return false;
		}
		
		var reg = /[`~!@#$%^&*()\-+=<>?:"{}|,.\/;'\\[\]·！#￥（——）：；“”‘、，|《。》？、【】[\]]/im;
		if(reg.test(formData.name)){
			layer.msg("文件名包含非法字符！",{icon: 0});
			return false;
		}
  },
  bindAction: '#EditProductImg-btn',
  done: function(res){
	  var txt=res.msg;
	  	if(txt=="修改成功"){
			layer.msg('修改成功', {icon: 1});
		}else{
			layer.msg(txt, {icon: 2});
		}
		if(imgindex){
			 layer.close(imgindex);
			 //重新渲染
			 refreshImgsTable();
		}
  }
  });

	$("#EditProductImg-btn").click(function(){
		 // 如果有图片则不干涉如果没有上传新图片则直接开始修改内容，则禁止上传
        if (isUpdateImg==false) {
        	// 获取表单数据
    	    formData = {
        		upType:"无图片",
    	    	oldurl:$("#EditProductImg input[name='oldurl']").val(),
    	    	id:$("#EditProductImg input[name='id']").val(),
    	    	url: $("#EditProductImg input[name='url']").val(),
    	        name: $("#EditProductImg input[name='name']").val(),
    	        type: $("#EditProductImg select[name='type']").val()
    	    };

    	 	// 验证表单数据是否为空
    	    if(formData.type === "" || formData.imageUrl === "") {
    	    	layer.msg('请填写完整信息！', {icon: 2});
    	    	return;
    	    }
    	    
    	 	// 验证路径是否合法
    	    var validPathRegex = /^[^\.]+$/; // 正则表达式，表示路径不能包含点号（文件后缀）
    	    if(!validPathRegex.test(formData.url)&&formData.url!="") {
    	    	layer.msg("路径不能包含文件后缀！",{icon: 0});
    	    	return;
    	    }
    		// 包含非法字符的正则表达式
    		var invalidCharsRegex = /[`~!@#$%^&*()_\-+=<>?:"{}|,.;'\\[\]·！#￥（——）：；“”‘、，|《。》？、【】[\]]/im;
    		if (invalidCharsRegex.test(formData.url)) {
    			layer.msg("路径包含非法字符！",{icon: 0});
    			return;
    		}
    		
    		if(!validPathRegex.test(formData.name)&&formData.name!=""){
    			layer.msg("文件名不能包含文件后缀！",{icon: 0});
    			return;
    		}
    		
    		var reg = /[`~!@#$%^&*()\-+=<>?:"{}|,.\/;'\\[\]·！#￥（——）：；“”‘、，|《。》？、【】[\]]/im;
    		if(reg.test(formData.name)){
    			layer.msg("文件名包含非法字符！",{icon: 0});
    			return;
    		}
    		
    		 $.ajax({
			   		url:'/vivoShop/background/pages/function/product_imgs/update',
			   		data:formData,
			   		type: 'POST',
					dataType:'text',
			   		success: function(res){
			   		 	var jsonResponse = JSON.parse(res);
			   		  	var txt=jsonResponse.msg;
			    		if(txt=="修改成功"){
			    			layer.msg('修改成功', {icon: 1});
			    		}else{
							layer.msg(txt, {icon: 2});
						}
			    		if(imgindex){
							 layer.close(imgindex);
							 //重新渲染
							 refreshImgsTable();
						}
			    		
			    	},error: function(xhr, status, error) {
						//console.log(xhr)
						layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 0});
					}
			    	
			    })
        }
	})
</script>
</html>