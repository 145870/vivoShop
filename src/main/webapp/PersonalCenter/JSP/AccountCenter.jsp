<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../CSS/AccountCenter.css"/>
<link rel="stylesheet" href = "../layui/css/layui.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src = "../../static/jquery-3.5.1.min.js"></script>
<script src ="../layui/layui.js"></script>

<body>
		<div>
			<div id="bigbox" style = "margin:0 auto;">
				<div id="logo"><img src="../IMG/logo.png" id="vivo_img"/></div>
				<div id="title">账号中心</div>
				<div id="touxiang">
					<div id="tuichu">退出账号</div>
					<div id="avatar">
						<span></span>
					</div>
					<div id="name">
						<span id="nickname"></span>
						<span id="updataname">修改昵称</span>
					</div>
				</div>
				<div id="hr"></div>
				<div id="cent_box">
					<div id="small-title">登录与安全</div>
					<div class="section one">
						<div class="part">
							<div class="icon"><img src="../IMG/头.png"/></div>
							<div class="name_detail">
								<div><span class="big_title">vivo号</span><span class="pid"></span><div id="gth_box"><img src="../IMG/提示.png"/></div></div>
								<div class="jieshao"><span>用于vivo账号登录</span></div>
							</div>
							<div class="operate">
								<span id="upvivo">修改</span>
							</div>
						</div>
						<div class="left_line"></div>
					</div>
					<div class="section">
						<div class="part">
							<div class="icon"><img src="../IMG/锁.png"/></div>
							<div class="name_detail">
								<div><span class="big_title">账号密码</span></div>
								<div class="jieshao"><span>用户保护账号信息和登录安全</span></div>
							</div>
							<div class="operate">
								<span  id="upnumpass">修改</span>
							</div>
						</div>
						<div class="left_line"></div>
					</div>
					<div class="section">
						<div class="part">
							<div class="icon"><img src="../IMG/手机标志.png"/></div>
							<div class="name_detail">
								<div><span class="big_title">安全手机</span><span class="pid">19373369678</span></div>
								<div class="jieshao"><span>安全手机可用于登录vivo账号，找回密码或其它安全验证</span>></div>
							</div>
							<div class="operate">
								<span id="upPhone">修改</span>
							</div>
						</div>
						<div class="left_line"></div>
					</div>
					<div class="section">
						<div class="part">
							<div class="icon"><img src="../IMG/邮箱标志.png"/></div>
							<div class="name_detail">
								<div><span class="big_title">安全邮箱</span><span class="pid">3269492547@qq.com</span></div>
								<div class="jieshao"><span>安全邮箱可用于登录vivo账号，找回密码或其它安全验证</span>></div>
							</div>
							<div class="operate">
								<span id="upem">修改</span>
							</div>
						</div>
						<div class="left_line"></div>
					</div>
					<div class="section">
						<div class="part">
							<div class="icon"><img src="../IMG/密保标志.png""/></div>
							<div class="name_detail">
								<div><span class="big_title">密保问题</span></div>
								<div class="jieshao"><span>密保问题可用于找回密码或其它安全验证</span>></div>
							</div>
							<div class="operate">
								<span id="upwenti">修改</span>
							</div>
						</div>
						<div class="left_line" id="line"></div>
					</div>
				</div>
				
				<!-- 中部分 -->
				<div id="center_b">
					<div id="na">更多安全服务</div>
					<div>
						
						
						<div class = "ite">
							<div class="ite_box">
								<img src="../IMG/安全1.png"/>
								<div class="jieshao_box">
									<div class="jieshao_box2">
										<div class="title">账号申诉</div>
										<div class="neiron">手机号、邮箱、密保问题不可用时申诉</div>
									</div>
									<img src="../IMG/右小箭头.png" class="right_xiao"/>
								</div>
							</div>
						</div>
						
						
						<div class = "ite">
							<div class="ite_box">
								<img src="../IMG/安全2.png"/>
								<div class="jieshao_box">
									<div class="jieshao_box2">
										<div class="title">冻结账号</div>
										<div class="neiron">手机号、邮箱、密保问题不可用时申诉</div>
									</div>
									<img src="../IMG/右小箭头.png" class="right_xiao"/>
								</div>
							</div>
						</div>
						
						
						<div class = "ite">
							<div class="ite_box">
								<img src="../IMG/安全3.png"/>
								<div class="jieshao_box">
									<div class="jieshao_box2">
										<div class="title">注销账号</div>
										<div class="neiron">手机号、邮箱、密保问题不可用时申诉</div>
									</div>
									<img src="../IMG/右小箭头.png" class="right_xiao"/>
								</div>
							</div>
						</div>
						
						
						<div class = "ite">
							<div class="ite_box">
								<img src="../IMG/安全4.png"/>
								<div class="jieshao_box">
									<div class="jieshao_box2">
										<div class="title">在线客服</div>
										<div class="neiron">手机号、邮箱、密保问题不可用时申诉</div>
									</div>
									<img src="../IMG/右小箭头.png" class="right_xiao"/>
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
		
		
		<!-- 修改头像盒子  -->
			<div id = "updataTx" style = "display:none;">
				<div class = "img_box">
					<div class="cancel">
						<img src="../IMG/叉.png"/>
					</div>
					<div class="txTitle">修改头像</div>
					<div class="avater">
						<span></span>
					</div>
					<div class="tip">图片格式：JPG、JPEG、PNG，大小不超过15M。您的头像将在vivo应用生态内展示，对其他用户可见。</div>
					<div class="btns">
						<div id="btn_left">上传图片
							<input type="file" id = "xuanzeFile" accept="image/*"/>
						</div>
						<div id="btn_right">确认修改</div>
					</div>
				</div>
			</div>
		
		
		<!-- 修改vivo号 -->
			<div class="huibox" style="display: none;" id="upVivoNum">
				<div class = vivo_modify>
					<div class="cancel">
						<img src="../IMG/叉.png"/>
					</div>
					<div class="vivo_box">
						<p class="updatVivotitle">修改vivo号</p>
						<p class="title-tip">可用于登录vivo账号</p>
						<p class="name">新的vivo号</p>
						<input type = "text" class="input" id = "inputval"/>
						<div class="tishi" style="display: none;">请输入vivo号</div>
						<div class="error-box">
							<p>vivo号不能以数字开头，必须使用6-20位字母、数字组成</p>
						</div>
						<div class="btn_os_pc">确认提交</div>
					</div>
				</div>
			</div>
			
			
			
			<!-- 修改密码 -->
			<div class="huibox" id="uppassword" style = "display:none">
				<div class="per_passs">
					<div class="cancel">
						<img src="../IMG/叉.png"/>
					</div>
					<div class="personal_title">修改密码</div>
					<div class="box">
						<div class="user_tip"">原密码</div>
						<div class="oldpwd_box" style="margin-top: 10px">
							<input type="password"  placeholder="请输入旧密码" class="ipt_pwd">
							<div class="eye_box">
								<img src="../IMG/睁眼.png" style="display: none;" id="zy"/>
								<img src="../IMG/闭眼.png" id="by"/>
							</div>
						</div>
						<div class="errtip_box" id = "oldpwdnotTrue">原密码不正确</div>
					</div>
					<div class="box">
						<div class="user_tip">新密码</div>
						<div class="ipt_box" style="margin-top: 10px;">
							<input type="password" placeholder="请输入新密码" class="newPwd"/>
							<div class="eye_box">
								<img src="../IMG/睁眼.png" style="display: none;" id="newpwdZY"/>
								<img src="../IMG/闭眼.png" id="newpwdBY"/>
							</div>
						</div>
						<div class="new_tishi">密码必须为8-16位字母、数字或符号的组合</div>
						<div class="new_pwdtest" style="margin-top: 15px;">
							<input type="password" placeholder="请再次确认密码" maxlength="16" class="ipt_newpwd"/>
						</div>
						<div class = "errtip_box" id = "newpwdnotTrue">两次密码不一致</div>
					</div>
					<div id="btnqueren">完成</div>
				</div>
			</div>
		
			<!-- 修改昵称 -->
			<div class="huibox" id="upnickname" style="display: none;">
				<div class="upnamebox">
					<div class="cancel">
						<img src="../IMG/叉.png"/>
					</div>
					<div class="title_nick">设置昵称，让大家认识你</div>
					<div class="ipt">
						<input type="text" placeholder="输入昵称" id="nameVal"/>
					</div>
					<div class="btn_quedin">确定</div>
				</div>
			</div>
		
		
</body>
		<script>
			//鼠标悬停显示修改昵称提示，移开时隐藏
			$('#nickname').hover(function(){
				$('#updataname').show();
			},function(){
				$('#updataname').hide();
			});
			
			//点击修改头像
			$('#avatar').click(function(){
				$('#updataTx').show();
			});
			$('.cancel').click(function(){
				$('#updataTx').hide();
			});
			
			var selectedFile = null;
			//获取选择的文件
			 $('#xuanzeFile').change(function(event) {
				  selectedFile = $(this).prop('files')[0]; // 获取用户选择的文件
				    
				    // 读取文件内容并更新图片
				    var reader = new FileReader();
				    reader.onload = function(event) {
				        $('.avater span').css('background-image', 'url(' + event.target.result + ')'); // 更新背景图片的URL
				    };
				    reader.readAsDataURL(selectedFile);
				    
				    // 启用确认按钮
			        $('#btn_right').css({
			            'cursor': 'pointer',
			            'pointer-events': 'auto',
			            'background-color':'#456fff',
			        });
			 });
			 $('#btn_right').click(function(){
				 $('#updataTx').hide()
				 var re = new FileReader();
				 re.onload = function(event) {
				      $('#avater span').css('background-image', 'url(' + event.target.result + ')'); // 更新背景图片的URL
				 };
				 re.readAsDataURL(selectedFile);
				 console.log(selectedFile)
			 })
			 
			 
			 //修改vivo号
			 $('#upvivo').click(function(){
					$('#upVivoNum').show()
				})
			 $('.cancel').click(function(){
					$('.huibox').hide();
					$('#inputval').val("");
				})
				
				 $('.input').focus(function(){
				 	$('.tishi').hide()
				 })
				
				$('.btn_os_pc').click(function(){
						var inputValues = $('.input').val();
						// 获取输入框的值
					    var inputValue = $('.input').val();
					
					    // 判断输入框的值是否以数字开头
					    var firstCharacter = inputValue.charAt(0);
					    var isDigit = /^\d$/.test(firstCharacter);
					    // 如果输入框的值不是以数字开头，则执行相应操作
						if($('.input').val()!=""){
							if (!isDigit) {
							   if(inputValue.length<=20&&inputValue.length>=6){
								   $.ajax({
									   type:'GET',
									   url:'updataVivoNumServlets',
									   data:{
										   vivonum:inputValue
									   },success:function(key){
										   if(key=="true"){
											   layer.msg("修改成功!",{icon:1,time:1200})
										   }else if(key=="false"){
											   layer.msg("修改失败!",{icon:2,time:1200})
										   }
									   }
								   })
							   }else{
								   //添加抖动动画
								   $('.error-box p').addClass("shake-animation");
								   $('.error-box p').css('color','#f51200')
								   	setTimeout(function() {
								   	$('.error-box p').removeClass("shake-animation");
									$('.error-box p').css('color','');
								   }, 500);
							   }
							} else {
							    //添加抖动动画
								$('.error-box p').css('color','#f51200')
							    $('.error-box p').addClass("shake-animation");
							    	setTimeout(function() {
									$('.error-box p').css('color','');
							    	$('.error-box p').removeClass("shake-animation");
							    }, 500);
							}
						}else{
							$('.tishi').show()
						}
				})
				
				
				
				//修改密码
				$('#upnumpass').click(function(){
					$('#uppassword').show()
				})
				
				//修改密码区域
					//密码明文开关显示
				$('#by').click(function(){
					$(this).hide()
					$('#zy').show()
					$('.ipt_pwd').attr("type",'text')
				})
				$('#zy').click(function(){
					$('#by').show()
					$('#zy').hide()
					$('.ipt_pwd').attr("type",'password')
				})
				
				
				$('#newpwdBY').click(function(){
					$(this).hide()
					$('#newpwdZY').show()
					$('.newPwd').attr("type",'text')
				})
				$('#newpwdZY').click(function(){
					$('#newpwdBY').show()
					$('#newpwdZY').hide()
					$('.newPwd').attr("type",'password')
				})
				
				
				//点击完成进行判断
				$('#btnqueren').click(function(){
				    if($('.ipt_pwd').val() !== ""){
				        if($('.newPwd').val() !== "" && $('.newPwd').val().length >= 8 && $('.newPwd').val().length <= 16){
				            if($('.ipt_newpwd').val()!="" && $('.ipt_newpwd').val()==$('.newPwd').val()){
								$.ajax({
									type:'GET',
									url:'UpdataPasswordTestServlets',
									data:{
										oldpwd:$('.ipt_pwd').val(),
										newpwd:$('.newPwd').val()
									},success:function(key){
										if(key=="true"){
											layer.msg("修改成功!",{icon:1,time:1200})
											$('.ipt_pwd').val('');
											$('.newPwd').val('');
											$('.ipt_newpwd').val('');
										}else if(key=="false"){
											$('#oldpwdnotTrue').show();
										}
									}
								})
							}else{
								$('#newpwdnotTrue').show()
							}
				        } else {
				           //添加抖动动画
				           $('.new_tishi').addClass("shake-animation");
						   $('.new_tishi').css('color','red');
				           	setTimeout(function() {
				           	$(".new_tishi").removeClass("shake-animation");
							$('.new_tishi').css('color','');
				           }, 500);
				        }
				    } else {
				        alert("请输入旧密码");
				    }
				});
				
				$('.ipt_newpwd').focus(function(){
					$('#newpwdnotTrue').hide()
				})
				
				$('.ipt_pwd').focus(function(){
					$('#oldpwdnotTrue').hide()
				})
				
				
				//修改昵称
				$('#nickname').click(function(){
					$('#upnickname').show()
					$('#nameVal').val("")
				})
				
				$('.btn_quedin').click(function(){
					    $.ajax({
					        type: 'GET',
					        url: 'updatenickNameServlets',
					        data: {
					            newNickName: $('#nameVal').val(),
					            oldNickName: $('#nickname').val(),
					        },
					        success: function(txt) {
					            if (txt == "false") {
					                alert("修改失败");
					            } else if (txt != null) {
					                var namenvl = txt;
					                $('#nickname').text(namenvl);
					                layer.msg('修改成功！', {icon: 1})
					                $('#upnickname').hide();
					     
					            } else {
					                alert("更新失败");
					            }
					        }
					    });
					  });
				
				//刷新页面数据
				$.ajax({
					type:'GET',
					url:'selectAllCenterDataServlets',
					dataType: 'json',
					success:function(txt){
						var data = txt;
						console.log(data)
						var vid = (data[0].account_number); //vid
						var nickname = (data[0].user_name);	//昵称
						var phone = (data[0].phone);//手机
						var mailbox = (data[0].mailbox)//邮箱
						var imageurl =	(data[0].head_image_url) //头像url
						$('#nickname').text(nickname);
						$('.pid').text(vid);
						$('#avatar span').css('background-image','url('+imageurl+')');
					}
				})
		</script>
</html>