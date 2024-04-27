<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="../CSS/shopping_cart.css"/>
	</head>
	<script type="text/javascript" src="/vivoShop/static/jquery-3.5.1.min.js"></script>	
	<link rel="stylesheet" href="/vivoShop/static/css/headNav.css" />
	<script type="text/javascript" src="/vivoShop/static/js/setNav.js"></script>
	<script type="text/javascript" src="/vivoShop/front/js/vivohome.js"></script>

	<body>
		<div>
		<jsp:include page="/static/jsp/head.jsp"></jsp:include>
		</div>
		<div id="shopping-cart">
			<!-- 购物车总页 -->
		<div class="clearfix">
		<div class="wrapper">
			<div class="cart_title">
				<span>我的购物车</span>
				<a>继续购物</a>
			</div>
			<div class="cart_head">
				<table class="order_table">
					<tr>
						<th class="check_col">
							<label>
								<li class="checkbox"><input type="checkbox" class="check select_all"/></li>
								<a>全选</a>
							</label>
						</th>
						<th class="goods_col">商品名称</th>
						<th class="price_col">价格（元）</th>
						<th class = "col">数量</th>
						<th class = "col">优惠</th>
						<th class = "col">小计（元）</th>
						<th class = "col">操作</th>
					</tr>
				</table>
			</div>
			
		
		<!-- 商品内容 -->
		<div id="bigshopbox">
			
			
			<c:forEach items = "${carData}" var ="shoppingcar">
			<div class="shop_cart_wrap" pid="${shoppingcar.pid}">
			<div class="prod_list_wrap">
				<table class="order_table_two">
					<tr>
						<td class="check_col_two"><i><input type="checkbox" class="check check_btn"/></i></td>
						<td class="prod_pic">
							<a>
								<div><img src='${shoppingcar.image}'/></div>
							</a>
						</td>
						<td class="goods_col">
							<a class="goods_link"><span>${shoppingcar.name} &nbsp; ${shoppingcar.vals}</span></a>
							
						</td>
						<td class="price_col_two">${shoppingcar.price}</td>
						<td class="number">
							<span class="number_box">
								<a class="jian_num">-</a>
								<input type="number" class="prod_num" min="1" readonly="readonly" value="${shoppingcar.num}"/>
								<a class="jia_num">+</a>
							</span>
						</td>
						<td>
							<span>0.00</span>
						</td>
						<td class="xiaoji">${shoppingcar.sumPrice}</td>
						<td class="bianji">
							<a class="favorite" data-id="${shoppingcar.pid}">加入到收藏夹</a>
							<br />
							<a class="dele" data-id = "${shopping.id}">删除</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</c:forEach>
			
			
		</div>
		
		<!-- 结算 -->
		<div class="cart_bottom">
			<div>
				<div class="toolbal_wrapper">
					<div class="toolbal_wrapper_inner">
						<div class="option">
							<ul>
								<li>
									<label>
										<i class="li"><input type="checkbox" class="check select_all"/></i>
										<a class="all_xuan">全选</a>
									</label>
								</li>
								<li><a class = "red">删除选中的商品</a></li>
								<li><a class = "red">移入收藏夹</a></li>
							</ul>
						</div>
						<div class="cart_toolbar_rught">
							<table>
								<tr>
									<td class="sum_area">
										<p class="sum_area_info">
											已选商品
											<em><b id="yixuan_num">0</b></em>
											件，合计（不含运费）：
											<b class="price_large">
												<dfn>￥</dfn>
												<span class="total_price">0.00</span>
											</b>
										</p>
										<p class="sum_area_price">
											（商品总价：
											<span>
												<dfn>￥</dfn>
												<span class="total_price">0.00</span>
											</span>
											优惠：
											<span>
												<dfn>￥</dfn>
												<span>0.00</span>
											</span>
											）
										</p>
									</td>
									<td class="btn_area">
										<button class="v-btn">去结算</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="wrapper_bottom">
			<div class="prouct_show_title">猜你喜欢</div>
			<div>
				<ul class="box_list">
					<li class = "box">
						<a><img src="../IMG/手表.png"/></a>
						<div class="prodinfo">
							<p class="name">vivo WATCH 2 智能手表 原力黑</p>
							<p class="feature">温馨提示:移动、电信eSD务升级中，暂不支持新开通;联通用户可前往营业厅或中国联通APP开通;具体情况以当地运营商政策为准。</p>
							<p class="price_rmb">819</p>
						</div>
					</li>
					<li class = "box">
						<a><img src="../IMG/耳机.png"/></a>
						<div class="prodinfo">
							<p class="name">iQOO TWS Air 真无线耳机 星耀黄</p>
							<p class="feature">14.2mm牛物碳纤维动器MonsterSoum非电竞声效3.5≤超轻无感佩戴|双麦 江 高清开黑25h 超长续航</p>
							<p class="price_rmb">199</p>
						</div>
					</li>
					<li class = "box">
						<a><img src="../IMG/平板.png"/></a>
						<div class="prodinfo">
							<p class="name">vivo Pad平板电脑 8GB+128GB 天蓝色</p>
							<p class="feature">跨屏协同办公|高通870芯片|120Hz超感原色屏 |内含44W充电套装，不包含手写笔、键盘、双面夹</p>
							<p class="price_rmb">1679</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
		
		</div>
		</div>
		</div>
		<div>
		<jsp:include page="/static/jsp/end.jsp"></jsp:include>
		</div>
	</body>
	
	<script>
		$('.jia_num').click(function(){
		    var $row = $(this).closest('tr'); // 获取点击按钮所在行的父元素
		    var $input = $row.find('.prod_num'); // 在该行内查找输入框
		    var currentValue = parseInt($input.val()); // 获取当前输入框的值并转换为整数
		    var $price = $row.find('.price_col_two'); // 获取单价的元素
		    var price = parseFloat($price.text()); // 获取单价并转换为浮点数
			var $jiage = $row.find('.price_col_two');
			var jiage = parseInt($jiage.text());//当前商品单价
		
		    if(currentValue < 5){ // 如果当前值小于 5
		        var newnumber = currentValue + 1; // 将当前值加 1
		        $input.val(newnumber); // 更新输入框的值
		        var $subtotal = $row.find('.xiaoji'); // 获取小计的元素
		        var subtotal = newnumber * price; // 计算新的小计值
		        $subtotal.text(subtotal.toFixed(2)); // 更新小计的值并保留两位小数
				
				$('.check_btn').change();//手动触发
				
				
		    }

			
			//添加动画
			
			$(this).addClass('shadow-effect');//添加阴影效果类
			setTimeout(function(){
				$('.jia_num').removeClass('shadow-effect');//去除阴影效果类
			},300)//设置延时时间，和过渡时间一致
			
		});
		
		   $('.jian_num').click(function(){
		       var $row = $(this).closest('tr'); // 获取点击按钮所在行的父元素
		       var $input = $row.find('.prod_num'); // 在该行内查找输入框
		       var currentValue = parseInt($input.val()); // 获取当前输入框的值并转换为整数
		       var $price = $row.find('.price_col_two'); // 获取单价的元素
		       var price = parseFloat($price.text()); // 获取单价并转换为浮点数
		   
		       if(currentValue > 1){ // 如果当前值大于 1
		           var newnumber = currentValue - 1; // 将当前值减 1
		           $input.val(newnumber); // 更新输入框的值
		           var $subtotal = $row.find('.xiaoji'); // 获取小计的元素
		           var subtotal = newnumber * price; // 计算新的小计值
		           $subtotal.text(subtotal.toFixed(2)); // 更新小计的值并保留两位小数
				   
				   $('.check_btn').change();//手动触发
		       }
			
			//添加动画
			
			$(this).addClass('shadow-effect');//添加阴影效果类
			setTimeout(function(){
				$('.jian_num').removeClass('shadow-effect');//去除阴影效果类
			},300)//设置延时时间，和过渡时间一致
			
		});


		//勾选全选
		$('.select_all').click(function(){
			//获取当前复选框状态
			var iSchecked = $(this).prop('checked');  
			//将其他复选框设置和当前一致
			$('.check').prop('checked',iSchecked);
		})
		
		
		
		//获取总价
		$('.select_all').change(function(){
				
				if($(this).prop('checked')){
					 var total = 0;
					 // 初始化总和
					 var num = 0;
					$('.order_table_two tr').each(function(){
					 var price = parseFloat($(this).find('.xiaoji').text())
					 if (!isNaN(price)) {
					    total += price;	
					 }	
					
					 var number = parseInt($(this).find('.prod_num').val());
					 if (!isNaN(num)) {
					 	num += number; // 将数字累加到总和中
					 }
					})
					
					
				
					$('#yixuan_num').text(num)
				 $('.total_price').text(total.toFixed(2))
				 
			}else if(!$(this).prop('checked')){
				 $('.total_price').text('0.00')
				 $('#yixuan_num').text('0')
			}{
				
			}
		})
		
		//勾选商品增减总价
		$('.check_btn').change(function(){
			var total=0.0;
			var oi=0;
			$('.check_btn').each(function(){
				var $row=$(this).parent().parent().parent()
				if($(this).prop('checked')){
					var $price = $row.find('.xiaoji');//查找当前父元素下存放价格的元素
					var moneny = parseInt($price.text());//将价格转换为浮点数
					total+=moneny;
					
					 // 获取当前行中的选择数量文本框的值并将其转换为数字，然后加到 total 中
					 var $quantity = $row.find('.prod_num');
					 var quantityValue = parseInt($quantity.val());
					 if (!isNaN(quantityValue)) {
					     oi += quantityValue;
					 }
				}
			})
			$('.total_price').text(total.toFixed(2)); // 将结果保留两位小数并更新总价显示
			$('#yixuan_num').text(oi)
			
			
		})
		
		
		
		//点击获取商品id
		$('.favorite').click(function(event){
			event.preventDefault();
			// 初始化一个变量用于存储父级元素
			var parentElement = $(this).parent();

			// 使用 while 循环逐级向上遍历父级元素，直到找到 .shop_cart_wrap
			while (!parentElement.hasClass('shop_cart_wrap')) {
			    // 继续向上遍历父级元素
			    parentElement = parentElement.parent();
			    
			    // 检查是否已经到达了最顶级的祖先元素，如果是，则跳出循环
			    if (parentElement.length === 0) {
			        break;
			    }
			}
            const pid = parentElement.attr('pid');
            // 发送AJAX请求将商品信息发送给后端
            $.ajax({
            	type:'GET',
            	url:'insertFavoritesServlets',
            	data:{informationId: pid},success:function(){
            		alert("收藏成功！")
            	},error:function(){
            		alert("收藏失败！")
            	}
            })
		})
	</script>
</html>