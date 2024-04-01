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
<link rel="stylesheet" type="text/css" href="../css/home.css">
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/vivohome.js"></script>
<link rel="stylesheet" type="text/css" href="../css/home2.css">
<script>
$(function(){
    $(document).ready(function(){
        $.getJSON("CKRMServlet", {}, function(data){
            var box = $("<div id='ree-div'></div>"); 
            
            for(var i = 0; i < data.length; i++){
                // 创建图片元素
                var img = $("<img class='tupian'>").attr("src", data[i].url);
                
                // 创建段落元素
                var p = $("<p>").text(data[i].description);
                var box2=$("<div class='v-div'>");
                img.appendTo(box2);
                // 将图片和段落添加到一个新的 div 元素中
                var box1 = $("<div class='v'>").append(box2).append(p);
                
                // 将新创建的 div 元素添加到主容器中
                box.append(box1);
            }
            
            $("#re").html(box);
        });
    });
});
</script>

<body>
	<div id="box">
		<div id="nian">
			<div id="nian-box">
				<div id="nian1" class="nian-he">
												
				</div>
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
				<img id="xiazai" src="../image/下载.png"/>
				<img src=""/>
				<li>下载APP</li>
				<li>购物车(1)</li>
				<li>个人中心</li>
			</ul>
		</div>
		<div id="head">
			<div id="tu"><img src="../image/vivo.svg" id="vivo"/></div>
			
			<ul id="head-nav" class="nav">
			    <li>X系列</li>
			    <li>S系列</li>
			    <li>Y系列</li>
			    <li>iQOO系列</li>
			    <li>智能硬件</li>
			    <li>商城</li>
			</ul>
			
			<div id="so"><img src="../image/搜索.png"/ id="sou"></div>
			<div id="navDiv">
				<div class="navDiv">Div 1</div>
				<div class="navDiv">Div 2</div>
				<div class="navDiv">Div 3</div>
				<div class="navDiv">Div 4</div>
				<div class="navDiv">Div 5</div>
			</div>
			<div id="sss">
				<div id="sss-box">
					
					<div id="sou-shang">
						<img src="../image/vivo.svg" id="sou-vivo"/>
						<form id="form">
							<input placeholder="iQOO Neo9" id="form-in"/>
							
						</form>
						<div id="sou-div"><img src="../image/搜索.png" id="sou-tu"/></div>
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
		<div id="lun">
			
			<div class="slideshow-container">
			  <div class="slide">
			    <img src="../image/轮播1.jpg" alt="Slide 1">
			  </div>
			  <div class="slide">
			    <img src="../image/轮播2.jpg" alt="Slide 2">
			  </div>
				<div class="slide">
				  <img src="../image/轮播3.jpg" alt="Slide 3">
				</div>
				<div class="slide">
				  <img src="../image/轮播44.jpg" alt="Slide 4">
				</div>
				<div class="slide">
				  <img src="../image/轮播5.jpg" alt="Slide 5">
				</div>
				
			
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
					<img src="../image/手机专区.jpg"/>
				</div>
				<div id="pei" class="shou">
					<img src="../image/配件专区.png"/>
				</div>
				<div id="mian" class="shou">
					<img src="../image/免费定制.jpg"/>
				</div>
			</div>
		</div>
			
		<div id="dao-box">
			<img alt="" src="../image/V秒杀.png" id="vms"/>
			
			<div id="dao">
			</div>
		</div>
		<div id="re-box">
		    <div id="v">
		        <div id="re">
		        	
		        </div>
		        <span class="miao-span" id="but-zuo"><button onclick="slideLeft()"><</button></span>
		        <span class="miao-span" id="but-you"><button onclick="slideRight()">></button></span>
		    </div>
		</div>
		<div id="remai">
			<p id="p">热卖专区</p>
			<div id="iQ">
				<div class="i"></div>
				<div class="i"></div>
				<div class="i"></div>
			</div>
		</div>
		<div id="jing">
			<p id="pin">精品手机</p>
			<div id="he1">
				<div id="j" class="j"></div>
				<div class="j"></div>
				<div class="j"></div>
			</div>
			<div id="ji">
				<div class="ji"></div>
				<div class="ji"></div>
				<div class="ji"></div>
				<div class="ji"></div>
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
					<div class="jian-pin"></div>
					<div class="jian-pin"></div>
					<div class="jian-pin"></div>
					<div class="jian-pin"></div>
				</div>
				<div id="jian-pi">
					<div class="jian-pi"></div>
					<div class="jian-pi"></div>
					<div class="jian-pi"></div>
					<div class="jian-pi"></div>
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
	

<script src="../js/shouye.js"></script>
<script src="../js/div.js"></script>
</body>
</html>