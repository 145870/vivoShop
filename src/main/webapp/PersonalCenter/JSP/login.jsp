<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href = "../CSS/login.css"/>
<script src = "../../static/jquery-3.5.1.min.js"></script>
<script src ="../layui/layui.js"></script>
<link rel="stylesheet" href = "../layui/css/layui.css"/>
<body>
	<div>
			<div id="head_maxbox">
				<div id="center_box">
					<img src="../IMG/登录背景.jpg" />
					<div class="logo"><a></a></div>
					<div id="login_box">
						<div id="inner_box">
							<div id="head_">
								<span id="duanxin_login">短信验证码登录</span>
								<span>|</span>
								<span id="mima_login">密码登录</span>
								<div id="xiahuaxian"></div>
								
								<!-- 两种登录方式样式轮换 -->
								
								<script>
									
									//文档加载完毕默认执行
									$(function(){
										$('#duanxin_login').css({
											'color':'#000',
											'font-weight':'bold'
										})
									})
									
									//短信验证登录
									$('#duanxin_login').click(function(){
										$(this).css({
											'color':'#000',
											'font-weight':'bold'
										}),$('#mima_login').removeAttr('style'),//设置当前元素样式同时去除指定元素css样式
										$('#xiahuaxian').removeAttr('style'),
										
										$('#dx_loginbox').css('display','block'),$('#mm_loginbox').css('display','none')
										
										$('#toggle-line').css('line-height','19px')
										$('.check').css('margin-top','1px')
										$('#login').css('margin','20px auto 0')
										
										$('#login').removeClass("mimalogin")
									}) 

									//密码验证登录
									$('#mima_login').click(function(){
									$(this).css({
											'color':'#000',
											'font-weight':'bold',
										}),$('#duanxin_login').removeAttr('style'),
										
										$('#xiahuaxian').css('left','265px'),
										
										$('#dx_loginbox').css('display','none'),$('#mm_loginbox').css('display','block')
										
										$('#ip_num').val("");
										$('#yanzhenmaText').val("")
										
										$('#login').addClass("mimalogin")
									})
									
								</script>
							</div>
							
							<div>
								<div id="dx_loginbox">
									<div>
										
										<!-- 手机号登录 -->
										
										<div id="number">
											<input type="text" placeholder="请输入手机号" id="ip_num"/>
											<!-- 触发焦点事件时提示消失 -->
											<script>
												$('#ip_num').focus(function(){
													$('#tishi').css('display','none')
												})
											</script>
										</div>
										
										
										<div id="mail_login" style="display: none;">
											<input type="text" placeholder="请输入邮箱/vivo号"/>
										</div>
										
									</div>
									<div id="tishicuowu">
										<div id="tishi">请输入有效的手机号</div>
									</div>
									<div id="yanzhen">
										<input type="text" placeholder="请输入验证码" id="yanzhenmaText"/>
										<div id="hqyanzhenma">
											<span id="huoquyzm">获取验证码</span>
											<script>
												$('#huoquyzm').click(function(){
													if($('#ip_num').val().length!=11){
														$('#tishi').show()
													}else if($('#ip_num').val().length==11){
														$('#tishi').hide()
														$.ajax({
														type:'GET',
														url:'VerifyPhoneServlets',
														data:{
															phone:$('#ip_num').val(),
														},success:function(txt){
															if(txt=='true'){
																var seconds = 60;
														        $(this).prop('disabled', true).text(seconds + '秒后重新获取');
														        var countdownInterval = setInterval(function(){
														            seconds--;
														            $('#huoquyzm').text(seconds + '秒后重新获取');
														            if(seconds <= 0){
														                clearInterval(countdownInterval);
														                $('#huoquyzm').prop('disabled', false).text('获取验证码');
																		isCounting = false; // 标志为倒计时结束
																		$('#huoquyzm').css({
																		    'pointer-events': 'auto', // 在倒计时结束后恢复点击事件
																		    'color': '#456fff' // 恢复文本颜色
																		});
														            }
														        }, 1000);
														       
														        $.ajax({
													            	
													            	type:'GET',
													            	url:'registerServlets',
													            	data:{
													            		phone:$('#ip_num').val(),
													            	},success:function(yzm){
													            		alert(yzm);
													            		code=yzm;
													            	}
													            
												            })
																$('#huoquyzm').css({
																	'pointer-events':'none',
																	'color':'rgb(128,128,128)'
															});
															}else if(txt=='false'){
																layer.alert('查无此账号！', {
																	icon: 2,
																	closeBtn: 0, // 关闭按钮不显示
																	yes: function (index, layero) { // 点击确定按钮的回调函数
																		//跳转
											                   			layer.close(index); // 关闭对话框
											                		}
																	
																	
											              		});
																$('#ip_num').val("");
															}
														}
													})
														// 获取验证码时间间隔
														 
													}
												})
												 var code = null;
											</script>
											<span></span>
										</div>
									</div>
									
									<div class="tishiyanzheng" id="shuruyanzheng">请输入验证码</div>
									<div class="tishiyanzheng" id="Validation_error">验证码错误</div>
									
								</div>
								
								
								<div id="mm_loginbox">
									<div>
										<div>
											<div id="number">
												<input type="text" placeholder="请输入手机号" id="ip_num_mm"/>
											</div>
											
											
											
										</div>
									</div>
									<div id="tishicuowu">
										<div id="tishi_mm">请输入有效的手机号</div>
									</div>
									<div class="pwd_box">
										<input type="password" placeholder="请输入密码" class="input" id="pwdtext" />
										<div id="eye_box">
											<img src="../IMG/闭眼.png" class="yj_img" id="by"/>
											<img src="../IMG/睁眼.png" class="yj_img" style="display: none;" id="zy"/>
											<!-- 查看密码明文按钮 -->
											<script>
												$('#by').click(function(){
													$(this).hide()
													$('#zy').show()
													$('#pwdtext').attr("type",'text')
												})
												$('#zy').click(function(){
													$('#by').show()
													$('#zy').hide()
													$('#pwdtext').attr("type",'password')
												})
											</script>
										</div>
									</div>
									<div id = "tishimima">请输入密码</div>
									<script>
												$('#ip_num_mm').focus(function(){
													$('#tishi_mm').hide()
												})
												$('#pwdtext').focus(function(){
													$('#tishimima').hide()
												})
									</script>
								</div>
								
								
								
								
							</div>
							<div id="toggle-line">
								<div id="timeLogin">
									<div class="check">
										<img src="../IMG/勾选.png"/ id="gouxuan" style="display: none;">
										<!-- 选中勾选 -->
										<script>
											$('.check').click(function(){
												if($('#gouxuan').css('display')==='none'){
													$('#gouxuan').css('display','block')
												}else{
													$('#gouxuan').css('display','none')
												}
											})
										</script>
									</div>
									<span>两周内自动登录</span>
								</div>
								<div id="disable">登录遇到问题</div>
							</div>
							<div id="login">登录</div>
							
							
							
								<!-- 验证手机号是否符合规范 -->
								<script>
									$('#login').click(function(){
										if ($(this).hasClass('mimalogin')) {
										     if($('#ip_num_mm').val().length==11){
										    	 if($('#pwdtext').val()!=""){
										    		 $.ajax({
										    			 type:'GET',
										    			 url:'loginServlets',
										    			 data:{
										    				 phone:$('#ip_num_mm').val(),
										    				 pwd:$('#pwdtext').val(),
										    			 },success:function(txt){
										    				 if(txt=="true"){
										    					 layer.alert('登录成功！', {
																		icon: 1,
																		closeBtn: 0, // 关闭按钮不显示
																		yes: function (index, layero) { // 点击确定按钮的回调函数
																			//跳转
												                   			layer.close(index); // 关闭对话框
												                   			window.location.href = "zhuye.jsp";
												                		}
																		
												              		});
										    				 }else if(txt=="false"){
										    					 layer.alert('账号或密码错误！', {
																		icon: 2,
																		closeBtn: 0, // 关闭按钮不显示
																		yes: function (index, layero) { // 点击确定按钮的回调函数
																			//跳转
												                   			layer.close(index); // 关闭对话框
												                		}
																		
												              		});
										    				 }
										    			 }
										    		 })
										    	 }else{
										    		 $('#tishimima').show()
										    	 }
										     }else{
										    	 $('#tishi_mm').show()
										     }
										  }else {
											  if($('#ip_num').val().length!=11){
													$('#tishi').show()
													event.preventDefault(); // 阻止表单提交
												}else if($('#yanzhenmaText').val()===""){
													$('#shuruyanzheng').show()
													event.preventDefault(); // 阻止表单提交
												}else if($('#yanzhenmaText').val()===code){
													layer.alert('登录成功！', {
														icon: 1,
														closeBtn: 0, // 关闭按钮不显示
														yes: function (index, layero) { // 点击确定按钮的回调函数
															//跳转
								                   			layer.close(index); // 关闭对话框
								                   			window.location.href = "zhuye.jsp";
								                		}
														
								              		});
												}else{
													$('#Validation_error').show();
												}
										}
									})
									
										
										
										$('#phone').focus(function(){
											$('#tishicuowu').hide()
										})
										$('#yanzhenmaText').focus(function(){
											$('.tishiyanzheng').hide()
										})
										
				
								</script>
							<div id="zhuce">注册vivo账号</div>
							<script>
								$('#zhuce').click(function(){
								 window.location.href = "register.jsp";
									
								})
							</script>
							<div id="way_login">
								<div id="l_title">
									<div class="line"></div>
									<div id="qtfs">其他方式登录</div>
									<div  class="line"></div>
								</div>
								<div id="icon_box">
									<div class="icon_item">
										<div id="img_weixin"></div>
									</div>
									<div class="icon_item">
										<div id="img_zhifubao"></div>
									</div>
									<div class="icon_item">
										<div id="img_weibo"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 页脚 -->
			<div id="buttom">
				<div id="one_buttom">
					<a style="margin-right: 30px">
						<img src="../IMG/留言.png" id="img_liuyan"/>
						<span>在线客服</span>
					</a>
					<a>
						<img src="../IMG/电话.png" id="img_ipone"/>
						<span>95033（ 24小时全国服务热线）</span>
					</a>
				</div>
				<div id="two_buttom">
					 COPYRIGHT ©2011-2024 广东天宸网络科技有限公司 版权所有 保留一切权利 | 隐私政策 | 法律声明 | 粤B2-20080267 | 粤ICP备05100288号 
				</div>
			</div>
		</div>
</body>
</html>