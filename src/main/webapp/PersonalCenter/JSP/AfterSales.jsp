<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
	</head>

	<link rel="stylesheet" href="../CSS/AfterSales.css"/>
	
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
					<span class="page">退款售后</span>
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
							<dd><a id="tuikuan"  style="background-color: rgb(253, 234, 236);color: rgb(240, 65, 65);">退款/售后</a></dd>
						</div>
						<div id="two_list">
							<dt class="dt">评价管理</dt>
							<dd><a id="pinjia" href="evaluate.jsp">评价晒单</a></dd>
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
			
				<!-- 退款/售后开始 -->
				<div id="refund">
					<dl>
						<dt class="tuikuan_title">退款/售后查询</dt>
						<div>
							<div class="beijin">
								<div>商品名称</div>
								<div>服务类型</div>
								<div>状态</div>
								<div>操作</div>
							</div>
							<div class="not_data">
								<img src="../IMG/空数据.png"/>
								<div class="tips">您还没有退款/售后订单</div>
							</div>
						</div>
					</dl>
				</div>
				<!-- 退款/售后结束 -->
				
				
				<!-- 收货地址开始 -->
				<!-- 收货地址结束 -->
				
				<!-- 我的收藏开始 -->
				<div id="My_favorites" style="display: none;">我的收藏</div>
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
		
		
	//退款售后
		$('#tuikuan').click(function(){
			$('#refund').show()
			$('#Personal_Center,#evaluate,#personal_data,#Receiving_address,#My_favorites,#myorder_box').hide()
		})
	</script>
</html>