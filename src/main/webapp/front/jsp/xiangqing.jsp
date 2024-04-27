<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品详情</title>

<link rel="stylesheet" href="/vivoShop/front/css/Xcss.css" />
<link rel="stylesheet" type="text/css" href="../css/xiangqing.css">
<link rel="stylesheet" type="text/css" href="../css/xiangqing2.css">
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/vivohome.js"></script>
<script type="text/javascript" src="/vivoShop/static/js/setNav.js"></script>
<script>
	var pavID=${pavID eq null?0:pavID};

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
	//左侧轮播
	$(document).ready(function() {
		// 获取图片元素列表
		var images = document.querySelectorAll('.lunbo_div img');

		// 获取用于显示图片信息的元素
		var $xiansrc = $('#xiansrc');

		// 鼠标悬停时的动画效果
		$('.lunbo_div img').mouseover(function() {
			var $this = $(this);
			// 获取当前图片的 src 属性值
			var src = $this.attr('src');

			// 淡出当前显示的图片
			$xiansrc.fadeOut('fast', function() {
				// 将新图片的 src 属性赋值给 xiansrc 元素，并淡入显示
				$xiansrc.attr('src', src).fadeIn('fast');
			});
		});
	});
</script>
<script>
//点击商品添加收藏
var isImageChanged = false; // 用于跟踪图片是否已经修改

function changeImageAndInsertData() {
  var img = document.getElementById("shoucang");

  if (!isImageChanged) {
    // 如果图片未修改，则将其更改为另一张图片
    img.src = "../image/星星.png";
    isImageChanged = true;

    // 在这里添加发送数据到后端的代码
    $.ajax({
		url : 'DetailsInsertServlet', // 
		type : 'POST', // 请求类型
		data : {
			
		},
		success : function(response) {
			//如果成功跳转到成功页面
			
		}
	});
  } else {
    // 如果图片已经修改，则恢复原始图片并取消数据插入
    img.src = "../image/灰星星.png";
    isImageChanged = false;
  }
}
</script>


</head>
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
						<li><a class="leia" href="LunboXServlet?cid=${lei.id }">${lei.className}</a></li>
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
			<div id="body-box">
				<div id="lie">
					<a>商城首页</a> > <a>智能手机</a> > <a><span> <c:forEach
								items="${listbanben}" var="b">
								<span>${b.information_name }</span>
							</c:forEach>
					</span></a>
				</div>
				<div id="box-left">
					<div id="xianshi">
						<img id="xiansrc" src="${listurl[0].url }" />
					</div>
					<div id="xia-box">
						<div id="v">
							<div id="re">
								<c:forEach items="${listurl }" var="u">
									<div class="lunbo_div">
										<img alt="" src="${u.url }">
									</div>
								</c:forEach>
							</div>
							<span class="miao-span" id="but-zuo"><button
									onclick="slideLeft()"><</button></span> <span class="miao-span"
								id="but-you"><button onclick="slideRight()">></button></span>
						</div>
					</div>
					<div id="shoucang-box">
						<img alt="" src="../image/灰星星.png" id="shoucang" onclick="changeImageAndInsertData()">
						<span>收藏商品(1人收藏)</span>
					</div>
				</div>
				<div id="box-right">
					<div id="right-biti">
						<p>
							<span id="infname"> 
							${pname}
							</span> 
							<span id="guige">
								${guilow}
							</span>
						</p>
						<p>
							<c:forEach items="${listbanben}" var="b">
								${b.description }
							</c:forEach>
						</p>
					</div>
					<div id="price-box">
						￥ <span id="price">${pricelow }
						</span>
					</div>
					<div id="pav_box">
						<c:forEach items="${psList}" var="ps" varStatus="loop">
							<div style="margin-top:27px">
								<span>${ps.specificationsName}:</span>
								<ul id="spec_${loop.index}" class="ulbox">
									<c:forEach items="${valList[loop.index]}" var="v">
										<li class="item color-li">${v}</li>
									</c:forEach>
								</ul>
							</div>
						</c:forEach>
					</div>


					<form style="margin-top:27px">
						<input type="checkbox" name="checkbox" id="checkbox" />我已阅读并同意<a href="#" id="popupLink">《vivo服务条款》</a>
					</form>
					<!-- 弹出的div -->
					<div id="ttbox">
						<div id="popupDiv" class="popup">
							<h2>《vivo服务条款》</h2>
							<p>服务条款的确认和接受 本服务由维沃移动通信有限公司（以下简称“维沃移动”）或有资质的服务商提供。</p>
							<div id="close-box">
								<button id="close" onclick="closePopup()">我已阅读</button>
							</div>
						</div>
					</div>
					<div id="num-box">
						数量
						<div id="num">
							<button id="btn-jian" class="btn">-</button>
							<label id="lable">1</label>
							<button id="btn-jia" class="btn">+</button>

						</div><span style="margin-left: 20px;color: #ccc;">(仅限购5件)</span>
					</div>
					<div id="resu_box">
						<lable>￥<span id="sum"> ${pricelow }</span></lable>
						<lable>已选：<span id="guigere">${guilow}
						</span></lable>
					</div>
					<div id="btn_box">
						<button>加入购物车</button>
						<button id="libut">
						立即购买
							<!-- <a href="/vivoShop/front/jsp/DingdanServelt?id=${productid }" id="goumaia">立即购买</a> -->  
						</button>
					</div>
				</div>

			</div>
			<div id="xiang-box">
				<ul id="ul-box">
					<li class="a1">详细信息</li>
					<li class="a1">包装及规格参数</li>
					<li class="a1">用户评价(99.9%好评)</li>
					<li class="a1">售后服务</li>
				</ul>
				<div class="x"></div>
				<div id="footDiv">
					<!-- 详细信息 -->
					<div class="footDiv">
							<div class="xiangdiv">
								<img style="width:100%" src="${listurlin[0].url }">
							</div>
					</div>
					<div class="footDiv">2</div>
					<div class="footDiv">3</div>
					<div class="footDiv">
						<div id="fuwu">
							<ul id="fuwu_ul">
								<li>
									<b id="b1"></b>
									<h3>7天无理由退换货</h3>
									<p>购机自物流签收的7天内，机器无人为损坏官方商城支持无理由退换货，寄回运费自理。</p>
									<p>①镭雕刻字等定制订单不支持无理由退货</p>
									<p>②订单因您个人原因拒收，需承担退回的单程运费，费用从订单退款中扣除</p>
									<p>③需将订单中、订单关联的活动赠品一并退回，缺失将按照赠品原价扣款</p>
									<p>④同一客户/不同客户通过不同订单购买产品，后续申请退货退款，为避免订单混乱造成无法及时退货退款，请一个订单对应一个快递包裹。若是批量退回(即将不同订单货物通过同一快递寄回)，vivo官方商城有权拒绝签收</p>
								</li>
								<li>
									<b id="b2"></b>
									<h3>30天质量问题换货</h3>
									<p>购机自物流签收的30天内，出现产品本身原因造成的性能故障，可凭着vivo客户服务中心开据的故障检测单，享受换货服务。</p>
								</li>
								<li>
									<b id="b3"></b>
									<h3>一年保修服务</h3>
									<p>购机自物流签收的1年内，出现产品本身原因造成的性能故障，您可在全国vivo客户服务中心享受保修服务。</p>
								</li>
								<li>
									<b id="b4"></b>
									<h3>vivo客户服务中心地址查询</h3>
									<p>您可以打开“vivo官网”APP-“我的”-“服务网点”，查询就近的官方客户服务中心；</p>
								</li>
							</ul>
						</div>
						
					</div>
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
	<script>
		//我已阅读同意
		// 获取链接和弹出的div
		var popupLink = document.getElementById('popupLink');
		var popupDiv = document.getElementById('ttbox');

		// 添加点击事件监听器
		popupLink.addEventListener('click', function(event) {
			// 阻止默认行为，避免页面跳转
			event.preventDefault();
			// 显示弹出的div
			popupDiv.style.display = 'block';
		});

		// 关闭弹出的div
		function closePopup() {
			popupDiv.style.display = 'none';
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			// 定义一个函数用于处理点击事件
			function handleTabClick(index) {
				$('.a1').removeClass('action');
				$('.a1').eq(index).addClass('action');
				$(".x").css('left', index * 166 + 5 + 'px');
				$('.x').css('animation-name', 'x'); // 将关键帧动画应用于元素
				$('.x').css('animation-duration', '1s'); // 设置动画持续时间
				$('.x').css('animation-fill-mode', 'forwards'); // 设置动画结束后保持最后一个关键帧的状态
				$('.footDiv').css('display', 'none');
				$('.footDiv').eq(index).css('display', 'block');
			}

			// 用户点击时调用 handleTabClick 函数
			$(".a1").click(function() {
				handleTabClick($(this).index());
			});

			// 页面加载完成时默认显示第一个 div
			handleTabClick(0);
		});
	</script>
	<script src="../js/xiangxilb.js"></script>
	
	<script>
		$("#pav_box ul").each(function() {
			$(this).find(".item").eq(0).css({
				"color" : "red",
				"border" : "2px solid red"
			}).addClass("select")

			$(this).find(".item").click(function() {
				$(this).siblings('.item').css({
					"color" : "black",
					"border" : "1px solid #ccc"
				}).removeClass("select")

				$(this).css({
					"color" : "red",
					"border" : "2px solid red"
				}).addClass("select")

				var vals = [];
				$("#pav_box ul").each(function() {
					var val = $(this).find(".item.select").text();
					vals.push(val);
				});

				// 将数组 atts 转换为 JSON 格式的数组
				var jsonArr = JSON.stringify(vals);

				// 发送 AJAX 请求
				$.ajax({
					url : 'RefreshServlet', // 
					type : 'POST', // 请求类型
					data : {
						jsonavt : jsonArr
					},
					success : function(response) {
						// 解析服务器返回的 JSON 字符串为 JavaScript 对象
						var responseData = JSON.parse(response);
						
						pavID=responseData.pavid;

						// 访问对象中的 price 和 Jsonvals 字段，并更新页面内容
						$("#price").html(responseData.price);
						$("#guige").html(responseData.Jsonvals);
						$("#sum").html(responseData.price);
						$("#guigere").html(responseData.Jsonvals);
					},
					error : function(xhr, status, error) {
						// 请求失败时的处理逻辑
						console.error('失败：', error);
					}
				});
			})
		})
	</script>

<script type="text/javascript">
//勾选复选框
window.onload = function() {
    var checkbox = document.getElementById("checkbox");
    var libut = document.getElementById("libut");

        // 如果复选框被勾选，则允许跳转页面
        $("#libut").click(function(){
        	event.preventDefault(); // 阻止默认行为
        	if (!checkbox.checked) { // 如果复选框未被勾选
        		//提示勾选
        		alert("勾选")
        		return;
            }
    	    
    	    //数量
    	    var num=$("#lable").html();
    	    var pavidss = pavID;

    	    var dataArray = [
    	        { num: num, pavid: pavID },
    	        { num: num, pavid: pavID }
    	    ];

    	    // 将数据对象转换成 JSON 字符串
    	    var jsonData = encodeURIComponent(JSON.stringify(dataArray));
    	    
    	 	// 构建 URL，并将 JSON 数据作为参数传递
    	    var url = "/vivoShop/front/jsp/DingdanServelt?jsonData=" + jsonData;
    	    // 通过修改页面的 URL 实现页面跳转
    	    window.location.href = url;
    	   
    });
        //数量的事件
      //获取lable
		var lable = document.getElementById("lable");
		//获取加的按钮
		var btnjia = document.getElementById("btn-jia");
		//获取减的按钮
		var btnjian = document.getElementById("btn-jian");
		//获取总和
		var sum = document.getElementById("sum");
		//获取单价
		var price = document.getElementById("price");

		//设置初始值1数量
		var count = 1;

		// 减少数量按钮点击事件
		btnjian.onclick = function() {
			if (count > 1) {
				count--;
				lable.innerText = count;
				updateTotal();
			}
		};

		// 增加数量按钮点击事件
		btnjia.onclick = function() {
		    if (count < 5) { // 如果数量小于5才增加
		        count++;
		        lable.innerText = count;
		        updateTotal();
		    }
		};

		// 更新总价
		function updateTotal() {
			var pricePerItem = parseFloat(price.innerText); // 获取单价并转换为数字
			var total = count * pricePerItem;
			sum.innerText = total;
		}
};
</script>
	
</body>
</html>