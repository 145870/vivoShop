<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
	</head>
	
	
	<link rel="stylesheet" href="../CSS/my_Mall.css"/>
	

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
					<span class="geren page" >个人中心</span>
				</div>
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
							<dd><a id="myorder"href="my_order.jsp">我的订单</a></a></dd>
							<dd><a id="tuikuan"href="AfterSales.jsp">退款/售后</a></a></dd>
						</div>
						<div id="two_list">
							<dt class="dt">评价管理</dt>
							<dd><a id="pinjia"href="evaluate.jsp">评价晒单</a></a></dd>
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
					
					
					
					
					
					<!-- 个人中心开始 -->
					<!--  -->
					<div id="Personal_Center">
					<div id="right_box_two">
					<div id="right_box_head">
						<div id="huanyin">您好，浮生，欢迎进入个人中心！</div>
						<div id="two_head">
							<span id="myjifen">我的积分：</span>
							<a id="jf">312</a>
							<a id="jinru">进入积分商城></a>
							<span id="oldtime">最后一次登录时间为：2024-03-15 08:25</span>
						</div>
					</div>
					<!-- 右边图标栏 -->
					<div id="right_box_center">
						<div id="tubiaolan">
							<ul>
								<li class="item">未付款订单
									<a>0</a>
								</li>
								<li class="item two">评论和回复
									<a>0</a>
								</li>
								<li class="item three">优惠券
									<a>0</a>
								</li>
							</ul>
						</div>
						<!-- 最近的订单 -->
						<div id="zj_maxbox">
							<div id="zuijindindan">最近的订单</div>
							<div id="table_box">
							<table id="dindan_table" border="1">
								<tr>
									<td>订单号</td>
									<td>金额</td>
									<td>下单日期</td>
									<td>状态</td>
									<td>操作</td>
								</tr>
								<tr>
									<td>792798253593143360</td>
									<td>2096.00</td>
									<td>2024-03-12 09:29:19</td>
									<td>已取消</td>
									<td><a>查看订单</a></td>
								</tr>
								<tr>
									<td>792798253593143360</td>
									<td>2096.00</td>
									<td>2024-03-12 09:29:19</td>
									<td>已取消</td>
									<td><a>查看订单</a></td>
								</tr>
								<tr>
									<td>792798253593143360</td>
									<td>2096.00</td>
									<td>2024-03-12 09:29:19</td>
									<td>已取消</td>
									<td><a>查看订单</a></td>
								</tr>
								<tr>
									<td>792798253593143360</td>
									<td>2096.00</td>
									<td>2024-03-12 09:29:19</td>
									<td>已取消</td>
									<td><a>查看订单</a></td>
								</tr>
							</table>
							</div>
						</div>
					</div>
					<div id="">最近浏览</div>
						<div id="liulanPonebox">
						<ul id="zuijinliulan">
							<li class="li">
								<a>
									<img  src="../IMG/vivoX10Pro.png"/>
									<p>vivo X 100 Pro</p>
								</a>
							</li>
							<li class="li">
								<a>
									<img src="../IMG/vivoS18.png"/>
									<p>vivo S18</p>
								</a>
							</li>
							<li class="li">
								<a>
									<img src="../IMG/IQOO12.png"/>
									<p>vivo X 100 Pro</p>
								</a>
							</li>
							<li class="li">
								<a>
									<img src="../IMG/IQOO Noe9 Pro.png"/>
									<p>IQOO Noe9 Pro</p>
								</a>
							</li>
						</ul>
						</div>
					</div>
				</div>
				<!-- 个人中心结束 -->
				
				<!-- 退款/售后开始 -->
				<div id="refund" style="display: none;">退款售后</div>
				<!-- 退款/售后结束 -->
				
				<!-- 评价晒单开始 -->
				<div id="evaluate" style="display: none;">评价晒单</div>
				<!-- 评价晒单结束 -->
				
				<!-- 个人资料开始 -->
				<div id="personal_data" style="display: none;">
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
	
	//实现下级导航
	$('.page:first').show()
	$('.page:not(:first)').hide()
		
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