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
	
	<link rel="stylesheet" href="../CSS/evaluate.css"/>
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
					<span class="page">评价晒单</span>
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
							<dd><a id="pinjia"  style="background-color: rgb(253, 234, 236);color: rgb(240, 65, 65);">评价晒单</a></dd>
						</div>
						<div id="three_list">
							<dt class="dt">我的账户</dt>
							<dd><a id="gerenziliao" href="PersonalData.jsp">个人资料</a></dd>
							<dd><a id="shouhuo" href="ReceivingAddress.jsp">收货地址</a></dd>
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
				<div id="evaluate">
					<div>
						<dl class="member_order_list">
							<dt class="title">评价晒单</dt>
							<dd>
								<ul class="ul">
									<li class = "current" id="mypingjia" style="border-bottom: 3px solid #000;"><a>我的评价</a></li>
									<li class = "current" id="yipingjia"><a>已评价</a></li>
								</ul>
								<div class="list-caption">
									<div>商品详情</div>
									<div>操作</div>
								</div>
								<div class="not_data">
									<img src="../IMG/空评价.png"/>
									<div>暂时还没有任何评价</div>
								</div>
								<div style="display: none;" class="not_data_two">
									<img src="../IMG/空评价.png"/>
									<div>暂时还没有任何商品</div>
								</div>
							</dd>
						</dl>
					</div>
				</div>
				<!-- 评价晒单结束 -->
				
				<!-- 个人资料开始 -->
				
				<!-- 个人资料结束 -->
				
				<!-- 收货地址开始 -->
				<!-- 收货地址结束 -->
				
				<!-- 我的收藏开始 -->
				<!-- 我的收藏结束 -->
				
				</div><!-- 右半部分主页面结束标记 -->
			</div>
		</div>
	<!-- 	<div id="foot_top"></div>
		<div id="foot_but"></div> -->
	</body>
	
	<!-- Jq脚本 -->
	<script>
	
	$('#mypingjia').click(function(){
		$(this).css('border-bottom','3px solid #000')
		$('#yipingjia').css('border-bottom','')
		$('.not_data').show()
		$('.not_data_two').hide()
	})
	$('#yipingjia').click(function(){
		$(this).css('border-bottom','3px solid #000')
		$('#mypingjia').css('border-bottom','')
		$('.not_data').hide()
		$('.not_data_two').show()
	})
		

	</script>
</html>