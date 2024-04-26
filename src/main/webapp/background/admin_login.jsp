<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>登录</title>
  <meta name="description" content="particles.js is a lightweight JavaScript library for creating particles.">
  <meta name="author" content="Vincent Garreau" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <link rel="stylesheet" media="screen" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/reset.css"/>
</head>
<body>

<div id="particles-js">
		<form class="login">
			<div class="login-top">
				登录
			</div>
			<div class="login-center clearfix">
				<div class="login-center-img"><img src="images/name.png"/></div>
				<div class="login-center-input">
					<input type="text" name="account" value="" placeholder="请输入您的账号" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的用户名'"/>
					<div class="login-center-input-text">账号</div>
				</div>
			</div>
			<div class="login-center clearfix">
				<div class="login-center-img"><img src="images/password.png"/></div>
				<div class="login-center-input">
					<input type="password" name="password"value="" placeholder="请输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'"/>
					<div class="login-center-input-text">密码</div>
				</div>
			</div>
			<button style=" position: absolute;top: 70%;left: 50%; transform: translate(-50%, -50%); border:none;width: 250px;text-align: center;height: 40px;line-height: 40px;background-color: dodgerblue;border-radius: 5px;margin: 0 auto;margin-top: 50px;color: white;">
				登录
			</button>
		</form>
		<div class="sk-rotating-plane"></div>
</div>

<!-- scripts -->
<script src="../static/jquery-3.5.1.min.js"></script>
<script src="js/particles.min.js"></script>
<script src="js/app.js"></script>
		<link href="/vivoShop/background/lib/layui/css/layui.css" rel="stylesheet">
		<script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>

<script type="text/javascript">
var layer = layui.layer;

$("form.login").submit(function(e){
    e.preventDefault(); // 阻止表单默认提交行为
    var formData = $(this).serializeArray();

	// 检查是否都有值
   	for (var i = 0; i < formData.length; i++) {												        
	   if (formData[i].value === "") {
			layer.msg('账号密码不能为空!', {icon: 0,time:1000});
           return;
       }
    }

    // 添加动画
    $(".login").addClass("active")
	$(".sk-rotating-plane").addClass("active")
	$(".login").css("display","none")
	
	
    setTimeout(function(){
    	// 发送 AJAX 请求
        $.ajax({
            type: "POST",
            url: "/vivoShop/background/pages/function/admin/login",
            data: formData,
            success: function(response){
            	 // 移除动画
                $(".login").removeClass("active");
                $(".sk-rotating-plane").removeClass("active");
                $(".login").css("display","block");
                if(response=="true"){
                    // 提示登录成功
                    layer.msg('登录成功', {icon: 1});
                    setTimeout(function(){
                    	window.location.href = "vivoShopBackground.jsp";
                    },500)
                    
                    
                } else {
                	$("#particles-js input[name=password]").val('')
                	layer.msg('账号或密码错误!请重新输入!', {icon: 2,time:1200,offset: '20px' });// 将消息框位置设置为顶部
                	
                }
            },error: function(xhr, status, error) {
            	$(".login").removeClass("active");
                $(".sk-rotating-plane").removeClass("active");
                $(".login").css("display","block");
    			//console.log(xhr)
    			layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：' + xhr.statusText, {icon: 0});
    		}
        });
    },500)
});
</script>
</body>
</html>