<%--
  Created by IntelliJ IDEA.
  User: dodo
  Date: 2016/12/25
  Time: 下午9:57
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="f" uri="http://www.jee-soft.cn/functions" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>
<%@ taglib prefix="hotent" uri="http://www.jee-soft.cn/paging" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/commons/include/html_doctype.html" %>
<html lang="zh-CN">
<head>
    <title>办理任务</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/slide/css/default.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/slide/css/component.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/newtable/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/check/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/check/build.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/fourpanel/fourpanel.css"/>

    <script src="${ctx}/styles/slide/js/modernizr.custom.js"></script>
    <script src="${ctx}/newtable/jquery.js"></script>
    <script src="${ctx}/newtable/bootstrap.js"></script>
    <script src="${ctx}/styles/layui/jquery.dragsort-0.5.2.min.js"></script>
</head>
<body>

<%--<div class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right entity-well" id="cbp-spmenu-s2"--%>
     <%--style="padding-right: 0px">--%>
<%--</div>--%>
<div class="container-fluid">
    <ul class="nav nav-tabs" role="tablist" id="myTab">
        <li role="presentation" class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                ${TaskInfo.ddTaskName} <span class="caret"></span>
            </a>
            <ul class="dropdown-menu" style="overflow: auto">
                <c:forEach var="taskInfoListItem" items="${taskInfoList}">
                    <li>
                        <a href="todotask.ht?id=${taskInfoListItem.ddTaskId}">${taskInfoListItem.ddTaskName}</a>
                    </li>
                </c:forEach>
            </ul>
        </li>
        <li role="presentation" class="active" id="switch_attr_task"><a href="#data" data-toggle="tab"
                                                                        role="tab">数据看板</a>
        </li>
        <li role="presentation" id="switch_attr_publish"><a href="#publish" data-toggle="tab" role="tab">已发布</a>
        </li>
        <li role="presentation" id="switch_attr_order"><a href="#order" data-toggle="tab" role="tab">已订阅</a>
        </li>
        <li role="presentation" id="switch_attr_index"><a href="#index" data-toggle="tab" role="tab">项目指标</a></li>
        <li role="presentation"><a href="#calendar" data-toggle="tab" role="tab">日程</a></li>
        <div class="pull-right">
            <a id="statis_btn" href="#" class="btn btn-warning"><span class="glyphicon glyphicon-stats"></span> 进程统计
            </a>


            <a class="btn btn-success" href="#" data-toggle="modal" id="create_task"
               data-remote="${ctx}/datadriver/privatedata/addprivatedata.ht?id=${TaskInfo.ddTaskId}"
               data-target="#adddata"><span class="glyphicon glyphicon-plus"></span> 创建私有</a>


            <a class="btn btn-primary" href="#" data-toggle="modal" id="submit_btn"
               data-remote="submittask.ht?id=${TaskInfo.ddTaskId}"
               data-target="#submittask"><span class="glyphicon glyphicon-ok"></span> 完成任务</a>
            <%--<a id="" class="btn btn-primary" href="submittask.ht?id=${TaskInfo.ddTaskId}"><span class="glyphicon glyphicon-ok"></span> 完成任务--%>

            </a>
        </div>
    </ul>
    <br>
    <div class="tab-content board-view">
        <div role="tabpanel" class="tab-pane active board-scrum-view" id="data" style="height: 100%">
            <div class="row paneldocker" style="height: 100%">
                <div class="col-xs-3" style="height: 100%">
                    <div class="panel panel-default task-panel">
                        <div class="panel-heading">
                            私有数据
                        </div>
                        <div class="panel-body panelheight" style="overflow: auto">
                            <ul id="createpanel" class="scrum-stage-tasks">
                                <c:forEach var="privateDataListbyTaskItem" items="${privateDataListbyTask}">
                                    <li class="task task-card ui-sortable-handle " id="showRightPush"
                                        onclick="showDataContent(${privateDataListbyTaskItem.ddDataId})" data-toggle='modal' data-target='#datadetailcontent'>
                                        <div class="checkbox checkbox-primary">
                                            <input id="checkbox1" type="checkbox">
                                            <label for="checkbox1">
                                                    ${privateDataListbyTaskItem.ddDataName}
                                            </label>
                                        </div>
                                        <label class="pull-right taskname">${privateDataListbyTaskItem.ddDataTaskName}</label>
                                        <input type="hidden" value="${privateDataListbyTaskItem.ddDataId}"
                                               name="release"/>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-xs-3" style="height: 100%">
                    <div class="panel panel-info task-panel">
                        <div class="panel-heading">
                            发布数据
                        </div>
                        <div class="panel-body panelheight" style="overflow: auto">
                            <ul id="publishpanel" class="scrum-stage-tasks">
                                <c:forEach var="publishDataListItem" items="${publishDataList}">
                                    <li class="task task-card ui-sortable-handle" id="showRightPush"
                                        onclick="showDataContent(${publishDataListItem.ddDataId})" data-toggle='modal' data-target='#datadetailcontent'>
                                        <div class="checkbox checkbox-primary">
                                            <input id="checkbox2" type="checkbox">
                                            <label for="checkbox2">
                                                    ${publishDataListItem.ddDataName}
                                            </label>
                                        </div>
                                        <label class="pull-right taskname">${publishDataListItem.ddDataTaskName}</label>
                                        <input type="hidden" value="${publishDataListItem.ddDataId}"
                                               name="release"/>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-xs-3" style="height: 100%">
                    <div class="panel panel-success task-panel">
                        <div class="panel-heading">
                            可订阅
                        </div>
                        <div class="panel-body panelheight" style="overflow: auto">
                            <ul id="canorderpanel" class="scrum-stage-tasks">
                                <c:forEach var="canBeOrderPrivatedataListItem" items="${canBeOrderPrivatedataList}">
                                    <li class="task task-card ui-sortable-handle " id="showRightPush"
                                        onclick="showDataContent(${canBeOrderPrivatedataListItem.ddDataId})" data-toggle='modal' data-target='#datadetailcontent'>
                                        <div class="checkbox">
                                            <input id="checkbox3" type="checkbox">
                                            <label for="checkbox3">
                                                    ${canBeOrderPrivatedataListItem.ddDataName}
                                            </label>
                                        </div>
                                        <label class="pull-right taskname">${canBeOrderPrivatedataListItem.ddDataTaskName}</label>
                                        <input type="hidden" value="${canBeOrderPrivatedataListItem.ddDataId}"
                                               name="release"/>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-xs-3" style="height: 100%">
                    <div class="panel panel-warning task-panel">
                        <div class="panel-heading">
                            已订阅
                        </div>
                        <div class="panel-body panelheight" style="overflow: auto">
                            <ul id="orderpanel" class="scrum-stage-tasks">
                                <c:forEach var="OrderPrivatedataListItem" items="${OrderPrivatedataList}">
                                    <li class="task task-card ui-sortable-handle" id="showRightPush"
                                        onclick="showDataContent(${OrderPrivatedataListItem.ddDataId})" data-toggle='modal' data-target='#datadetailcontent'>
                                        <div class="checkbox">
                                            <input id="checkbox4" type="checkbox">
                                            <label for="checkbox4">
                                                    ${OrderPrivatedataListItem.ddDataName}
                                            </label>
                                        </div>
                                        <label class="pull-right taskname">${OrderPrivatedataListItem.ddDataTaskName}</label>
                                        <input type="hidden" value="${OrderPrivatedataListItem.ddDataId}"
                                               name="release"/>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div role="tabpanel" class="tab-pane" id="index">

        </div>
        <div role="tabpanel" class="tab-pane" id="publish">
        </div>
        <div role="tabpanel" class="tab-pane" id="order">

        </div>
        <div role="tabpanel" class="tab-pane" id="calendar">
        </div>
    </div>
</div>
<%--添加任务数据--%>
<div class="modal fade" id="adddata" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">

        </div>
    </div>
</div>
<%--提交信息--%>
<div class="modal fade" id="submittask" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">

        </div>
    </div>
</div>
<%--统计--%>
<div class="modal fade" id="statis" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">

        </div>
    </div>
</div>

<%--数据详情--%>
<div class="modal fade" id="datadetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="overflow: auto">

        </div>
    </div>
</div>
</body>
<script src="${ctx}/styles/slide/js/classie.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#createpanel,#publishpanel").dragsort({
            itemSelector: "li",
            dragSelector: "li",
            dragBetween: true,
            dragEnd: saveOrder,
            placeHolderTemplate: '<li class="task task-card ui-sortable-handle"></li>'
        });
        $("#canorderpanel,#orderpanel").dragsort({
            itemSelector: "li",
            dragSelector: "li",
            dragBetween: true,
            dragEnd: saveOrder2,
            placeHolderTemplate: '<li class="task task-card ui-sortable-handle"></li>'
        });
        function saveOrder() {
            var data = $(this).children('input').val();
            var parentid = $(this).parent().attr("id");
            $.get("createtopublish.ht?id=" + data + "&parent=" + parentid);
        }

        function saveOrder2() {
            var data = $(this).children('input').val();
            var parentid = $(this).parent().attr("id");
            $.get("canordertoorder.ht?id=" + data + "&parent=" + parentid + "&taskId=" +${TaskInfo.ddTaskId});
        }
    });

    var showLeftPush = document.getElementById('showLeftPush'),
            showRightPush = document.getElementById('showRightPush'),
            switch_attr_index = document.getElementById('switch_attr_index'),
            switch_attr_task = document.getElementById('switch_attr_task'),
            switch_attr_publish = document.getElementById('switch_attr_publish'),
            switch_attr_order = document.getElementById('switch_attr_order'),
            statis_btn = document.getElementById('statis_btn'),
            create_task = document.getElementById('create_task');
    function showDataContent(dataId) {
        <%--$.get("${ctx}/datadriver/privatedata/edit.ht?id=" + taskId, function (data) {--%>
        <%--$('#cbp-spmenu-s2').html(data);--%>
        <%--});--%>
        <%--classie.toggle(obj, 'active');--%>
        <%--classie.toggle(menuRight, 'cbp-spmenu-open');--%>

//        classie.toggle(obj, 'active');
//        classie.toggle(body, 'cbp-spmenu-push-toleft');
//        classie.toggle(menuRight, 'cbp-spmenu-open');
        $('#datadetail').modal({
            keyboard: true,
            remote: "${ctx}/datadriver/privatedata/edit.ht?id=" + dataId
        })

    }
    $("#datadetail").on("hidden.bs.modal", function() {
        $(this).removeData("bs.modal");
    });
    switch_attr_index.onclick = function () {
        $.get("${ctx}/datadriver/index/indexlist.ht?id=${TaskInfo.ddTaskProjectId}", function (data) {
            $('#index').html(data);
        });
    }
    switch_attr_task.onclick = function () {

    }
    switch_attr_publish.onclick = function () {
        $.get("${ctx}/datadriver/personaltask/submitpublish.ht?id=${TaskInfo.ddTaskId}", function (data) {
            $('#publish').html(data);
        });
    }
    switch_attr_order.onclick = function () {
        $.get("${ctx}/datadriver/personaltask/showorder.ht?id=${TaskInfo.ddTaskId}", function (data) {
            $('#order').html(data);
        });
    }
    statis_btn.onclick = function () {
        $('#statis').modal({
            keyboard: true,
            remote: "statis.ht?id=${TaskInfo.ddTaskId}"
        })
    }
    <%--create_task.onclick = function () {--%>
        <%--$('#adddata').modal({--%>
            <%--keyboard: true,--%>
            <%--remote: "${ctx}/datadriver/privatedata/addprivatedata.ht?id=${TaskInfo.ddTaskId}"--%>
        <%--})--%>
    <%--}--%>
</script>
</html>
