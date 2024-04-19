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
						<span id="nickname">浮生</span>
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
								<div><span class="big_title">vivo号</span><span class="pid">vid_uo0023182857</span><div id="gth_box"><img src="../IMG/提示.png"/></div></div>
								<div class="jieshao"><span>用于vivo账号登录</span></div>
							</div>
							<div class="operate">
								<span>修改</span>
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
								<span>修改</span>
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
								<span>修改</span>
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
								<span>修改</span>
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
								<span>修改</span>
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
			//获取选择的文件
			 $('#xuanzeFile').change(function(event) {
				 var selectedFile = $(this).prop('files')[0]; // 使用另一种方式获取用户选择的文件
				 var fileType = selectedFile.type;
				 console.log(selectedFile.name)
			 });
		</script>
</html>