<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
	
  <title>个人首页</title>
	<!-- <link href="//cdn.staticfile.org/layui/2.9.7/css/layui.css" rel="stylesheet">
	<script src="//cdn.staticfile.org/layui/2.9.7/layui.js"></script> -->
  <style>
  	#adminMyMessage *{
  		font-size:14px;
  	}
    #adminMyMessage.container {
      display: flex;
      height: 100vh;
	  padding: 30px;
    }
    #adminMyMessage .sidebar {
      width: 35%;
	  height: 500px;
	  margin-right: 40px;
	   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
    }
    #adminMyMessage .main-content {
      width: 65%;
	  height: 550px;
	   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
    }
	#adminMyMessage .message p{
		margin-bottom: 20px;
		padding: 5px;
		border-bottom: 0.5px solid rgb(240,243,244); /* 设置分隔线样式 */
	}
	#adminMyMessage div.layui-input-group{
		margin-bottom: 20px;
	}
	
	#adminMyMessage .layui-form-radio:hover>*, .layui-form-radioed, .layui-form-radioed>i {
	    color: rgb(102, 177, 255);
	}
	
	#adminMyMessage .message p>span{
		 float: right;
	}
	
	#updateAdminPWD .layui-input-prefix{
		width: 100px;
	}
	
	#updateAdminPWD{
		margin: 0 auto;
		margin-top: 20px;
		display: block;
		width: 300px;
	}
	#updateAdminPWD div.layui-input-group{
		margin-bottom: 20px;
	}
	
	.floating-text {
	    position: absolute;
	    margin-left: 12px;
	    font-size: 10px;
	    color: red;
	    margin-top: 3px;
	    display: none;
	}
  </style>
</head>
<body>
  <div id="adminMyMessage" class="container">
    <div class="sidebar">
      <!-- 个人信息展示 -->
      <h4 style="padding: 20px;">个人信息</h4>
	  <hr>
	  <div style="padding: 20px;" class="message">
		<p>
			账号：<span class="account">${admin.account}</span>
		</p>
		<p>
			昵称：<span class="nickname">${admin.nickname}</span>
		</p>
		<p>
			姓名：<span class="admin_name">${admin.adminName}</span>
		</p>
		<p>
			电话：<span class="phone">${admin.phone}</span>
		</p>
		<p>
			性别：<span class="sex">${admin.sex eq 0?'男':'女'}</span>
		</p>
		<p>
			权限：<span class="admin_type">${admin.typeName}</span>
		</p>
		<p style="text-align: right;">
			<a onclick="openUpdateAdminPassword()" style="font-size: 12px;color: blue;">修改密码</a>
		</p>
	  </div>
    </div>
	
	
    <div class="main-content">
		<!-- 编辑内容 -->
		<h4 style="padding: 20px;">编辑个人信息</h4>
		<hr />
		<form id='updateMyAdmin' style="padding: 20px;" class="layui-form" lay-filter="updateMyAdmin">
			<!-- 账号 --> 
			<div class="layui-input-group">
				<div class="layui-input-prefix">账号:</div>
				<input value='${admin.account}' type="text" name="account" placeholder="请输入账号" class="layui-input right-text">
			</div>
			
			<!-- 昵称 -->
			<div class="layui-input-group">
				<div class="layui-input-prefix">昵称:</div>
				<input value='${admin.nickname}' type="text" name="nickname" placeholder="请输入昵称" class="layui-input right-text">
			</div>
			
			<!-- 电话 -->
			<div class="layui-input-group">
				<div class="layui-input-prefix">电话:</div>
				<input value='${admin.phone}' type="text" name="phone" placeholder="请输入电话" class="layui-input right-text">
			</div>
			
			<!-- 性别 -->
			<div class="layui-input-group">
				<div class="layui-input-prefix">性别:</div>
				<div class="layui-input-block">
				    <input type="radio" name="sex" value="0" title="男" <c:if test="${admin.sex eq 0}">checked="checked"</c:if> />
					<input type="radio" name="sex" value="1" title="女" <c:if test="${admin.sex eq 1}">checked="checked"</c:if> />
				</div>
			</div>
			

			<button class="layui-btn layui-bg-blue">保存</button>
		</form>
    </div>
	
	
  </div>
</body>
	<script>
		form.render();

		function openUpdateAdminPassword(){
			layer.open({
				title:"修改密码",
				shadeClose : true,
			    type: 1,
			    area: ['380px', '310px'], // 宽高
			    content: 
					'<from class="layui-form" id="updateAdminPWD">'+
					'<div class="layui-input-group">'+
						'<div class="layui-input-prefix">旧密码:</div>'+
						'<input type="password" name="oldPwd" placeholder="请输入旧密码" class="layui-input right-text" lay-affix="eye">'+
						'<div class="floating-text">请输入密码</div>' +
					'</div>'+
					
					'<div class="layui-input-group">'+
						'<div class="layui-input-prefix">新密码:</div>'+
						'<input type="password" name="newPwd" placeholder="请输入新密码" class="layui-input right-text" lay-affix="eye">'+
						'<div class="floating-text">请输入新密码</div>' +
					'</div>'+
					
					'<div class="layui-input-group">'+
						'<div class="layui-input-prefix">确认密码:</div>'+
						'<input type="password" name="confirmPwd" placeholder="请输入新密码" class="layui-input right-text" lay-affix="eye">'+
						'<div class="floating-text">请再次输入密码</div>' +
					'</div>'+
					
					'</from>',
					
				btn: ['确认', '取消'],
				btn1: function(index, layero, that){
					//是否允许提交标识
					var isSubmit = true;
					//获取元素
					var old_pwd_input = $("#updateAdminPWD input[name=oldPwd]");
					var new_pwd_input = $("#updateAdminPWD input[name=newPwd]");
					var confirm_pwd_input = $("#updateAdminPWD input[name=confirmPwd]");
					
					//验证密码
					var old_pwd = old_pwd_input.val();
					var new_pwd = new_pwd_input.val();
					var confirm_pwd = confirm_pwd_input.val();
					
					// 验证逻辑
				    if (old_pwd === '') {
				    	old_pwd_input.next().text('请输入旧密码').show();
				    	isSubmit = false;
				    }else{
				    	old_pwd_input.next().hide();
				    }

				    if (new_pwd === '') {
				    	new_pwd_input.next().text('请输入新密码').show();
				    	isSubmit = false;
				    }else{
				    	new_pwd_input.next().hide();
				    }

				    if (confirm_pwd === '') {
				    	confirm_pwd_input.next().text('请再次输入新密码').show();
				    	isSubmit = false;
				    }else{
				    	confirm_pwd_input.next().hide();
				    }

				    if (new_pwd !== confirm_pwd) {
				    	confirm_pwd_input.next().text('新密码与确认密码不一致').show();
				    	isSubmit = false;
				    }else{
				    	confirm_pwd_input.next().hide();
				    }
				    
				    //提交
				    if(isSubmit){
				    	$.ajax({
				    		url:"/vivoShop/background/pages/function/admin/updateMyPassword",
				    		data : {
				    			oldpwd:old_pwd,
				    			newpwd:new_pwd
				    		},
							type: 'post',
							success: function(txt) {
								if(txt=="true"){
									layer.msg('修改成功,即将重新登录',{icon : 1});
									layer.close(index);
									setTimeout(function(){
										escLogin();
									},1000)
								}else{
									layer.msg('原密码错误!',{icon : 2})
								}
							}
				    	})
				    }
					
				},btn2: function(index, layero, that){
					alert("取消")
				}
			});
		}
		
		$("#updateMyAdmin").submit(function(event){
			event.preventDefault();
			
			var formData = $("#updateMyAdmin").serializeArray();

			for (var i = 0; i < formData.length; i++) {
				// 检查其他字段是否为空
				if (formData[i].value === "") {
					layer.msg('内容不能为空!',{icon : 0,time : 1000});
					return;
				}
			}
			layer.confirm('是否确认修改？',{icon : 3},function() {
				
				//修改
				$.ajax({
					url : "/vivoShop/background/pages/function/admin/updateMyAdmin",
					data : formData,
					dataType: 'json',
					type: 'post',
					success: function(response) {
						layer.closeAll('dialog');
					    // 处理返回的JSON数据
					    var result = response.result; // 修改结果
					    var userInfo = response.data; // 用户信息
						if (result == "true") {
							layer.msg('修改成功',{icon : 1});
							$("#adminMyMessage .account").text(userInfo.account);
							$("#adminMyMessage .nickname").text(userInfo.nickname);
							$("#adminMyMessage .phone").text(userInfo.phone);
							$("#adminMyMessage .sex").text(userInfo.sex);
							
						} else {
							layer.msg('修改失败,'+ txt,{icon : 2});
						}
						
						
					},error : function(xhr,status,error) {
						layer.msg('请求出错，状态码：'+ xhr.status+ '，状态描述：'+ xhr.statusText,{icon : 0});
					}
				})
			});
		})
		
		
		
		
		
	</script>
</html>