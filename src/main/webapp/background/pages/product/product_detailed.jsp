<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title></title>
	<%--
	<script type="text/javascript" src="/vivoShop/background/lib/layui/layui.js"></script>
	<link href="/vivoShop/background/lib/layui/css/layui.css" rel="stylesheet">
	
	<script type="text/javascript" src="/vivoShop/static/jquery-3.5.1.min.js"></script>
	 --%>
</head>


<body>
	<style type="text/css">
/* 重写 */
#product-detailed .layui-table-checked {
	background-color: rgb(244, 244, 255);
}
}
#product-detailed .layui-laydate .layui-this, .layui-laydate .layui-this>div {
    background-color: rgb(85, 170, 255) !important;
    color: #fff !important;
}
/* 重写 */
#product-detailed .layui-laydate .layui-this>div {
	background-color: rgb(85, 170, 255) !important;
}

.layui-laydate .layui-this, .layui-laydate .layui-this>div {
     background-color: rgb(85, 170, 255) !important;
    color: #fff !important;
}
/* 重写 */
#product-detailed .layui-form-select dl dd.layui-this {
	color: rgb(102, 117, 255);
}

#product-detailed-select span:not(.no){
	width: 80px;
}

/* 重写 */
#product-detailed-select div:last-child button:hover {
	color: rgb(85, 170, 255);
	background-color: rgb(250, 250, 250);
}

/* 重写表格样式 */
#product-detailed-body .tabel .layui-laypage .layui-laypage-curr .layui-laypage-em
	{
	background-color: rgb(89, 189, 255);
}

#product-detailed-body .tabel .layui-table-click, .layui-table-hover,
	.layui-table[lay-even] tbody tr:nth-child(even) {
	background-color: rgb(250, 250, 255);
}

#product-detailed-body .tabel .layui-form-checked[lay-skin=primary]>i
	{
	border-color: rgb(89, 189, 255) !important;
	background-color: rgb(89, 189, 255);
	color: #fff;
}

#product-detailed-body {
	padding: 16px;
}


#product-detailed-body .buttons {
	margin-bottom: 20px;
}

#product-detailed{
	margin: 20px;
}
</style>
	<div id="product-detailed" class="layui-font-14">

		<!-- 查询区域 -->
		<div id='product-detailed-select'>
			<form class="layui-form layui-col-space20">
			
			<input name='id' value='${id}' hidden>
				<!-- 价格区间 -->
				<div class="layui-input-group layui-col-md6">
    				<span class="layui-input-prefix">价格区间:</span>
   					 <input name='minPrice' id="minPrice" type="number" min='0' lay-affix="number" placeholder="最低价" step="0.1" lay-precision="2" class="layui-input">
    				<span class="layui-input-prefix no">至</span>
    				<input name='maxPrice' id="maxPrice" type="number" min='0.10' lay-affix="number" placeholder="最高价" step="0.1" lay-precision="2" class="layui-input">
		</div>
			
				<c:forEach items="${psList}" var='ps' varStatus="loop">
					<div class="layui-input-group layui-col-md3">
						<span class="layui-input-prefix">${ps.specificationsName}:</span>
						<select name="spec_${loop.index}">
							<option value="">请选择</option>
                				<c:forEach items='${valList[loop.index]}' var='v'>
                					<option>${v}</option>
                				</c:forEach>
						</select>
					</div>
				</c:forEach>

				<div class="layui-col-md3">
					<button style="width: 125px; color: rgb(85, 170, 255);" class="layui-btn layui-btn-primary layui-btn-radius">搜索</button>
				</div>
			</form>
		</div>
		
		
		<hr style="margin-top: 25px;">
		
		
		<!-- 显示内容 -->
		<div id="product-detailed-body">
			<div class="buttons">
				<button style='margin-right: 10px' onclick="addNewProdcutDetailed()" class="layui-btn layui-bg-blue">添加规格</button>
				<button onclick="addNewProdcutDetailed()" class="layui-btn layui-bg-blue">添加规格组合</button>
				<button onclick="updateCheckedProdcut()" class="layui-btn layui-bg-blue">编辑规格组合</button>
				<button onclick="delCheckedProdcut()" class="layui-btn layui-bg-blue">删除规格组合</button>
				<button onclick="refreshPDAndClearForm()" style="float: right;" class="layui-btn layui-bg-blue">
						<i class="layui-icon layui-icon-refresh" style=""></i>
				</button>
			</div>

			<div class="tabel">
				<table class="layui-hide" id="product-detailed-body-table">
				</table>
				<script type="text/html" id="product_detailed_edit">
			  <div class="layui-clear-space">
			    <a class="layui-btn layui-btn-xs layui-bg-blue" lay-event="edit">编辑</a>
			    <a class="layui-btn layui-btn-xs layui-bg-blue" lay-event="del">删除</a>
			  </div>
			</script>
			</div>

		</div>
	</div>
	
	<script>
		var form = layui.form;

		// 当表单元素被动态插入时，需主动进行组件渲染才能显示
		form.render(); // 渲染全部表单

		//表格渲染
		var table = layui.table;
		var dropdown = layui.dropdown;
		
		
		//刷新并清空表单
		function refreshPDAndClearForm(){
			// 清空价格区间输入框的值
			$('#minPrice').val('');
			$('#maxPrice').val('');

			// 清空规格选择框的值
			$('#product-detailed-select select[name^="spec"]').val('');

			refreshPDTable()
		}
		//该页面的表格
		var pdinst;
		// 已知数据渲染
		function refreshPDTable(){
			// 销毁当前表格实例
			if(pdinst){
				pdinst.reload({}); // 先清空数据
				pdinst.reload('null'); // 然后销毁表格
			}
			
			pdinst=table.render({
				elem : '#product-detailed-body-table',
				cols : [ ${tableHead}],
				url : '/vivoShop/background/pages/function/product_detailed/selAll?id=<%=request.getAttribute("id")%>',
				//skin: 'line', // 表格风格
				//even: true,
				page : true, // 是否显示分页
				limits : [ 5, 10, 15 ],
				limit : 5
			// 每页默认显示的数量
			});
		}
		refreshPDTable();
		  var REG_BODY = /<body[^>]*>([\s\S]*)<\/body>/;

	        function getBody(content){
	            var result = REG_BODY.exec(content);
	            if(result && result.length === 2)
	                return result[1];
	            return content;
	        }
		
	        
	  	      
	       
	        
	        
		// 触发单元格工具事件
		table.on('tool(product-detailed-body-table)',function(obj) { // 双击 toolDouble
			var data = obj.data; // 获得当前行数据
			var index1;
			if (obj.event === 'edit') {
				updateProduct(data);
			} else if (obj.event === 'del') {
				//删除
				delProdcut(data)
			}			
		});
		
		
		//搜索
		$("#product-detailed-select form").submit(function(event){
			event.preventDefault();

		    // 将表单转换为序列化对象
		    var formData = $(this).serializeArray();
			// 将数组转换为对象
		    var serializedData = formData.reduce(function(obj, item) {
		        obj[item.name] = item.value;
		        return obj;
		    }, {});
			
		    // 重新加载表格数据
		    pdinst.reload({
		        url: '/vivoShop/background/pages/function/product_detailed/selWhere',
		        where: serializedData
		    });
		})
		
		//新增规格组合
		function addNewProdcutDetailed(){
			
		}
		
	</script>



</body>
</html>
