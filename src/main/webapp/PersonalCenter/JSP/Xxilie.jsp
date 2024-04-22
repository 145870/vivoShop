<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>

<link rel="stylesheet" href="../CSS/Xcss.css" />
<script type="text/javascript" src="/vivoShop/front/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/vivoShop/front/js/vivohome.js"></script>

<body>
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
    					<a style="flex: 1; text-align: center; line-height: 35px">
        					登录
    					</a>
    					<a style="flex: 1; text-align: center; line-height: 35px">
       						注册
   						 </a>
					</div>
    				</c:when>
    			<c:otherwise>
			        <div id="gerenbox" style="display: flex;height:105px; flex-direction: column;">
    					<a style="flex: 1; text-align: center; line-height: 35px">
        					我的商城
    					</a>
    					<a style="flex: 1; text-align: center; line-height: 35px">
       						我的订单
   						 </a>
   						 <a style="flex: 1; text-align: center; line-height: 35px">
       						账户中心
   						 </a>
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
			<div id="navDiv">
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

			<div id="body">
				
			</div>
			<div id="foot">
				<div id="tt">
					<p>
						<img src="/vivoShop/front/image/正品保障.png" />官方正品
					</p>
					<p>
						<img src="/vivoShop/front/image/寄快递.png" />急速物流
					</p>
					<p>
						<img src="/vivoShop/front/image/全国联保.png" />全国联保
					</p>
					<p>
						<img src="/vivoShop/front/image/免费定制.png" />免费定制
					</p>
				</div>
				<div id="ww">
					<div id="zz">
						<ul id="wei">
							<li>
								<dl>
									<dt>了解产品</dt>
									<dd>
										<a href="">X系列</a>
									</dd>
									<dd>
										<a href="">S系列</a>
									</dd>
									<dd>
										<a href="">T系列</a>
									</dd>
									<dd>
										<a href="">Y系列</a>
									</dd>
									<dd>
										<a href="">NEX系列</a>
									</dd>
									<dd>
										<a href="">iQOO系列</a>
									</dd>
									<dd>
										<a href="">智能硬件</a>
									</dd>
									<dd>
										<a href="">X Flip</a>
									</dd>
									<dd>
										<a href="">X Fold2</a>
									</dd>
									<dd>
										<a href="">S18 Pro</a>
									</dd>
									<dd>
										<a href="">X100 Pro</a>
									</dd>
									<dd>
										<a href="">iQOO12 Pro</a>
									</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>在线购买</dt>
									<dd>
										<a href="">官方商城</a>
									</dd>
									<dd>
										<a href="">选购手机</a>
									</dd>
									<dd>
										<a href="">选购配件</a>
									</dd>
									<dd>
										<a href="">订单查询</a>
									</dd>
									<dd>
										<a href="">官方APP下载</a>
									</dd>
									<dd>
										<a href="">以旧换新</a>
									</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>服务支持</dt>
									<dd>
										<a href="">体验店</a>
									</dd>
									<dd>
										<a href="">服务首页</a>
									</dd>
									<dd>
										<a href="">真伪查询</a>
									</dd>
									<dd>
										<a href="">服务网点</a>
									</dd>
									<dd>
										<a href="">vivo care</a>
									</dd>
									<dd>
										<a href="">查找手机</a>
									</dd>
									<dd>
										<a href="">常见问题</a>
									</dd>
									<dd>
										<a href="">服务政策</a>
									</dd>
									<dd>
										<a href="">环保回收</a>
									</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>商务合作</dt>
									<dd>
										<a href="">供应商协同平台</a>
									</dd>
									<dd>
										<a href="">开放平台</a>
									</dd>
									<dd>
										<a href="">vivo企业业务</a>
									</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>关于vivo</dt>
									<dd>
										<a href="">vivo简介</a>
									</dd>
									<dd>
										<a href="">OriginOS</a>
									</dd>
									<dd>
										<a href="">工作机会</a>
									</dd>
									<dd>
										<a href="">新闻资讯</a>
									</dd>
									<dd>
										<a href="">隐私中心</a>
									</dd>
									<dd>
										<a href="">廉正合规</a>
									</dd>
									<dd>
										<a href="">可持续发展</a>
									</dd>
									<dd>
										<a href="">vivo VISION+</a>
									</dd>
									<dd>
										<a href="">vivo蔡司影像</a>
									</dd>
									<dd>
										<a href="">安全公告</a>
									</dd>
									<dd>
										<a href="">vivo官网社区</a>
									</dd>
									<dd>
										<a href="">vivo办公套件</a>
									</dd>
									<dd>
										<a href="">开发者社区</a>
									</dd>
								</dl>
							</li>
						</ul>
					</div>
					<div id="yy">
						<div>
							<img src="/vivoShop/front/image/信息.png" id="xin" />
							<p>在线客服</p>
						</div>
						<div>
							<img src="/vivoShop/front/image/电话.png" id="ip" />
							<p>7*24小时服务热线</p>
							<h4>95033</h4>
						</div>
						<div>
							<img src="/vivoShop/front/image/客服拨号.png" id="bo" />
							<p>7*24小时服务热线</p>
							<p>(使用于X Fold、X Flip、X Note、NEX系列)</p>
							<h4>400-679-9688</h4>
						</div>
						<div>
							<img src="/vivoShop/front/image/邮箱.png" id="yx" />
							<p>vivo@vivo.com.cn</p>
						</div>
						<br>
						<div>
							<img src="/vivoShop/front/image/关注.png" id="gz" />
							<p>关注vivo</p>
						</div>
						<div>
							<img src="/vivoShop/front/image/微博.png" class="c" /> <img
								src="/vivoShop/front/image/微信-copy.png" class="c" /> <img
								src="/vivoShop/front/image/支付宝支付.png" class="c" /> <img
								src="/vivoShop/front/image/链接.png" class="c" /> <img src="/vivoShop/front/image/信息圆.png"
								class="c" />
						</div>
					</div>
				</div>
				<div id="ban">
					<p>©2014-2023 广东天宸网络科技有限公司 版权所有 | 隐私政策 | 用户协议 | 资质主体 |
						粤B2-20150324 | 粤ICP备14052990号 | 粤公网安备 44190002004246号</p>
				</div>
			</div>
		</div>
</body>
<script>
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