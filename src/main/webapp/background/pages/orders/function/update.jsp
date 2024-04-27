<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<!--     <link href="/vivoShop/background/lib/layui/css/layui.css" rel="stylesheet">
	<script type="text/javascript" src="/vivoShop/background/lib/layui/layui.js"></script> -->


</head>
<body>
	<style>
#updateOrders .layui-form {
	margin: 0 auto;
	width: 345px;
	padding: 20px;
}

#updateOrders .layui-form-onswitch {
	border-color: rgb(85, 170, 255);
	background-color: rgb(85, 170, 255);
}

#updateOrders .layui-table-checked {
	background-color: rgb(244, 244, 255);
}

/* 重写 */
#updateOrders .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

#updateOrders .layui-laydate .layui-this, .layui-laydate .layui-this>div
	{
	background-color: rgb(85, 170, 255) !important;
}

/* 重写 */
#updateOrders .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#updateOrders .layui-input-inline span {
	width: 150px;
	text-align: right;
	font-weight: bold;
	margin-right: 10px;
}

#updateOrders .layui-input {
	width: 460px;
}

#updateOrders .layui-input-group {
	margin-bottom: 20px;
}
#updateOrders .layui-input-inline {
    display: flex;
    align-items: center;
    margin-bottom: 30px;
}

#updateOrders .layui-input-inline select {
    margin-right: 10px; /* 调整下拉菜单之间的间距 */
}

#updateOrders .receiving-area .layui-input {
    width: 140px;
    
}
#updateOrders .receiving-area .layui-form-select {
	margin-right: 20px;
}
</style>
	<form class="layui-form" id="updateOrders" style="margin-top: 30px">
		<input name='id' value='${id}' hidden />
		<!-- 收件人 -->
		<div class="layui-input-inline">
			<span>收件人:</span>
			<input value='${address_name}' type="text" name="name" placeholder="请输入姓名"
				class="layui-input right-text">
		</div>

		<!-- 手机号 -->
		<div class="layui-input-inline">
			<span>手机号:</span>
			<input value='${phone}' type="text" name="phone" placeholder="请输入手机号"
				class="layui-input right-text">
		</div>

		<div class="receiving-area layui-input-inline">
			<span style="font-weight: bold;">收货地区:</span>
			<!-- 省 -->
			<select lay-filter="province" name='province' lay-search="">
				<option value="">请选择</option>
				<c:forEach items="${Allprovince}" var='p'>
					<option value="${p.id}"
						<c:if test="${p.name eq province}">selected</c:if>>${p.name}</option>
				</c:forEach>
			</select>

			<!-- 市 -->
			<select lay-filter="city" name='city' lay-search="">
				<option value="">请选择</option>
				<c:forEach items="${Allcity}" var='p'>
					<option value="${p.id}"
						<c:if test="${p.name eq city}">selected</c:if>>${p.name}</option>
				</c:forEach>
			</select>

			<!-- 区 -->
			<select lay-filter="district" name='district' lay-search="">
				<option value="">请选择</option>
				<c:forEach items="${Alldistrict}" var='p'>
					<option value="${p.id}"
						<c:if test="${p.name eq district}">selected</c:if>>${p.name}</option>
				</c:forEach>
			</select>
		</div>

		<div class="layui-input-inline">
			<span>详细地址:</span>
			<textarea style="resize: none;width: 460px;height: 40px" name="address"
				placeholder="详细地址" class="layui-textarea right-text">${address}</textarea>
		</div>

		<div class="layui-input-inline">
			<span>订单状态:</span>
			<select name='state'>
				<option value="">请选择</option>
				<option value="0" <c:if test="${int_orders_status eq 0}">selected</c:if>>未支付</option>
				<option value="1" <c:if test="${int_orders_status eq 1}">selected</c:if>>未发货</option>
				<option value="2" <c:if test="${int_orders_status eq 2}">selected</c:if>>已发货</option>
				<option value="3" <c:if test="${int_orders_status eq 3}">selected</c:if>>已收货</option>
			</select>
		</div>


		<button style="margin-top: 30px; position: absolute; right: 60px;"
			class="layui-btn layui-bg-blue">确认修改</button>
	</form>
	<script type="text/javascript">
		// select 事件
		form.on('select(province)', function(data) {
			var elem = data.elem; // 获得 select 原始 DOM 对象
			var value = data.value; // 获得被选中的值
			var othis = data.othis; // 获得 select 元素被替换后的 jQuery 对象

			var cityselecte = $('#updateOrders select[name="city"]').empty();
			;
			var districtselecte = $('#updateOrders select[name="district"]')
					.empty();
			;
			districtselecte.append('<option value="">请先选择市区</option>');

			if (value === '') {
				cityselecte.append('<option value="">请先选择省份</option>');
				// 重新渲染指定的<select>元素
				form.render('select');
				return;
			}

			//获取市区信息
			$.ajax({
				url : "/vivoShop/static/getSubAreas",
				type : "post",
				data : {
					id : value
				},
				dataType : "json",
				success : function(data) {
					var keys = Object.keys(data); // 获取所有键
					var firstKey = keys[0]; // 获取第一个键
					if (data && Object.keys(data).length > 0) {
						for ( var key in data) {
							cityselecte.append('<option value="'+key+'">'
									+ data[key] + '</option>');
						}
						//再触发
						refreshDistrictselecte(firstKey);
					}

					// 重新渲染指定的<select>元素
					form.render('select');
				},
				error : function(xhr, status, error) {
					//console.log(xhr)	
					layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：'
							+ xhr.statusText, {
						icon : 0
					});
				}
			});
			form.render('select');
		});

		form.on('select(city)', function(data) {
			console.log(1233)
			var elem = data.elem; // 获得 select 原始 DOM 对象
			var value = data.value; // 获得被选中的值
			var othis = data.othis; // 获得 select 元素被替换后的 jQuery 对象

			var districtselecte = $('#updateOrders select[name="district"]')
					.empty();
			;

			if (value === '') {
				districtselecte.append('<option value="">请先选择市区</option>');
				// 重新渲染指定的<select>元素
				form.render('select');
				return;
			}

			//获取市区信息
			$.ajax({
				url : "/vivoShop/static/getSubAreas",
				type : "post",
				data : {
					id : value
				},
				dataType : "json",
				success : function(data) {
					if (data && Object.keys(data).length > 0) {
						for ( var key in data) {
							districtselecte.append('<option value="'+key+'">'
									+ data[key] + '</option>');
						}
					}
					// 重新渲染指定的<select>元素
					form.render('select');
				},
				error : function(xhr, status, error) {
					//console.log(xhr)	
					layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：'
							+ xhr.statusText, {
						icon : 0
					});
				}
			});
			form.render('select');
		});

		function refreshDistrictselecte(value) {
			var districtselecte = $('#updateOrders select[name="district"]')
					.empty();
			;
			//获取市区信息
			$.ajax({
				url : "/vivoShop/static/getSubAreas",
				type : "post",
				data : {
					id : value
				},
				dataType : "json",
				success : function(data) {
					if (data && Object.keys(data).length > 0) {
						for ( var key in data) {
							districtselecte.append('<option value="'+key+'">'
									+ data[key] + '</option>');
						}
					}
					// 重新渲染指定的<select>元素
					form.render('select');
				},
				error : function(xhr, status, error) {
					//console.log(xhr)	
					layer.msg('请求出错，状态码：' + xhr.status + '，状态描述：'
							+ xhr.statusText, {
						icon : 0
					});
				}
			});
			form.render('select');
		}
	</script>
</body>

</html>