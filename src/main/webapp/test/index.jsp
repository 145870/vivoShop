<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>省市县三级联动</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
    // 页面加载完成后，加载省份列表
    $.ajax({
        url: "GetAreas",
        type: "GET",
        data: { level: 1 }, // 1 表示省级
        success: function(data) {
            $("#province").html(data);
        }
    });

    // 当省份选择改变时，加载对应城市列表
    $("#province").change(function(){
        var parentId = $(this).val();
        $.ajax({
            url: "GetAreas",
            type: "GET",
            data: { level: 2, parentId: parentId }, // 2 表示市级
            success: function(data) {
                $("#city").html(data);
                $("#county").html("<option value=''>请选择县区</option>");
            }
        });
    });

    // 当城市选择改变时，加载对应县区列表
    $("#city").change(function(){
        var parentId = $(this).val();
        $.ajax({
            url: "GetAreas",
            type: "GET",
            data: { level: 3, parentId: parentId }, // 3 表示区县级
            success: function(data) {
                $("#county").html(data);
            }
        });
    });
});
</script>
</head>
<body>
  <select id="province">
    <option value="">请选择省份</option>
  </select>
  <select id="city">
    <option value="">请选择城市</option>
  </select>
  <select id="county">
    <option value="">请选择县区</option>
  </select>
</body>
</html>