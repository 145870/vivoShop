<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href = "/vivoShop/PersonalCenter/CSS/register.css"/>
<link rel="stylesheet" href = "/tr03802_web/PersonalCenter/CSS/register.css"/> -->
<link rel="stylesheet" href = "../CSS/register.css"/>
<!-- 引入 layui.css -->
<link href="//unpkg.com/layui@2.9.8/dist/css/layui.css" rel="stylesheet">
<!-- 引入 layui.js -->
<script src="//unpkg.com/layui@2.9.8/dist/layui.js"></script>
<script src = "../../static/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div>
			<div id="bg_box">
				<div id="head_logo">
					<div id="logo"><img src="../IMG/注册logo.png"/></div>
				</div>
				<div id="zhucewenzi">
					<div>账号注册</div>
				</div>
				<div id="input_box">
					<form id = "reg_form">
					<div id="input_box_center">
						<div id="guojia">
							<div id="jutiguojia"></div>
							<script>
							$(document).ready(function(){
							    // 设置默认值为 "中国"
							    $('#jutiguojia').text("中国");
							});
							</script>
							
							<div id="jiantou">
								<img src="../IMG/注册页面下箭头.png" id="but_jiantou" style="display: block;">
								<img src="../IMG/注册上箭头.png" id="top_jiantou" style="display: none;"/>
							</div>
						</div>
						<!-- 国家列表默认隐藏 -->
						<div id="country_list_box">
							<ul>
								<li>
									<div class="country_name">
										<span>中国</span>
									</div>
								</li>
								<li>
									<div class="country_name">
										<span>英国</span>
									</div>
								</li>
								<li>
									<div class="country_name">
										<span>法国</span>
									</div>
								</li>
								<li>
									<div class="country_name">
										<span>美国</span>
									</div>
								</li>
								<li>
									<div class="country_name">
										<span>俄罗斯</span>
									</div>
								</li>
								<li>
									<div class="country_name">
										<span>丹麦</span>
									</div>
								</li>
								<li>
									<div class="country_name">
										<span>刚果共和国</span>
									</div>
								</li>
							</ul>
						</div>
						
						<!-- 添加选中国家时点击事件 -->
						<script>
							$('#country_list_box .country_name').click(function(){
								var country = $(this).find('span').text()
								$('#jutiguojia').text(country)
								$('#country_list_box').hide()
								  $('#but_jiantou').show();
								    $('#top_jiantou').hide();
							})
						</script>
						
						<script>
							$('#guojia').click(function(){
								if($('#country_list_box').css('display')==='none'){
									$('#country_list_box').show()
								}else{
									$('#country_list_box').hide()
								}
								
								if($('#but_jiantou').css('display')==='block'){
									$('#but_jiantou').hide()
									$('#top_jiantou').show()
								}else{
									$('#but_jiantou').show()
									$('#top_jiantou').hide()
								}
							})
						</script>
						
						<div id="zhuce_tishi">成功注册账号后，国家/地区将不能被修改</div>
						<div id="phone_num">
							<div id="phone_guishu">
								<div id="num"></div>
							</div>
							
							
							<input type="text" placeholder="请输入手机号" id="phone" name = "phone" class = "zcphone"/>
						</div>
						<div id="country_box">
							<ul>
								<li class = "country_items">
									<span>中国</span>
									<span>+86</span>
								</li>
								<li class = "country_items">
									<span>美国</span>
									<span>+1</span>
								</li>
								<li class = "country_items">
									<span>加拿大</span>
									<span>+1</span>
								</li>
								<li class = "country_items">
									<span>哈萨克斯坦</span>
									<span>+7</span>
								</li>
								<li class = "country_items">
									<span>俄罗斯</span>
									<span>+7</span>
								</li>
								<li class = "country_items">
									<span>埃及</span>
									<span>+20</span>
								</li>
								<li class = "country_items">
									<span>南非</span>
									<span>+27</span>
								</li>
								<li class = "country_items">
									<span>希腊</span>
									<span>+30</span>
								</li>
								<li class = "country_items">
									<span>荷兰</span>
									<span>+31</span>
								</li>
							</ul>
						</div>
						<!-- 点击显示号码归属 -->
						<script>
						$(document).ready(function(){
						    // 设置默认值为 "86"
						    $('#num').text("+86");
						});
						</script>
						<script>
							$('#phone_guishu').click(function(){
								if($('#country_box').css('display')==='none'){
									$('#country_box').show()
								}else{
									$('#country_box').hide()
								}
							})
							
							
							
							$('#country_box .country_items').click(function(){
								var num = $(this).find('span').eq(1).text()
								$('#num').text(num)
								$('#country_box').hide()
								
								 // 重置箭头图标为向下箭头
								    $('#but_jiantou').show();
								    $('#top_jiantou').hide();
									
							})
						
						</script>
						
						<div id="tishicuowu"><div id="tishi">请输入有效的手机号</div></div>
						
						<div id="yanzhen">
							<input type="text" placeholder="请输入验证码" id="yanzhenmaText"/>
							<div id="hqyanzhenma">
								<span id="huoquyzm" >获取验证码</span>
								<span></span>
							</div>
							<script>
							var isCounting = false; // 全局变量，用于标识是否正在倒计时
							
							$('#huoquyzm').click(function() {
							    if ($('#phone').val().length === 11) {
							    	$.ajax({
										type:'GET',
										url:'registerPhoneServlets',
										data:{
											zcPhone:$('.zcphone').val(),
										},success:function(txt){
											if(txt=="true"){
												layer.alert('账号已存在！', {
													icon: 5,
													closeBtn: 0, // 关闭按钮不显示
													yes: function (index, layero) { // 点击确定按钮的回调函数
														//跳转
							                   			layer.close(index); // 关闭对话框
							                		}
							              		});
											}else if(txt=="false"){
												if (isCounting) return; // 如果正在倒计时，则直接返回
										        var seconds = 60;
										        isCounting = true; // 标志为正在倒计时
										        $(this).prop('disabled', true).text(seconds + '秒后重新获取');
										        
										        var countdownInterval = setInterval(function() {
										            seconds--;
										            $('#huoquyzm').text(seconds + '秒后重新获取');
										            if (seconds <= 0) {
										                clearInterval(countdownInterval);
										                $('#huoquyzm').prop('disabled', false).text('获取验证码');
										                isCounting = false; // 标志为倒计时结束
														$('#huoquyzm').css({
															'pointer-events': 'auto', // 在倒计时结束后恢复点击事件
															'color': '#456fff' // 恢复文本颜色
														});
										            }
										        }, 1000);
												$('#huoquyzm').css({
													'pointer-events':'none',
													'color':'rgb(128,128,128)'
												});
												$.ajax({
													type:'GET',
													url:'registerServlets',
													data:{
														phone:$('#phone').val(),
													},success:function(yzm){
														alert(yzm)
														code=yzm
													}
												})
											}
										}
									})
							        
							    } else {
							        $('#tishicuowu').show();
							        // 隐藏其他可能存在的提示信息
							    }
							});
							var code = null;
							</script>
							
						</div>
						
	
						
						<div class="tishiyanzheng" id="shuruyanzheng">请输入验证码</div>
						<div class="tishiyanzheng" id="Validation_error">验证码错误</div>
						
						<!-- 注册时输入密码 -->
						
						<div id="password_input">
							<input type="password" id="password" name="password" placeholder="请输入密码"/>
							<div id="yanjin">
								<img src="../IMG/闭眼.png" class="yj_img" id="by"/>
								<img src="../IMG/睁眼.png" class="yj_img" style="display: none;" id="zy"/>
							</div>
							
							<!-- 明文密码显示开关 -->
							
							<script>
								$('#by').click(function(){
									$(this).hide()
									$('#zy').show()
									$('#password').attr("type",'text')
								})
								$('#zy').click(function(){
									$('#by').show()
									$('#zy').hide()
									$('#password').attr("type",'password')
								})
							</script>
							
						</div>
						
						<div id="shuruPasswordtishi">请输入密码</div>
						<script>
						$('#password').focus(function(){
							$('#shuruPasswordtishi').hide()
						})
						</script>
					
						
						<div id="xieyi">
							<div class="gouxuan">
								<img src="../IMG/注册勾选.png" id="zhucegou"/>
							</div>
							
							<script>
								$('.gouxuan').click(function(){
									if($('#zhucegou').css('display')==='none'){
										$('#zhucegou').show()
									}else{
										$('#zhucegou').hide()
									}
								})
							</script>
							
							<span class="span1">我已阅读并接受</span>
							<a class="span2">服务协议</a>
							<span class="span1">和</span>
							<a class="span2">隐私政策</a>
						</div>
						<div id="xiayibu"><input type="submit" id="xiayibuBut" value="注册"/></div>
						
						</div>
					</form>
					
					<script>
							var layer = layui.layer;
							var util  = layui.util;
							$('#reg_form').submit(function(event){
								event.preventDefault(); // 阻止表单提交
								//长度等于11
								if($('#phone').val().length==11){
									//验证码等于123
									if($('#yanzhenmaText').val()==code){
										//密码不能为空
										if($('#password').val()!==""){
											//勾选协议
											if($('#zhucegou').css('display') === 'block'){
									            var formData = $("#reg_form").serializeArray();
												
												$.ajax({
													type:'GET',
													url:'insertUserDataServlets',
													data:formData,
													success:function(txt){
														if(txt=="true"){
															layer.msg("注册成功！",{icon:1})
															setTimeout(function(){
																window.location.href = "login.jsp";
									                   			layer.close(index); // 关闭对话框
															},1300)
														}else{
															layer.msg("注册失败,该手机号已被注册！",{icon:2})
														}
													}
												})
												
											}else{
												//添加抖动动画
												$('#xieyi').addClass("shake-animation");
													setTimeout(function() {
													$("#xieyi").removeClass("shake-animation");
												}, 500);
											
											}
										}else{
											//提示"请输入密码"
											
											$('#shuruPasswordtishi').show()
											
										}
									}else if($('#yanzhenmaText').val()!=code && $('#yanzhenmaText').val()!==""){
										
										//提示"验证码错误"
										
										$('#Validation_error').show()
									
									}else if($('#yanzhenmaText').val()==""){
										
										//提示"请输入验证码"
										
										$('#shuruyanzheng').show()
									
									}
								}else{
									
									//提示"请输入有效手机号"
									
									$('#tishicuowu').show()
									
								}
							})
								
							
							$('#yanzhenmaText').focus(function(){
								$('#shuruyanzheng').hide()
							})
							$('#phone').focus(function(){
								$('#tishicuowu').hide()
							})
							$('#yanzhenmaText').focus(function(){
								$('.tishiyanzheng').hide()
							})
						</script>
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