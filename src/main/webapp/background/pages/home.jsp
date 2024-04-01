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
				background-color: rgb(237,239,242);
				
			}

	
			#home-statistics .layui-panel{
				margin: 20px;
				height: 100px;
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
			
			#home-charts{
				/* max-height: 400px; */
				
			}
			#home-charts>.layui-panel{
				margin: 20px;
				height: 400px;
			}
			
			#home-charts div:nth-child(2){
				display: flex; /* 使用 Flex 布局 */
				justify-content: space-around; /* 水平居中对齐 */
			}
			
			#home-charts div:nth-child(2) .layui-panel{
				height: 200px;
				margin: 20px;
			}
		</style>
<div id="home-body">
    <!-- 数量统计 -->
    <div id="home-statistics">
        <div class="layui-panel">
           今日访问量
        </div>   
        <div class="layui-panel">
          今日售出
        </div>   
        <div class="layui-panel">
          产品数量
        </div>   
        <div class="layui-panel">
          销售额
        </div>   
    </div>
    <!-- 统计图 -->
    <div id="home-charts">
        <div class="layui-panel">统计图</div>
        <!-- 小统计图 -->
        <div>
            <div class="layui-panel">
               统计1
            </div>   
            <div class="layui-panel">
                统计2
            </div>   
            <div class="layui-panel">
                统计3
            </div>   
            <div class="layui-panel">
              统计4
            </div>   
        </div>
    </div>
</div>

</body>
</html>