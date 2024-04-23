<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
	</head>
	
	<link rel="stylesheet" href="../CSS/my_order.css"/>


	
	</head>
	<script type="text/javascript" src="/vivoShop/static/jquery-3.5.1.min.js"></script>
	
	
	<link rel="stylesheet" href="/vivoShop/static/css/headNav.css" />
	<script type="text/javascript" src="/vivoShop/static/js/setNav.js"></script>
	<script type="text/javascript" src="/vivoShop/front/js/vivohome.js"></script>
	<body>
		<div>
		<jsp:include page="/static/jsp/head.jsp"></jsp:include>
		</div>
		
		<div id="context">
			<div id="context_head">
				<div id="Mall_homepage">
					<a>商城首页</a>
					<img src="../IMG/右箭头.png" class="right_j"/>
					<span class="geren page" ><a href="my_Mall.jsp">个人中心</a></span>
					<img src="../IMG/右箭头.png" class="right_j"/>
					<span class="page">我的订单</span>
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
							<dd><a id="myorder" style="background-color: rgb(253, 234, 236);color: rgb(240, 65, 65);">我的订单</a></dd>
							<dd><a id="tuikuan"><a href="AfterSales.jsp">退款/售后</a></a></dd>
						</div>
						<div id="two_list">
							<dt class="dt">评价管理</dt>
							<dd><a id="pinjia" href="evaluate.jsp">评价晒单</a></a></dd>
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
				<dl id="myorder_box">
					<dt id="myorder_tite">我的订单</dt>
					<ul id="head_list">
						<li class = "current"><a>全部订单</a></li>
						<li class = "current"><a>待付款</a></li>
						<li class = "current"><a>待收货</a></li>
						<li class = "current"><a>已完成</a></li>
						<li class = "current"><a>已关闭</a></li>
					</ul>
					<div id="mydindanbox">
						<div id="mydindanbox_two">
							<div>商品</div>
							<div>数量</div>
							<div>价格</div>
							<div>状态</div>
							<div>操作</div>
						</div>
						<div>
							<div class="order_list">
								<div class="head">
									<div class="left">订单号：<a>705100984726988352</a></div>
									<div class="middle">成交时间：<span>2024-04-15 08:15:56</span></div>
									<div class="right">
										<span class="v-icon">
											<img src="../IMG/删除(1).png"/>
											删除订单
										</span>
									</div>
								</div>
								<div class="main">
									<table border="1" class="table">
										<tr>
											<td rowspan="2" class="img_phone"><img src="../IMG/IQOO Noe9 Pro.png"/></td>
											<td class="shanpinxinxi">
												<span class="xinhao">vivo S18e 12GB+256GB</span>
												<span class="num">1</span>
												<span>1899.00</span>
												
											</td>
											<td rowspan="2">已取消</td>
											<td rowspan="2" id="lookDindan"><a href="#">查看订单</a></td>
										</tr>
										<tr>
											<td class="shanpinxinxi">
												<span class="xinhao">【赠品】：vivo XE710 Type-C接口耳机</span>
												<span class="num">1</span>
												<span>109.00</span>
											</td>
										</tr>
										<tr>
											<td colspan="5" class="yinfu">应付总额：<span>￥</span><span>2297.00</span></td>
										</tr>
									</table>
								</div>
								<div></div>
							</div>
						</div>
					</div>
				</dl>
				<!-- 我的订单结束 -->
				
				<!-- 退款/售后开始 -->
				<!-- 退款/售后结束 -->
				
				<!-- 评价晒单开始 -->
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
		<div>
		<jsp:include page="/static/jsp/end.jsp"></jsp:include>
		</div>
	</body>
	
	<!-- Jq脚本 -->
	<script>
	
		
	//个人中心
		//点击左边导航栏改变样式
		$('#left_list a').click(function(){
		        // 设置当前选中链接的样式
		        $(this).css({
		            'background-color': 'rgb(253,234,236)',
		            'color': '#f04141'
		        });
		        
		        // 将其他标题下的链接恢复成原来的样式
		        $('#left_list a').not(this).css({
		            'background-color': '',
		            'color': ''
		        });
		});
		$('.geren').click(function(){
			$('#Personal_Center').show()
			$('#myorder_box,#refund,#evaluate,#personal_data,#Receiving_address,#My_favorites').hide()
			$('#left_list a').css({
				'background-color':'',
				'color':''
			})
		})
		
		
		
	//我的订单
		
		//改变标题下面导航栏样式
		$('.current a').click(function(){
			$(this).css({
				'color':'#f10313',
				'border-bottom':'3px solid #f10313',
				'padding-bottom':'10px'
			})
			//除了当前元素其他兄弟元素样式恢复
			$('.current a').not(this).css({
				'color':'',
				'border-bottom':'',
				'padding-bottom':''
			})
		})
		$('#myorder').click(function(){
			$('#myorder_box').show()
			$('#Personal_Center,#refund,#evaluate,#personal_data,#Receiving_address,#My_favorites').hide()
		})
		
		
	
	</script>
</html>