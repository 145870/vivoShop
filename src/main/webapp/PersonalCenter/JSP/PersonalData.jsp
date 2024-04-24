<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
	</head>
	
	
	<link rel="stylesheet" href="../CSS/PersonalData.css"/>

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
					<span class="page">个人资料</span>
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
							<dd><a id="gerenziliao"   style="background-color: rgb(253, 234, 236);color: rgb(240, 65, 65);">个人资料</a></dd>
							<dd><a id="shouhuo" href="ReceivingAddress.jsp""">收货地址</a></dd>
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
				<div id="personal_data">
					<dl>
						<dt class="geren_title">个人资料</dt>
						<dd>
							<form>
								<table id="geren_table">
									<colgroup>
										<col style="width: 150px;">
									</colgroup>
									<tbody>
										<tr>
											<td class="left_title">当前头像：</td>
											<td class="right_value"><img src="../IMG/tx.png"/></td>
										</tr>
										<tr>
											<td class="left_title">性别：</td>
											<td class="right_value">
												<div id="option_box">
													<label>
														<input type="radio" value="1" name="gender"/>男
													</label>
													<label>
														<input type="radio" value="2" name="gender"/>女
													</label>
												</div>
											</td>
										</tr>
										<tr>
											<td class="left_title">生日：</td>
											<td> <input type="text" class="layui-input" id="ID-laydate-demo" placeholder="yyyy-MM-dd"></td>
										</tr>
										<tr></tr>
										<tr></tr>
									</tbody>
								</table>
							</form>
						</dd>
					</dl>
				</div>
				<!-- 个人资料结束 -->
				
				<!-- 收货地址开始 -->
				<div id="Receiving_address" style="display: none;">
					<div id="shouhuo_title">
						<span id="dizhi_title">收货地址(<span>1</span>)个</span>
						<span id="max_tianjia">最多可添加(20个)收货地址</span>
					</div>
					<div id="Max_dizhibox">
						
					</div>
				</div>
				<!-- 收货地址结束 -->
				
				<!-- 我的收藏开始 -->
				<div id="My_favorites" style="display: none;">我的收藏</div>
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
	
		

	</script>
</html>