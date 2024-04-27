<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
	</head>
	

	
	<link rel="stylesheet" href="../CSS/MyFavorites.css"/>
	<script type="text/javascript" src="/vivoShop/static/jquery-3.5.1.min.js"></script>	
	<link rel="stylesheet" href="/vivoShop/static/css/headNav.css" />
	<script type="text/javascript" src="/vivoShop/static/js/setNav.js"></script>
	<script type="text/javascript" src="/vivoShop/front/js/vivohome.js"></script>
	
	
	</head>
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
					<span class="page">我的收藏</span>
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
							<dd><a id="shouhuo" href="ReceivingAddress.jsp">收货地址</a></dd>
							<dd><a id="shoucang" style="background-color: rgb(253, 234, 236);color: rgb(240, 65, 65);">我的收藏</a></dd>
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
				<!-- 收货地址结束 -->
				
				<!-- 我的收藏开始 -->
				<div id="My_favorites">
					<div>
						<div class="title">我的收藏</div>
						<div>
							<div style="width: 960px;">
								<table class="common">
									<thead>
										<th></th>
										<th>商品名称</th>
										<th>金额</th>
										<th>收藏时间</th>
										<th>商品状态</th>
										<th>操作</th>
									</thead>
									<tbody>
										<tr>
											<td><a><img src="../IMG/vivoX10Pro.png"/ id="phone_img"></a></td>
											<td class="phone_title">
												<a>
													<img src="../IMG/秒杀.png" class="nei"/>
													<span class="nei">vivo X100 12GB+256GB 星际蓝</span>
												</a>
											</td>
											<td class="jibenshuju">
												<strong>
													<dfn>￥</dfn>
													3949.00
												</strong>
											</td>
											<td class="jibenshuju">
												<p>2024-03-18 09:49:47</p>
											</td>
											<td class="jibenshuju">
												<p>有货</p>
											</td>
											<td class="caozuo">
												<a>去购买</a>
												<a>删除</a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- 我的收藏结束 -->
				
				</div><!-- 右半部分主页面结束标记 -->
			</div>
		</div>
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
		
		
		

	</script>
</html>