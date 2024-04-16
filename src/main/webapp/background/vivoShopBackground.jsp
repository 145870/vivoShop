<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
	<head>
		<title></title>
		<script src="../static/jquery-3.5.1.min.js"></script>
		
		<link href="/vivoShop/background/lib/layui/css/layui.css" rel="stylesheet">
		<script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="./lib/module/tableMerge.js" charset="utf-8"></script>
		
		<script src='js/vivo.js'></script>
		<!-- <script type="text/javascript" src="./js/xadmin.js"></script> -->
			
		<style type="text/css">
			/* 重写 */
			.layui-tab-card>.layui-tab-more .layui-this{
				color: rgb(65,95,255);
			}
			.layui-tab-card>.layui-tab-title .layui-this {
			    color: rgb(65,95,255);
			}
			
			/* 加载线 */
			#loading-line {
			  height: 3px; /* 指示线的高度 */
			  background-color: rgb(65,95,255);
			  width: 0; /* 初始宽度为0，表示隐藏状态 */
			  z-index: 8888;
			}
			
			
			
			
			*{
				padding: 0;
				margin: 0;
				user-select: none;
			}
			

			/* 设置左侧菜单栏样式 */
			#sidebar{
				position:fixed;
				top: 0;
				left: 0;
				bottom: 0;
				background-color: rgb(48,65,86);
				width: 175px;
				z-index: 1001;
			}
			
			#sidebar *{
				overflow: hidden;
				white-space: nowrap;
				color: rgb(191, 203, 217);
			}
			
			/* 设置所有a标签为块级标签 */
			#sidebar a {
				position: static;
			    display: block;
			    padding: 8px 0px;
				padding-left: 20px;
				font-size: 13px;
			}
			
			/* 设置当前选中区域 */
			#sidebar .sidebar-menu-selected{
				color: rgb(64,158,255);
			}
			#sidebar .sidebar-menu-selected *{
				color: rgb(64,158,255);
			}
			
			/* 设置二级菜单内边距 */
			#sidebar dd>a{
				padding-left: 55px;
			}
			
			/* 侧边栏的全部li */
			#sidebar li{
				list-style-type: none;
				width: 100%;
			}
			
			/* 设置所有菜单默认为收缩 */
			.sidebar-menu{
				display: none;
			}
			
			/* 默认显示
			.sidebar-menu-open{
				 display: block;
			} 
			 */
			/* 设置箭头的边距 */
			#sidebar .layui-edge{
				position: relative;
				left:20px;
			}
			
			/* 设置logo区域 */
			#logo{
				height: 50px;
			}
			
			/* 设置二级菜单内容背景 */
			.sidebar-menu{
				background-color: rgb(31,45,61);
			}
			
			/* 侧边栏悬浮 */
			#sidebar ul:first-child li>a:hover{
				background-color: rgb(38,52,69);
			}
			
			.sidebar-menu dd>a:hover{
				background-color: rgb(0,20,38);
			}
			
			/* 右侧区域 */
			#right-body{
				position: fixed;
				height: 100%;
				right: 0;
				left: 0;
				top: 0;
				margin-left: 175px;

			}
			
			/* 菜单图标 */
			.left-icon{
				margin-right: 10px;
			}
			
			.tooltip *{
				color: rgb(191,203,217);
			}
			
			/* 标题栏 */
			#body-head {
			    display: flex;
			    align-items: center; /* 垂直居中对齐 */
			    height: 50px;
			}
			/* 左侧内容 */
			#head-left {
			    display: flex;
			    align-items: center;
			}
			
			/* 右侧内容 */
			#head-right {
			    margin-left: auto; /* 右侧内容靠在右侧 */
				display: flex;
				align-items: center;
			}
			
			/* 菜单切换图标 */
			#collapse-icon{
				margin-left: 15px;
				margin-right: 5px;
			}
			#title-list{
				overflow: hidden;
				white-space: nowrap;
				color: rgb(65,95,255);
			}
			#title-list span:first-child{
				/* color: rgb(65,95,255); */
				 cursor: pointer;
			}
			#title-list span{
				margin:0 10px;
			}
			
			/* 全屏 */
			#full-screen{
				
			}
			
			/* 个人资料 */
			#personal-data{
				margin: 0 10px;
				width: 125px;
				text-align: center;
				cursor: pointer;
			}
			#personal-data div{
				background-color: white;
				position: absolute;
				margin-top: 10px;
				top: 50;
				width: 125px;
				z-index: 7777;
				display: none;
				box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5); /* 添加阴影效果*/
			}
			#personal-data div p{
				padding: 5px 3px;
			}
			#personal-data div p:hover{
				background-color: rgb(236,245,255);
				color: rgb(102,177,255);
			}
			
			.tab-body{
				height: 81vh;
				overflow-y: auto; /* 只允许垂直方向滚动 */
				overflow-x: hidden; /* 隐藏水平方向滚动条 */
			}
			
			#main-body .layui-tab-content>.layui-show{
				opacity: 0;
				animation: slideInFromLeft 0.3s forwards; /* 应用动画效果，持续时间0.5秒 */
				
				/* animation: expandLine 0.5s forwards; /* 应用动画效果，持续时间0.5秒 */ */
			}
			@keyframes slideInFromLeft {
			    0% {
			        opacity: 0;
			        transform: translateX(-20%);
			    }
			    100% {
			        opacity: 1;
			        transform: translateX(0);
			    }
			}
			/* @keyframes expandLine {
			  0% {
			    width: 0;
			  }
			  100% {
			    width: 100%; /* 宽度达到100%，表示加载完成 */
			  } */
			}
		</style>
		
	</head>
	<body>
		<!-- 加载线 -->
		<div id="loading-line"></div>
		<!-- openSidebar为展开菜单 hideSidebar为收缩菜单 -->
		<div id="app" class="openSidebar">
			<!-- 左侧菜单栏 -->
			<div id='sidebar'>
				<!-- logo -->
				<div id="logo" style="display: flex; justify-content: center; align-items: center;">
					<img src="images/vivo.png" style="height: 20px;">
					<span style="margin-left: 5px;margin-top:5px;font-size: 10px;">后台管理</span>
				</div>
				
				<!-- 详细菜单 -->
				<div id="detailed-menu">
					<ul>
					  <li><a class="menu sidebar-menu-selected" href="pages/home/home.jsp"><i class="left-icon layui-icon layui-icon-home"></i><span>首页</span></a></li>
					  <li>
					    <a href="javascript:;"><i class="left-icon layui-icon layui-icon-component"></i><span>产品管理</span><i class="layui-edge layui-edge-bottom"></i> </a>
					    <dl class="sidebar-menu">
					      <dd><a class="menu" href="/vivoShop/background/gopages/goProduct_information">产品信息</a></dd>
					      <dd><a class="menu" href="pages/productType/product_type.jsp">产品类别</a></dd>
					      <dd><a class="menu" href="pages/specifications/product_specifications.jsp">产品规格</a></dd>
					    </dl>
					  </li>
					  
					  <li><a class="menu" href="javascript:;"><i class="left-icon layui-icon layui-icon-form"></i><span>订单管理</span></a></li>
					  <li>
					  		<a class="menu" href="javascript:;"><i class="left-icon layui-icon layui-icon-app"></i><span>库存管理</span><i class="layui-edge layui-edge-bottom"></i></a>
					  		<dl class="sidebar-menu">
						    <dd><a class="menu" href="/vivoShop/background/gopages/goInventoryDetails">库存信息</a></dd>
						    <dd><a class="menu" href="javascript:;">变动记录</a></dd>
						  </dl>
					  </li>
					  <li>
						  <a class="menu" href="javascript:;"><i class="left-icon layui-icon layui-icon-user"></i><span>用户管理</span><i class="layui-edge layui-edge-bottom"></i> </a>
						  <dl class="sidebar-menu">
						    <dd><a class="menu" href="javascript:;">用户资料</a></dd>
						    <dd><a class="menu" href="javascript:;">用户足迹</a></dd>
						    <dd><a class="menu" href="javascript:;">用户购物车</a></dd>
							<dd><a class="menu" href="javascript:;">用户收藏</a></dd>
							<dd><a class="menu" href="javascript:;">用户评论</a></dd>
						  </dl>
					  </li>
					  <li>
						  <a class="menu" href="javascript:;"><i class="left-icon layui-icon layui-icon-set"></i><span>系统设置</span><i class="layui-edge layui-edge-bottom"></i> </a>
						  <dl class="sidebar-menu">
						    <dd><a class="menu" href="javascript:;">前台管理</a></dd>
						    <dd><a class="menu" href="javascript:;">管理员管理</a></dd>
						    <dd><a class="menu" href="javascript:;">系统日志</a></dd>
						  </dl>
					  </li>
					</ul>
				</div>
			</div>
			
			<!-- 右侧内容 -->
			<div id="right-body">
				<!-- 顶部内容 -->
				<div id="body-head">
					<div id="head-left">
						<!-- 折叠菜单 -->
						<div id="collapse-icon">
							<!-- 默认收缩 -->
							<i class="layui-icon layui-icon-shrink-right" style="font-size: 22.5px; color: rgb(31,31,31);"></i>
							<!-- layui-icon-spread-left -->
							<!-- layui-icon-shrink-right -->
						</div>
						
						<!--标题 -->
						<div id="title-list">
							<span>首页</span>
						</div>
					</div>
					<!-- 头部右侧 -->
					<div id="head-right">
						<!-- 全屏 -->
						<div id="full-screen">
							<i class="layui-icon layui-icon-screen-full" style="font-size: 22.5px; color: rgb(31,31,31);"></i>
						</div>
						<!-- 个人资料 -->
						<div id="personal-data">
							管理员:<span>admin</span>
							<!-- 悬浮划出菜单 -->
							<div>
								<p>个人信息</p>
								<p>退出登录</p>
							</div>
						</div>
					</div>
					
				</div>
				<!-- 内容 -->
				<div id="main-body">
					<div class="layui-tab layui-tab-card" lay-filter="home-tab" style="font-size: 22.5px;" lay-allowclose="true">
					  <ul class="layui-tab-title">
					    <li class="layui-this" lay-id="1">首页</li>
					  </ul>
					  
					  
					  <div class="layui-tab-content">
					    <div class="layui-tab-item layui-show">
							<div class="tab-body" tab-id='1'>
								
							</div>
						</div>
					  </div>   
					</div>
				</div>
			</div>
		</div>
	</body>

</html>