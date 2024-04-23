<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单信息</title>
<link rel="stylesheet" type="text/css" href="../css/dingdan.css">
<link rel="stylesheet" href="/vivoShop/front/css/Xcss.css" />

<link rel="stylesheet" type="text/css" href="../css/dingdanbody.css">
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/vivohome.js"></script>

<script type="text/javascript" src="/vivoShop/static/js/setNav.js"></script>
<script>
$(document).ready(function(){
	// 发送 AJAX 请求
	$.ajax({
		url : 'RefreshDingBiaoServlet', // 替换成你的 API 地址
		type : 'POST', // 请求类型，这里假设是 POST 请求
		success : function(response) {
			// 解析服务器返回的 JSON 字符串为 JavaScript 对象
			var responseData = JSON.parse(response);

			// 访问对象中的 price 和 Jsonvals 字段，并更新页面内容
			$("#guu").html(responseData.jsonname+responseData.jsonData);
			$("#jiage").html(responseData.jsonprice);
			$("#shuliang").html(responseData.jsonNum);
			$("#yixuan").html(responseData.jsonprice*responseData.jsonNum);
			$("#price_sum").html("￥"+responseData.jsonprice*responseData.jsonNum);
		},
		error : function(xhr, status, error) {
			// 请求失败时的处理逻辑
			console.error('失败：', error);
		}
	});
});
</script>
<script>
	$(document).ready(function(){
		$.getJSON("RefreshDingDanServlet",function(data){
			var box=$("<div id='addbox'></div>");
			for(var i=0;i<data.length;i++){
				var boxx=$("<div id='"+data[i].id+"' class='address_div address_divold'></div>");
				boxx.appendTo(box);
				var span1=$("<span class='name'>").text(data[i].address_name);
				var span2=$("<span class='tel'>").text(data[i].phone);
				var boxspan=$("<div class='namediv'></div>");
				span1.appendTo(boxspan);
				span2.appendTo(boxspan);
				boxspan.appendTo(boxx);
				var boxp=$("<div class='pdiv'></div>");
				// 创建 <span> 元素并设置文本内容
				var a1=$("<span class='add sheng'>").text(data[i].province);
				var a2=$("<span class='add shi'>").text(data[i].city);
				var a3=$("<span class='add xian'>").text(data[i].district);
				var a4=$("<span class='add xiang'>").text(data[i].address);
				var abox=$("<div class='adddiv'></div>");
				a1.appendTo(abox);
				a2.appendTo(abox);
				a3.appendTo(abox);
				a4.appendTo(abox);
				abox.appendTo(boxx);
				var butbox=$("<div class='butdiv' id='butdiv' ></div>");
				var btn1=$("<button class='btn-mo' style='border:none;background-color:transparent;color:blue;'></button>").text("【默认地址】");
				var btn2=$("<button class='btn-mo' style='border:none;background-color:transparent;color:blue;'></button>").text("编辑");
				var btn3=$("<button class='btn-mo' style='border:none;background-color:transparent;color:blue;'></button>").text("删除");
				
				btn1.appendTo(butbox);
				btn2.appendTo(butbox);
				btn3.appendTo(butbox);
				butbox.appendTo(boxx);
			}
			var boxjia=$("<div id='jia_div' class='address_div'></div>");
			var boxjiad=$("<div></div>");
			var img=$("<img src='../image/加.png'>");
			var pjia=$("<p></p>").text("添加新地址");
			img.appendTo(boxjiad);
			pjia.appendTo(boxjiad);
			boxjiad.appendTo(boxjia);
			boxjia.appendTo(box);
			
			$("#oldadd").html(box);
			// 获取弹出的div
    		var tandiv=document.getElementById('xinzengdiv');
			 // 为动态生成的"jia_div"元素设置点击事件
	        $(document).on('click', '#jia_div', function() {
	    		tandiv.style.display='block';
	        });
		
	     // 初始隐藏除前三个和最后一个地址框外的其他地址框
	        $(".address_div:not(:lt(3)):not(:last)").addClass("hidden");

	        // 为显示/隐藏按钮设置点击事件
	        $("#showButton").click(function() {
	          $(".address_div:not(:lt(3)):not(:last)").toggleClass("hidden"); // 切换其他地址框的显示/隐藏状态
	          var buttonText = $(".address_div:not(:lt(3)):not(:last)").hasClass("hidden") ? "显示所有收货地址" : "隐藏多余收货地址";
	          $(this).text(buttonText); // 更新按钮文本
	        });
	     // 动态绑定移入移出事件
	      //  $(document).on("mouseenter", ".butdiv", function(){
	  //          $(this).find(".btn-mo").show();
	    //    }).on("mouseleave", ".butdiv", function(){
	//            $(this).find(".btn-mo").hide();
//	        });
	     // 给动态生成的按钮添加点击事件
	        $(document).on("click", ".btn-mo", function() {
	        	 // 获取按钮所在地址的id
	              var address_id = $(this).closest('.address_div').attr('id');
	              // 获取姓名和电话号码
	              var name = $(this).closest('.address_div').find('.name').text();
	              var tel = $(this).closest('.address_div').find('.tel').text();
	              var sheng = $(this).closest('.address_div').find('.sheng').text();
	              var shi = $(this).closest('.address_div').find('.shi').text(); 
	              var xian = $(this).closest('.address_div').find('.xian').text();
	              var xiang = $(this).closest('.address_div').find('.xiang').text();

	            if ($(this).text() === "【默认地址】") {
	                // 执行相关操作
	                alert("默认地址，地址ID：" + address_id);
	            }
	            // 如果点击了"编辑"按钮
	            else if ($(this).text() === "编辑") {
	                // 执行相关操作
	                alert("编辑，地址ID：" + address_id);
	                tandiv.style.display='block';
	                $("#iname").val(name);
                    $("#phone").val(tel);	
                    $("#sheng").val(sheng);
                    $("#shi").val(shi);
                    $("#xian").val(xian);
                    $("#xiang").val(xiang);
	                $.get("RefrechUpdateServlet",{id:address_id},function(data){
	                	   // 在成功获取到数据后，将数据填充到对应的文本框中
	                   
	                   
	                });
	            }
	            // 如果点击了"删除"按钮
	            else if ($(this).text() === "删除") {
	            	 var confirmDelete=confirm("确定要删除地址吗");
	            	 if(confirmDelete){
	            		 $.get("RefrechDelDingDanServlet",{id:address_id},function(v){
	            			 console.log(v);
	            			 alert("删除成功");
	            			 location.reload();
	            		 })
	            	 }
	            }
	        });
	       
	    	
		});
	});
</script>
<style>
	#jia_div div {
    text-align: center;
    justify-content: center;
    margin-top: 59px;
}
.btn_mo{
	border: none;
    background-color: transparent;
    /* opacity: 49%; */
    color: blue;
}
</style>
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
			<div id="hedui">
				<span>核对订单信息</span>
			</div>
			<div id="address_box">
				<p id="shou">
					收货人信息<span>*温馨提示：付款后24消失内发货</span>
				</p>
				<div id="address_divid">
					<div id="oldadd"></div>



					<div id="xinzengdiv">
						<div id="xinzengbox">
							<span id="close_X" onclick="closetan()">X</span>
							<p>新建收货地址</p>
							<div id="form_box">
								<form action="InsertAddServlet" method="post" onsubmit="return validateForm()">
									<div>
										<span>*</span>收货人: <input name="iname" class="input" id="iname"
											style="margin-left: 27px;" />
									</div>
									<div>
										<span>*</span>手机号码： <input name="itel" id="phone" pattern="[0-9]{11}" class="input" />
									</div>
									<div>
										<span>*</span>收货地址： <input type="text" placeholder="请选择"
											name="sheng" class="sinp" id="sheng" /> <input type="text"
											placeholder="请选择" name="shi" id="shi" class="sinp" /> <input
											type="text" placeholder="请选择" name="xian" id="xian" class="sinp" />
									</div>
									<div>
										<span>*</span>详细地址： <input type="text" name="xiangxiadd"
											class="input" id="xiang" />
									</div>
									<div>
										<input type="checkbox" class="default_input"
											name="default_input" id="mo" /> 设为默认地址
									</div>
									<div>
										<input type="submit" value="保存" id="baocun">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<button id="showButton">显示更多收货地址</button>
			</div>

			<div id="probox">
				<p>确认商品</p>
				<div id="prodiv">
					<table id="protab">
						<tr>
							<td>商品名称</td>
							<td>价格(元)</td>
							<td>数量</td>
							<td>小计(元)</td>
						</tr>
						<tr>
							<td>
								<div id="img_box">
									<c:forEach items="${psList }" var="p">
										<img src="${p.url }" />
									</c:forEach>

								</div> <span id="guu">  </span>
							</td>
							<td id="jiage"></td>

							<td id="shuliang"></td>
							<td style="color: red;">${jsonprice * jsonNum}</td>
						</tr>
					</table>

				</div>
			</div>

			<div id="xiang_box">
				<div id="yixuan_box">
					<div>已选1件商品，合计(不含运费) :</div>
					<div id="yixuan"></div>
				</div>
				<div id="yingfu_box">
					<label>应付总额:</label> <span id="price_sum">￥5499.00</span>
				</div>
				<div id="shoujian_box">
					<div>收件人:</div>
					<div>
						<span id="name">名字</span> <span id="tel">电话</span>
					</div>
				</div>
				<div id="pei_box">
					<div>配送地址:</div>
					<div id="add_div">qwe</div>
				</div>
				<div style="height:67px;">
					<button id="btn_sumbit">提交订单</button>
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
//获取弹出的div
var tandiv=document.getElementById('xinzengdiv');
// 关闭弹窗
function closetan(){
	tandiv.style.display='none';
}
</script>
<script type="text/javascript">
function validateForm() {
        var iname = document.getElementById("iname").value;
        var itel = document.getElementById("itel").value;
        var sheng = document.getElementById("sheng").value;
        var shi = document.getElementById("shi").value;
        var xian = document.getElementById("xian").value;
        var xiangxiadd = document.getElementById("xiangxiadd").value;

        if (iname == "" || itel == "" || sheng == "" || shi == "" || xian == "" || xiangxiadd == "") {
            alert("请填写完整的收货信息");
            return false; // 阻止表单提交
        }
    }
  </script>
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