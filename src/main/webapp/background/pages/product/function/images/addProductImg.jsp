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
#addProductImg .layui-form {
	margin: 0 auto;
	width: 345px;
	padding: 20px;
}

#addProductImg .layui-form-onswitch {
	border-color: rgb(85, 170, 255);
	background-color: rgb(85, 170, 255);
}

#addProductImg .layui-table-checked {
	background-color: rgb(244, 244, 255);
}

/* 重写 */
#addProductImg .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

#addProductImg .layui-laydate .layui-this, .layui-laydate .layui-this>div
	{
	background-color: rgb(85, 170, 255) !important;
}

/* 重写 */
#addProductImg .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#addProductImg .layui-input-group>.layui-input-prefix {
	width: 150px;
	text-align: right;
	font-weight: bold;
}

#addProductImg .layui-input {
	width: 200px;
}

#addProductImg .layui-input-group {
	margin-bottom: 20px;
}
</style>
	<form class="layui-form" id="addProductImg" style="margin-top: 30px">
		<!--  -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">存储路径:</div>
			<input type="text" name="url" placeholder="images/commodity/" class="layui-input right-text">
		</div>
		
		<div class="layui-input-group">
			<div class="layui-input-prefix">文件名:</div>
			<input type="text" name="name" placeholder="空则随机名称" class="layui-input right-text">
		</div>
		<!-- 分类 -->
		<div class="layui-input-group">
			<span class="layui-input-prefix">类别:</span> 
			<select name="type">
				<option value="">请选择</option>
				<option value="0">缩略图</option>
				<option value="1">大图</option>
				<option value="2">介绍图</option>
				<option value="3">轮播图</option>
			</select>
		</div>
		
		<!--  -->
		<div class="layui-input-group">
			<div class="layui-input-prefix">图片上传:</div>
			<div class="layui-upload-drag" id="addProductImg-upload" style="width:138px;">
  				<div class="upload-no">
  					<i class="layui-icon layui-icon-upload" style="color:rgb(155,178,255)"></i> 
  					<div style="color:rgb(117,117,117)">点击上传，或将文件拖拽到此处</div>
  				</div>
  				<div class="upload-ok" style="display: none;">
    				<img src="" alt="上传成功后渲染" style="max-width: 100%">
    				<hr> 
    				
    				<div style="color:rgb(117,117,117)">
    					已选择文件
    					<br>
    					<span></span>
    				</div>
 				</div>
			</div>
		</div>

		 <button type="button" id="addProductImg-btn" style="position: absolute;right: 60px;bottom: 30px" class="layui-btn layui-bg-blue">确认添加</button>
	</form>
</body>
<script type="text/javascript">
//渲染上传组件
upload.render({
  elem: '#addProductImg-upload',
  url: '/vivoShop/background/pages/function/product_imgs/add', // 实际使用时改成您自己的上传接口即可。
  auto:false,
  data:{
	  url:function(){
		  return $("#addProductImg input[name='url']").val();
	  },
	  name:function(){
		  return $("#addProductImg input[name='name']").val();
	  },
	  type:function(){
		  return $("#addProductImg select[name='type']").val();
	  }
  },
  accept: 'images', // 只允许上传图片文件
  choose: function(obj){
    // 用户选择文件后立即渲染预览
    obj.preview(function(index, file, result){
    	$("#addProductImg-upload .upload-no").hide()
    	$("#addProductImg-upload .upload-ok").show();
      	$('#addProductImg-upload .upload-ok img').attr('src', result); // 显示预览图
      	
      	var fileName = file.name;
        var extension = fileName.split('.').pop();
        
     	// 获取文件名（不包括扩展名）
        var fileNameWithoutExtension = fileName.substring(0, fileName.lastIndexOf('.'));
     	
        if($("#addProductImg input[name='name']").val()==""){
        	$("#addProductImg input[name='name']").val(fileNameWithoutExtension);
        }
        $("#addProductImg .upload-ok span").html(fileName);

    });

  },
  before: function(obj) {
	// 获取表单数据
	    formData = {
	    	url: $("#addProductImg input[name='url']").val(),
	        name: $("#addProductImg input[name='name']").val(),
	        type: $("#addProductImg select[name='type']").val()
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
  bindAction: '#addProductImg-btn',
  done: function(res){
	  var txt=res.msg;
	  if(txt=="新增成功"){
			layer.msg('新增成功', {icon: 1});
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

	$("#addProductImg-btn").click(function(){
		 // 如果没有选择图片，则禁止上传
        if ($("#addProductImg-upload .upload-ok").is(":hidden")) {
            layer.msg('请选择图片！', {
                icon: 2
            });
            return;
        }
	})
</script>
</html>