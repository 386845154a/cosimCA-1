<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/commons/include/html_doctype.html" %>
<html lang="zh-CN">
<head>
    <title>专业工具树</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <%@include file="/commons/datadriver/getbase.jsp" %>
    <link href="${ctx}/styles/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <script src="${ctx}/styles/layui/lay/dest/layui.all.js"></script>
    <link href="${ctx}/newtable/bootstrap.css" rel="stylesheet" type="text/css"/>

    <style type="text/css">
        html, body {
            padding: 0px;
            margin: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
        }
        .panel-body {
            background-color: #FFFFFF !important;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            loadTree();
            $.get("toollist1.ht?major="+1 , function (data) {
                $('#toolsListFrame').html(data);
            });
        });

        //布局大小改变的时候通知tab，面板改变大小
        function heightChanged(options) {
            $("#tree").height(options.middleHeight - 60);
        }
        ;

        var test = '';
        $.ajax({
            type: "Post",
            url: "${ctx}/datadriver/tool/showtree.ht",
            datatype: 'json',
            async: false,
            success: function (data) {
                test = data;
//                alert("success");
            },
            error: function (msg) {
                alert(msg);
            }
        });

        function strToJson(str) {
            var json = eval('(' + str + ')');
            return json;
        }

        function loadTree() {
            layui.use(['tree', 'layer'], function () {

                var layer = layui.layer
                        , $ = layui.jquery;
                layui.tree({
                    elem: '#demo2' //指定元素
                    , target: '_blank' //是否新选项卡打开（比如节点返回href才有效）
                    , click: function (item) { //点击节点回调
                        if (item.name == undefined) return;
                        $.get("toollist1.ht?major=" + item.ddMajorId, function (data) {
                            $('#toolsListFrame').html(data);
                        });
                    }
                    , nodes: strToJson(test)
                });
            });
        }

    </script>
    <%
        request.setCharacterEncoding("UTF-8");
        if (request.getParameter("major")==null)
        {
        }
        else {

            String major=new String(request.getParameter("major").getBytes("ISO-8859-1"),"utf-8");
            out.print("name:"+major);}
    %>
</head
<body>
<div class="container-fluid" style="height: 100%">
    <div class="col-xs-3" style="height: 100%">
        <div class="panel panel-primary" style="height: 100%">
            <div class="panel-heading">工具专业树</div>
            <div class="panel-body" style="height: 93%; overflow-x: hidden;overflow-y: auto">
                <ul id="demo2"></ul>
            </div>

        </div>
    </div>
    <div class="col-xs-9" style="height: 100%">
        <div class="panel panel-primary" style="height: 100%">
            <div class="panel-heading">专业工具列表</div>
            <div class="panel-body" style="height: 93%">
                <div id="toolsListFrame" style="height: 100%"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>