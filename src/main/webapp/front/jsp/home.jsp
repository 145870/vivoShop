<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
</head>
<link rel="stylesheet" href="/vivoShop/front/css/Xcss.css" />
<link rel="stylesheet" type="text/css" href="../css/home.css">
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/vivoShop/static/js/setNav.js"></script>


<script type="text/javascript" src="../js/vivohome.js"></script>
<link rel="stylesheet" type="text/css" href="../css/home2.css">
<link rel="stylesheet" type="text/css" href="../css/home3.css">




<script>
	$(function() {
		$(document).ready(
				function() {
					$.getJSON("CKRMServlet", {}, function(data) {
						var box = $("<div id='ree-div'></div>");

						for (var i = 0; i < data.length; i++) {
							// 创建图片元素
							var img = $("<img class='tupian'>").attr("src",
									data[i].url);

							// 创建段落元素
							var p = $("<p>").text(data[i].information_name);
							var px = $("<p>").text(data[i].description);
							var jiage = $("<p style='color:red'>").text(
									"￥" + data[i].sale_amount);
							var box2 = $("<div class='v-div'>");
							var btn = $("<a >").text("购买>");
							img.appendTo(box2);
							// 将图片和段落添加到一个新的 div 元素中
							var box1 = $("<div class='v'>").append(box2)
									.append(p).append(px).append(jiage).append(
											btn);

							// 将新创建的 div 元素添加到主容器中
							box.append(box1);
						}

						$("#re").html(box);
					});
				});
	});
</script>
<script>
	$(document).ready(function() {
		// 给文本框添加键盘事件监听器
		$("#form-in").keypress(function(event) {
			// 如果按下的键是回车键（键码为13）
			if (event.which == 13) {
				// 阻止默认的表单提交行为
				event.preventDefault();
				// 执行搜索操作，这里假设你有一个名为 search() 的函数来处理搜索逻辑
				search();
			}
		});
		 // 给搜索按钮添加点击事件监听器
	    $("#sou-tu").click(function(){
	        // 执行搜索操作
	        search();
	    });
	});

	// 搜索函数，你需要根据实际情况编写搜索逻辑
	function search() {
		// 获取文本框的值
		var keyword = $("#form-in").val();
		// 这里可以添加你的搜索逻辑，比如跳转到搜索结果页面等
		console.log("执行搜索：" + keyword);
		var searchUrl = "SelectServlet?keyword=" + encodeURIComponent(keyword);
		// 跳转到搜索结果页面
		window.location.href = searchUrl;
	}
</script>
<script>
	// 获取所有的列表项和相应的<div>元素
	var listItems = document.querySelectorAll('#leia');
	var divs = document.querySelectorAll('.navDiv');

	// 遍历所有的列表项
	listItems.forEach(function(item, index) {
		// 添加鼠标悬停事件监听器
		item.addEventListener('mouseover', function() {
			// 隐藏所有的<div>元素
			divs.forEach(function(div) {
				div.style.display = 'none';
			});
			// 显示对应的<div>元素
			divs[index].style.display = 'block';
		});
	});
</script>
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
    					<a href="/vivoShop/PersonalCenter/JSP/login.jsp" style="flex: 1;text-align: center; line-height: 35px">
        					登录
    					</a>
    					<a href="/vivoShop/PersonalCenter/JSP/register.jsp" style="flex: 1; text-align: center; line-height: 35px">
       						注册
   						 </a>
					</div>
    				</c:when>
    			<c:otherwise>
			        <div id="gerenbox" style="display: flex;height:105px; flex-direction: column;">
    					<a href="/vivoShop/PersonalCenter/JSP/my_Mall.jsp" style="flex: 1; text-align: center; line-height: 35px">
        					我的商城
    					</a>
    					<a href="/vivoShop/PersonalCenter/JSP/my_order.jsp" style="flex: 1; text-align: center; line-height: 35px">
       						我的订单
   						 </a>
   						 <a href="/vivoShop/PersonalCenter/JSP/AccountCenter.jsp" style="flex: 1; text-align: center; line-height: 35px">
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
						<li><a class="leia" href="/vivoShop/front/jsp/LunboXServlet?cid=${lei.id }">${lei.className}</a></li>
				</c:forEach>
				
				<li><a class="leia" href="/vivoShop/front/jsp/HomeServlet">商城</a></li>
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
							<li><a href="">iQOO 12</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div id="body">
				<div id="lun">

			<div class="slideshow-container">
				<c:forEach items="${lunlist }" var="lun">
					<div class="slide">
						<img src="${lun.url }">
					</div>
				</c:forEach>


				<div id="slideIndex"></div>

				<div class="dot-container">
  					<span class="dot" onclick="currentSlide(1)"></span>
  					<span class="dot" onclick="currentSlide(2)"></span>
  					<span class="dot" onclick="currentSlide(3)"></span>
  					<span class="dot" onclick="currentSlide(4)"></span>
  					<span class="dot" onclick="currentSlide(5)"></span>
				</div>

				<button class="prev" onclick="plusSlides(-1)">❮</button>
				<button class="next" onclick="plusSlides(1)">❯</button>

			</div>
			<div id="erji">
				<ul id="erji-ul">
					<li>手机 <span>></span></li>
					<li>平板手表<span>></span></li>
					<li>手机充电<span>></span></li>
					<li>手机壳膜<span>></span></li>
					<li>耳机音箱<span>></span></li>
					<li>游戏摄影<span>></span></li>
				</ul>
				<div id="erji-box">
					<div class="erji-div">手机</div>
					<div class="erji-div">平板手表</div>
					<div class="erji-div">手机充电</div>
					<div class="erji-div">手机壳膜</div>
					<div class="erji-div">耳机音箱</div>
					<div class="erji-div">游戏摄影</div>
				</div>
			</div>
		</div>
		<div id="fen">
			<div id="he">
				<div id="iphone" class="shou">
					<img src="../image/手机专区.jpg" />
				</div>
				<div id="pei" class="shou">
					<img src="../image/配件专区.png" />
				</div>
				<div id="mian" class="shou">
					<img src="../image/免费定制.jpg" />
				</div>
			</div>
		</div>


		<div id="re-box">
			<p id="p">热卖专区</p>
			<div id="v">
				<div id="re"></div>
				<span class="miao-span" id="but-zuo"><button
						onclick="slideLeft()"><</button></span> <span class="miao-span"
					id="but-you"><button onclick="slideRight()">></button></span>
			</div>
		</div>

		<div id="jing">
			<p id="pin">精品手机</p>
			<div id="he1">
				
				<ul id="jx" style="display: inline-flex;">
					<a href="/vivoShop/front/jsp/DetailsServlet?id=3">
						<li id="j" class="j">
					<img alt="" src="../image/vivoX100home.jpg" id="vivo100">
				</li>
					</a>
					<c:forEach items="${xinlist }" var="xin">
					<a href="/vivoShop/front/jsp/DetailsServlet?id=${xin.id}" style="text-decoration: none;color: black;">
						<li class="j">
							<div id="xintwobox">
								<img src="${xin.url }">
							</div>
							<p>${xin.information_name }</p>
							<p>${xin.description }</p>
							<p style="color: red;">￥${xin.sale_amount }</p>
							<a style="margin-left: 135px;">购买></a>
						</li>
					</a>
						
					</c:forEach>
				</ul>
			</div>
			
		</div>

		<div id="box1">
			<div id="peii">
				<p id="jian">精品配件</p>
				<div id="u">
					<ul id="biaoti">
						<li>平板手表</li>
						<li>手机充电</li>
						<li>手机壳膜</li>
						<li>更多></li>
					</ul>
				</div>
			</div>
			<div id="jian-p">
				<c:forEach items="${peilist }" var="pei">
					<a href="/vivoShop/front/jsp/DetailsServlet?id=${pei.id}" style="text-decoration: none;color: black;">
						<div class="jian-pin">
						<div class="urlpeibox">
							<img alt="" src="${pei.url }" >
						</div>
						<p style="text-align: center;">${pei.information_name }</p>
						<p style="text-align: center;">${pei.description }</p>
						<p style="color: red;text-align: center;">￥${pei.sale_amount }</p>
						<a style="margin-left: 135px;">购买></a>

					</div>
					</a>
				</c:forEach>



			</div>

		</div>
			</div>


		<div id="foot">
			<div id="tt">
				<p>
					<img src="../image/正品保障.png" />官方正品
				</p>
				<p>
					<img src="../image/寄快递.png" />急速物流
				</p>
				<p>
					<img src="../image/全国联保.png" />全国联保
				</p>
				<p>
					<img src="../image/免费定制.png" />免费定制
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
						<img src="../image/信息.png" id="xin" />
						<p>在线客服</p>
					</div>
					<div>
						<img src="../image/电话.png" id="ip" />
						<p>7*24小时服务热线</p>
						<h4>95033</h4>
					</div>
					<div>
						<img src="../image/客服拨号.png" id="bo" />
						<p>7*24小时服务热线</p>
						<p>(使用于X Fold、X Flip、X Note、NEX系列)</p>
						<h4>400-679-9688</h4>
					</div>
					<div>
						<img src="../image/邮箱.png" id="yx" />
						<p>vivo@vivo.com.cn</p>
					</div>
					<br>
					<div>
						<img src="../image/关注.png" id="gz" />
						<p>关注vivo</p>
					</div>
					<div>
						<img src="../image/微博.png" class="c" /> <img
							src="../image/微信-copy.png" class="c" /> <img
							src="../image/支付宝支付.png" class="c" /> <img src="../image/链接.png"
							class="c" /> <img src="../image/信息圆.png" class="c" />
					</div>
				</div>
			</div>
			<div id="ban">
				<p>©2014-2023 广东天宸网络科技有限公司 版权所有 | 隐私政策 | 用户协议 | 资质主体 |
					粤B2-20150324 | 粤ICP备14052990号 | 粤公网安备 44190002004246号</p>
			</div>
		</div>
	</div>


	<script src="../js/shouye.js"></script>
	<script src="../js/erji.js"></script>
	<script src="../js/remai.js"></script>
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