<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
	</head>
	
	<!-- 引入 layui.css -->
	<link href="//unpkg.com/layui@2.9.8/dist/css/layui.css" rel="stylesheet">
	<!-- 引入 layui.js -->
	<script src="//unpkg.com/layui@2.9.8/dist/layui.js"></script>
	
	<link rel="stylesheet" href="../CSS/ReceivingAddress.css"/>
	<script src="../jquery-3.5.1.min.js"></script>
	<style>
		blockquote, body, button, dd, div, dl, dt, form, h1, h2, h3, h4, h5, h6, input, li, ol, p, pre, td, textarea, th, ul {
				margin: 0 auto;
			}
	</style>

	
	</head>
	<body>
		
		<div id="context">
			<div id="context_head">
				<div id="Mall_homepage">
					<a>商城首页</a>
					<img src="../IMG/右箭头.png" class="right_j"/>
					<span class="geren page" ><a href="my_Mall.jsp">个人中心</a></span>
					<img src="../IMG/右箭头.png" class="right_j"/>
					<span class="page">收货地址</span>
			</div>
			
			<div id="center_box">
				<div id="left_box">
					<ul>
						<li>
							<a><img src="../IMG/tx.png"/ " id="img_tx"></a>
						</li>
						<li id="name">浮生</li>
						<li id="jifen">我的积分：<a><span>312</span></a></li>
					</ul>
					<dl id="left_list">
						<div id="one_list">
							<dt class="dt">交易管理</dt>
							<dd><a id="myorder" href="my_order.jsp">我的订单</a></dd>
							<dd><a id="tuikuan"><a href="AfterSales.jsp">退款/售后</a></a></dd>
						</div>
						<div id="two_list">
							<dt class="dt">评价管理</dt>
							<dd><a id="pinjia" href="evaluate.jsp">评价晒单</a></dd>
						</div>
						<div id="three_list">
							<dt class="dt">我的账户</dt>
							<dd><a id="gerenziliao" href="PersonalData.jsp">个人资料</a></dd>
							<dd><a id="shouhuo"style="background-color: rgb(253, 234, 236);color: rgb(240, 65, 65);">收货地址</a></dd>
							<dd><a id="shoucang" href="MyFavorites.jsp">我的收藏</a></dd>
						</div>
					</dl>
				</div>
				
				
				
				
				<!-- 右半部分主页面 -->
				<div id="right_box">
					
					

				
				
				
				<!-- 我的订单开始 -->
				<!-- 我的订单结束 -->
				
				<!-- 退款/售后开始 -->
				<!-- 退款/售后结束 -->
				
				<!-- 评价晒单开始 -->
				<!-- 评价晒单结束 -->
				
				<!-- 个人资料开始 -->
				<!-- 个人资料结束 -->
				
				<!-- 收货地址开始 -->
				<div id="Receiving_address">
					<div id="shouhuo_title">
						<span id="dizhi_title">收货地址(<span>1</span>)个</span>
						<span id="max_tianjia">最多可添加(20个)收货地址</span>
					</div>
					<div id="Max_dizhibox">
						<ul>
							<li>
								<label class="newdizhi">
								<span>添加新地址</span>
								</label>
							</li>
							<li>
								<label class="inner">
									<div class="item_top">
										<span>苏宛琪</span>
										<span>193****9678</span>
									</div>
									<div>
										<p>湖南省 株洲市 芦淞区 王塔冲社区27栋</p>
									</div>
								</label>
								<div class="oper">
									<span>删除</span>
									<span>编辑</span>
								</div>
							</li>
							
						</ul>
					</div>
				</div>
				<!-- 收货地址结束 -->
				
				<!-- 我的收藏开始 -->
				<div id="My_favorites" style="display: none;">我的收藏</div>
				<!-- 我的收藏结束 -->
				
				</div><!-- 右半部分主页面结束标记 -->
			</div>
		</div>
	</body>
	
	<!-- Jq脚本 -->
	<script>
	
		
	$('#Max_dizhibox ul li').hover(function(){
		$(this).find($('.oper')).show()
	})
	$('#Max_dizhibox ul li').mouseleave(function(){
		$(this).find($('.oper')).hide()
	})
	
		

	</script>
</html>