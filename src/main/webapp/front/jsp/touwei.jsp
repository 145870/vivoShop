<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单信息</title>
<link rel="stylesheet" type="text/css" href="../css/dingdan.css">
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/vivohome.js"></script>

</head>
<body>
	<div id="box">
		<div id="nian">
			<div id="nian-box">
				<div id="nian1" class="nian-he"></div>
				<div id="nian2" class="nian-he"></div>
				<div id="nian3" class="nian-he"></div>
			</div>
		</div>
		<div id="tou">
			<ul id="left">
				<li>品牌</li>
				<li>OriginOS</li>
				<li>体验店</li>
				<li>官网社区</li>
			</ul>
			<ul id="you">
				<img id="xiazai" src="../image/下载.png" />
				<img src="" />
				<li>下载APP</li>
				<li>购物车(1)</li>
				<li id="geren">个人中心</li>
			</ul>

		</div>
		<div id="deng_kuang">
			<div id="sanjiao"></div>
			<div id="gerenbox">
				<div id="denglubox">
					<img alt="" src="../image/登陆icon.png"> <a>登录</a>
				</div>
				<div id="zhucebox">
					<img alt="" src="../image/注册icon.png"> <a>注册</a>
				</div>
			</div>
		</div>

		<div id="head">
			<div id="tu">
				<img src="../image/vivo.svg" id="vivo" />
			</div>

			<ul id="head-nav" class="nav">
				<c:forEach items="${leilist}" var="lei">
					<li><a id="leia" href="LunboXServlet?cid=${lei.id }">${lei.className}</a></li>
				</c:forEach>
				<li><a class="leia" href="/vivoShop/front/jsp/HomeServlet">商城</a></li>
			</ul>

			<div id="so">
				<img src="../image/搜索.png" / id="sou">
			</div>
			<div id="navDiv">
				<c:forEach items = '${leilist}' var='type' varStatus = 'typeLoop'>
					<div class="navDiv">
						<div class="rebox">
							<div class="re" style='padding:20px;padding-left:80px'>
								<div class="tubox">
									<c:forEach items="${productsLists[typeLoop.index]}" var="pi" varStatus="loop">
   										<c:if test="${loop.index < 6}">
       										<a id="aaa" href="DetailsServlet?id=${pi.information_id}">
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
						<img src="../image/vivo.svg" id="sou-vivo" />
						<form id="form">
							<input placeholder="iQOO Neo9" id="form-in" />

						</form>
						<div id="sou-div">
							<img src="../image/搜索.png" id="sou-tu" />
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
		

		
		<div id="foot">
			<div id="tt">
				<p><img src="../image/正品保障.png"/>官方正品</p>
				<p><img src="../image/寄快递.png"/>急速物流</p>
				<p><img src="../image/全国联保.png"/>全国联保</p>
				<p><img src="../image/免费定制.png"/>免费定制</p>
			</div>
			<div id="ww">
				<div id="zz">
					<ul id="wei">
						<li>
							<dl>
								<dt>了解产品</dt>
								<dd><a href="">X系列</a></dd>
								<dd><a href="">S系列</a></dd>
								<dd><a href="">T系列</a></dd>
								<dd><a href="">Y系列</a></dd>
								<dd><a href="">NEX系列</a></dd>
								<dd><a href="">iQOO系列</a></dd>
								<dd><a href="">智能硬件</a></dd>
								<dd><a href="">X Flip</a></dd>
								<dd><a href="">X Fold2</a></dd>
								<dd><a href="">S18 Pro</a></dd>
								<dd><a href="">X100 Pro</a></dd>
								<dd><a href="">iQOO12 Pro</a></dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>在线购买</dt>
								<dd><a href="">官方商城</a></dd>
								<dd><a href="">选购手机</a></dd>
								<dd><a href="">选购配件</a></dd>
								<dd><a href="">订单查询</a></dd>
								<dd><a href="">官方APP下载</a></dd>
								<dd><a href="">以旧换新</a></dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>服务支持</dt>
								<dd><a href="">体验店</a></dd>
								<dd><a href="">服务首页</a></dd>
								<dd><a href="">真伪查询</a></dd>
								<dd><a href="">服务网点</a></dd>
								<dd><a href="">vivo care</a></dd>
								<dd><a href="">查找手机</a></dd>
								<dd><a href="">常见问题</a></dd>
								<dd><a href="">服务政策</a></dd>
								<dd><a href="">环保回收</a></dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>商务合作</dt>
								<dd><a href="">供应商协同平台</a></dd>
								<dd><a href="">开放平台</a></dd>
								<dd><a href="">vivo企业业务</a></dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>关于vivo</dt>
								<dd><a href="">vivo简介</a></dd>
								<dd><a href="">OriginOS</a></dd>
								<dd><a href="">工作机会</a></dd>
								<dd><a href="">新闻资讯</a></dd>
								<dd><a href="">隐私中心</a></dd>
								<dd><a href="">廉正合规</a></dd>
								<dd><a href="">可持续发展</a></dd>
								<dd><a href="">vivo VISION+</a></dd>
								<dd><a href="">vivo蔡司影像</a></dd>
								<dd><a href="">安全公告</a></dd>
								<dd><a href="">vivo官网社区</a></dd>
								<dd><a href="">vivo办公套件</a></dd>
								<dd><a href="">开发者社区</a></dd>
							</dl>
						</li>
					</ul>
				</div>
				<div id="yy">
					<div>
						<img src="../image/信息.png" id="xin"/>
						<p>在线客服</p>
					</div>
					<div>
						<img src="../image/电话.png" id="ip"/>
						<p>7*24小时服务热线</p>
						<h4>95033</h4>
					</div>
					<div>
						<img src="../image/客服拨号.png" id="bo"/>
						<p>7*24小时服务热线</p>
						<p>(使用于X Fold、X Flip、X Note、NEX系列)</p>
						<h4>400-679-9688</h4>
					</div>
					<div>
						<img src="../image/邮箱.png" id="yx"/>
						<p>vivo@vivo.com.cn</p>
					</div>
					<br>
					<div>
						<img src="../image/关注.png" id="gz"/>
						<p>关注vivo</p>
					</div>
					<div>
						<img src="../image/微博.png" class="c"/>
						<img src="../image/微信-copy.png" class="c"/>
						<img src="../image/支付宝支付.png" class="c"/>
						<img src="../image/链接.png" class="c"/>
						<img src="../image/信息圆.png" class="c"/>
					</div>
				</div>
			</div>
			<div id="ban">
				<p>©2014-2023 广东天宸网络科技有限公司 版权所有 | 隐私政策 | 用户协议 | 资质主体 | 粤B2-20150324 | 粤ICP备14052990号 | 粤公网安备 44190002004246号</p>
			</div>
		</div>
	</div>
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
</body>
</html>