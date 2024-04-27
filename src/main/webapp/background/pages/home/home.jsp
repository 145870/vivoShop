<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<style type="text/css">
#home-body {
	background-color: rgb(237, 239, 242);
}

#home-body * {
	font-size: 20px;
}

#home-statistics .layui-panel {
	margin: 20px;
	height: 150px;
	padding: 10px;
}

#home-statistics {
	display: flex; /* 使用 Flex 布局 */
	justify-content: space-around; /* 水平居中对齐 */
}

.layui-panel {
	flex: 1; /* 均分剩余空间 */
	/* text-align: center; /* 文字居中对齐 */
}

#home-charts {
	/* max-height: 400px; */
	
}

#home-charts>.layui-panel {
	margin: 20px;
	height: 400px;
}

#home-charts div:nth-child(2) {
	display: flex; /* 使用 Flex 布局 */
	justify-content: space-around; /* 水平居中对齐 */
}

#home-charts div:nth-child(2) .layui-panel {
	height: 200px;
	margin: 20px;
}

#home-statistics>div {
	width: 100px;
	height: 100px;
}

#home-statistics .icon {
	width: 70px;
	height: 70px;
}

#home-statistics .container {
	display: flex;
	justify-content: center;
	padding: 0 30px;
}

#home-statistics .left, .right {
	flex: 1; /* 平分容器宽度 */
	display: flex;
	align-items: center; /* 内容垂直居中 */
	justify-content: center; /* 内容水平居中 */
}

#home-statistics .left {
	justify-content: left;
}

#home-statistics .right {
	text-align: right; /* 内容右对齐 */
	justify-content: right;
}

#home-body h4{
	font-size:20px;
}

</style>
	<div id="home-body">
		<!-- 数量统计 -->
		<div id="home-statistics">
			<div class="layui-panel container">
				<div class="left">
					<div>
						<svg t="1714113371124" class="icon" viewBox="0 0 1024 1024"
							version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5146"
							width="48" height="48">
							<path style="fill:rgb(108,213,211)"
								d="M512 571.665067c88.046933 0 169.301333-76.919467 178.414933-189.405867C699.938133 264.533333 621.7728 153.531733 512 153.531733S324.061867 264.533333 333.585067 382.2592c9.1136 112.469333 90.368 189.405867 178.414933 189.405867z m-1.604267 60.7232C313.344 632.388267 153.6 710.741333 153.6 807.406933c0 33.058133 30.378667 45.789867 119.7568 55.466667 69.085867 7.458133 151.569067 7.458133 238.6432 7.458133 89.1904 0 177.646933 0 239.872-7.4752C839.901867 852.309333 870.4 840.465067 870.4 807.424c0-96.6656-162.952533-175.018667-360.004267-175.018667z"
								p-id="5147"></path></svg>
					</div>
				</div>
				<div class="right">
					<div>
						<h4>用户数量</h4>
						<span>${userCount}</span>
					</div>
				</div>
			</div>


			<div class="layui-panel container">
				<div class="left">
					<div>
						<svg t="1714114881034" class="icon" viewBox="0 0 1024 1024"
							version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="6144"
							width="48" height="48">
							<path style="fill:rgb(62,166,247)"
								d="M376.248 556.392H114.992A103.294 103.294 0 0 0 11.875 659.568v261.197A103.294 103.294 0 0 0 114.992 1024h261.256a103.294 103.294 0 0 0 103.176-103.176V659.568a103.294 103.294 0 0 0-103.176-103.176z m0-523.343H114.992A103.294 103.294 0 0 0 11.875 136.285v261.197a103.294 103.294 0 0 0 103.117 103.235h261.256a103.294 103.294 0 0 0 103.176-103.235V136.285A103.294 103.294 0 0 0 376.248 33.049z m608.69 157.43L820.818 26.357a95.417 95.417 0 0 0-131.665 0L525.03 190.479a93.166 93.166 0 0 0 0 131.664l164.122 164.181a93.107 93.107 0 0 0 131.724 0L984.94 321.966a93.285 93.285 0 0 0 0-131.487zM936.49 298.274L795.882 439.12a59.228 59.228 0 0 1-81.735 0L573.42 298.274a57.925 57.925 0 0 1 0-81.735L714.147 75.872a57.925 57.925 0 0 1 81.735 0L936.49 216.717a57.925 57.925 0 0 1 0 81.557z m-34.412 258.118H640.881a103.354 103.354 0 0 0-102.998 103.176v261.197a103.294 103.294 0 0 0 103.176 103.176h261.197a103.354 103.354 0 0 0 103.235-103.176V659.568a103.354 103.354 0 0 0-103.413-103.176z"
								p-id="6145"></path></svg>
					</div>
				</div>
				<div class="right">
					<div>
						<h4>商品数量</h4>
						<span>${productCount}</span>
					</div>
				</div>
			</div>


			<div class="layui-panel container">
				<div class="left">
					<div>
						<svg t="1714114979768" class="icon" viewBox="0 0 1024 1024"
							version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="8098"
							width="48" height="48">
							<path style="fill:rgb(106,208,188)"
								d="M829.50940445 638.61077333l4.01294222-309.56430222-561.98485334-16.39424-1.97404444-23.72835556h0.15132444V249.58293333h-106.47324444v39.34094222h72.69603556l1.89326222 22.74417778-0.31288889-0.00910222 17.40686222 205.4144 16.64910222 200.05888v96.29127111h52.55054223V764.46151111h390.04046222v48.96199111h52.55054222v-105.94986667H304.39537778l-1.76241778-21.16835555z"
								p-id="8099" fill="#848282"></path></svg>
					</div>
				</div>
				<div class="right">
					<div>
						<h4>销量</h4>
						<span>${sold}</span>
					</div>
				</div>
			</div>


			<div class="layui-panel container">
				<div class="left">
					<div>
						<svg t="1714115048901" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="9161" width="48" height="48"><path style="fill:rgb(244,81,108)" d="M851.2 57.6 608 465.066667l211.2 0 0 72.533333L561.066667 537.6l0 115.2 260.266667 0L821.333333 725.333333 561.066667 725.333333l0 241.066667-96 0L465.066667 725.333333 206.933333 725.333333l0-72.533333 258.133333 0 0-115.2L206.933333 537.6l0-72.533333 211.2 0L172.8 57.6l106.666667 0 234.666667 401.066667L746.666667 57.6 851.2 57.6z" p-id="9162"></path></svg>
					</div>
				</div>
				<div class="right">
					<div>
						<h4>销售额</h4>
						<span>${sales}</span>
					</div>
				</div>
			</div>
		</div>
		<!-- 统计图 -->
		<div id="home-charts">
			<div class="layui-panel">统计图</div>
			<!-- 小统计图 -->
			<div>
				<div class="layui-panel">统计1</div>
				<div class="layui-panel">统计2</div>
				<div class="layui-panel">统计3</div>
				<div class="layui-panel">统计4</div>
			</div>
		</div>
	</div>

</body>
</html>