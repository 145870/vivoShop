<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script type="text/javascript" src="/vivoShop/background/lib/layui/layui.js"></script>
    <link href="/vivoShop/background/lib/layui/css/layui.css" rel="stylesheet">
    <script type="text/javascript" src="/vivoShop/static/jquery-3.5.1.min.js"></script>
</head>
<body>
<table id="test"></table>

<script>
layui.use(['table'], function(){
    var table = layui.table;

    // 定义表格数据
    var data = [
        {pname: '商品1', content: '跨行内容1', children: [
            {pname: '子商品1', content: '子内容1'},
            {pname: '子商品2', content: '子内容2'}
        ]},
        {pname: '商品2', content: '跨行内容2', children: [
            {pname: '子商品3', content: '子内容3'}
        ]},
        {pname: '商品3', content: '跨行内容3', children: []}, // 这里可以定义空数组，表示没有子商品
        {pname: '商品4', content: '普通内容4', children: []}
    ];

    // 渲染表格
    table.render({
        elem: '#test',
        cols: [[
            {field: 'pname', title: '商品名称', width: 200},
            {field: 'content', title: '内容'}
        ]],
        data: data,
        done: function(res, curr, count){
            // 在表格渲染完成后，对含有子商品的行进行子表格的渲染
            $("tbody tr").each(function(index){
                var rowData = res.data[index];
                console.log(rowData)
                if(rowData.children.length > 0){
                    // 子表格的 HTML
                    var html = '<table class="layui-table layui-table-border" style="margin:0px;">';
                    for(var i=0; i<rowData.children.length; i++){
                        var child = rowData.children[i];
                        html += '<tr>';
                        html += '<td>'+child.pname+'</td>';
                        html += '<td>'+child.content+'</td>';
                        html += '</tr>';
                    }
                    html += '</table>';
                    // 将子表格 HTML 插入到当前行的最后一个单元格中
                    $(this).children('td:last-child').html(html);
                }
            });
        }
    });
});
</script>
</body>
</html>