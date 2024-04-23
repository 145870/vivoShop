<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="">
<div id="box">
		<div id="tou">
			<div style="width:1433px;display: flex;margin: 0 auto;">
				<ul id="left">
					<li>品牌</li>
					<li>OriginOS</li>
					<li>体验店</li>
					<li>官网社区</li>
				</ul>
			<ul id="you">
				<img id="xiazai" src="/vivoShop/front/image/下载.png" />
				<li>下载APP</li>
				<li><a style="text-decoration:none;color:rgb(255,255,255)" href="/vivoShop/PersonalCenter/shopping_cart.jsp">购物车</a></li>
				<li id="geren" style="position: relative;">
				个人中心
				<div id="deng_kuang">
				<c:choose>
   					<c:when test="${user_profile == null}">
        			<div id="gerenbox" style="display: flex; flex-direction: column;">
    					<a href="/vivoShop/PersonalCenter/JSP/login.jsp" style="flex: 1;text-align: center; line-height: 35px">
        					登录
    					</a >
    					<a href="/vivoShop/PersonalCenter/JSP/register.jsp" style="flex: 1; text-align: center; line-height: 35px">
       						注册
   						 </a >
					</div>
    				</c:when>
    			<c:otherwise>
			        <div id="gerenbox" style="display: flex;height:105px; flex-direction: column;">
    					<a href="/vivoShop/PersonalCenter/JSP/my_Mall.jsp" style="flex: 1; text-align: center; line-height: 35px">
        					我的商城
    					</a >
    					<a href="/vivoShop/PersonalCenter/JSP/my_order.jsp" style="flex: 1; text-align: center; line-height: 35px">
       						我的订单
   						 </a >
   						 <a href="/vivoShop/PersonalCenter/JSP/AccountCenter.jsp" style="flex: 1; text-align: center; line-height: 35px">
       						账户中心
   						 </a >
					</div>
    			</c:otherwise>
				</c:choose>
					
				</div>
				</li>
			</ul>
			</div>
		</div>
		
		<div id="head">
			<div id="tu">
				<img src="/vivoShop/front/image/vivo.svg" id="vivo" />
			</div>

			<ul id="head-nav" class="nav">
				 <c:forEach items="${leilist}" var="lei">
						<li><a id="leia" href="LunboXServlet?cid=${lei.id }">${lei.className}</a></li>
				</c:forEach>
				<li>商城</li>
			</ul>

			<div id="so">
				<img src="/vivoShop/front/image/搜索.png" / id="sou">
			</div>
			<div id="navDiv" style="z-index: 1000;">
				<c:forEach items = '${leilist}' var='type' varStatus = 'typeLoop'>
					<div class="navDiv">
						<div class="rebox">
							<div class="re" style='padding:20px;padding-left:80px'>
								<div class="tubox">
									<c:forEach items="${productsLists[typeLoop.index]}" var="pi" varStatus="loop">
   										<c:if test="${loop.index < 6}">
       										<a id="aaa" href="/vivoShop/front/jsp/DetailsServlet?id=${pi.information_id}">
           										<div class='tu-div'>
               										<img class="tupianx" alt="" src="${pi.url}">
                									<p style="">${pi.information_name}</p>
           										</div>
       										</a>
    									</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
				<div id="sss">
					<div id="sss-box">

						<div id="sou-shang">
							<img src="/vivoShop/front/image/vivo.svg" id="sou-vivo" />
							<form id="form">
								<input placeholder="iQOO Neo9" id="form-in" />

							</form>
							<div id="sou-div">
								<img src="/vivoShop/front/image/搜索.png" id="sou-tu" />
							</div>
							<span id="span-X">X</span>

						</div>
						<div id="x"></div>
						<ul id="sou-ul">
							<li>大家都在搜</li>
							<li><a href="">iQOO Neo9</a></li>
							<li><a href="">S18系列</a></li>
							<li><a href="">X100系列</a></li>
							<li><a href="">X Flip</a></li>
							<li><a href="">X Fold2</a></li>
							<li><a href="">查找体验店</a></li>
							<li><a href="">vivo Pad2</a></li>
							<li><a href="">iQOO 12</a></li>
						</ul>
					</div>
				</div>
			</div>
			</div>
			
</body>
<script type="text/javascript">
$(document).ready(function() {
	var geren = $('#geren');
	var deng_kuang = $('#deng_kuang');

	// 添加鼠标移入事件监听器
	geren.mouseenter(function() {
		deng_kuang.css('display', 'block');
	});

	// 添加鼠标移出事件监听器到 #deng_kuang
	deng_kuang.mouseleave(function() {
		deng_kuang.css('display', 'none');
	});

});
</script>
</html>