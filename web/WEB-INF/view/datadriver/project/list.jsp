<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ page import="com.casic.datadriver.tool.Token" %>  --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/commons/include/html_doctype.html" %>
<html>
<head>
    <title>项目基础信息列表</title>
    <%@include file="/commons/include/get.jsp" %>
    <script type="text/javascript" src="${ctx}/js/hotent/CustomValid.js"></script>
    <script type="text/javascript" src="${ctx}/js/hotent/formdata.js"></script>
    <script type="text/javascript" src="${ctx}/js/hotent/subform.js"></script>
    <link href="${ctx}/styles/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
        var Name="1";
//        $("#start").click(function(){
//
//            $(this).attr("disabled","true"); //设置变灰按钮  
////            $("#messageForm").submit();//提交表单  
//            setTimeout("$('#submit').removeAttr('disabled')",30); //设置三秒后提交按钮 显示  
//
//        })

        </script>


        <style>
        .fl {
            float: left;
        }

        .fr {
            float: right;
        }

        .pages {
            float: right;
        }

        .page_line {
            display: inline;
        }
    </style>
</head>=

<body>

<div class="layui-tab layui-tab-card">
    <ul class="layui-tab-title">
        <li class="layui-this">项目管理列表</li>
    </ul>
    <div class="layui-tab-content">

        <div style="height: 50px;">
            <form id="searchForm" method="post" action="list.ht">


                            <span class="fl">
                            <%--<span class="label">项目编号:</span><input type="text" name="Q_id_SL" class="inputText"--%>
                            <%--value="${param['Q_id_SL']}"/>--%>
                            <input type="text" name="Q_name_SL " class="layui-input"
                                   value="${param['Q_name_SL']}" placeholder="项目名称"/>
                            <%--<span class="label">创建日期 从:</span> <input name="Q_createStartDate_SL" class="inputText date"--%>
                            <%--value="${param['Q_createStartDate_DL']}"/>--%>
                            <%--<span class="label">至: </span><input name="Q_createEndData_SL" class="inputText date"--%>
                            <%--value="${param['Q_createEndData_DL']}"/>--%>

                            </span>
                <span class="fr"><a class="link search" id="btnSearch">查询</a>
                            <a class="layui-btn layui-btn-warm" href="edit.ht">添加</a>

                            <a class="layui-btn" action="edit.ht">修改</a>

                            <a class="layui-btn layui-btn-danger" action="del.ht">删除</a>
                            </span>


            </form>
        </div>

=======
        <blockquote class="layui-elem-quote">
            <div style="height: 40px;">
                <form id="searchForm" method="post" action="list.ht">


                    <div class="fl">
                        <%--<span class="label">项目编号:</span><input type="text" name="Q_id_SL" class="inputText"--%>
                        <%--value="${param['Q_id_SL']}"/>--%>
                        <input type="text" name="Q_name_SL " class="layui-input"
                               value="${param['Q_name_SL']}" placeholder="项目名称"/>
                        <%--<span class="label">创建日期 从:</span> <input name="Q_createStartDate_SL" class="inputText date"--%>
                        <%--value="${param['Q_createStartDate_DL']}"/>--%>
                        <%--<span class="label">至: </span><input name="Q_createEndData_SL" class="inputText date"--%>
                        <%--value="${param['Q_createEndData_DL']}"/>--%>

                    </div>
                    <div class="fr">
                        <a class="layui-btn layui-btn-normal" id="Search"><i class="layui-icon">&#xe615;</i> 查询</a>
                        <a class="layui-btn" href="edit.ht"><i class="layui-icon">&#xe61f;</i> 添加</a>

                        <%--<a class="layui-btn layui-btn-danger" action="del.ht"><i--%>
                        <%--class="layui-icon">&#xe640;</i> 删除</a>--%>
                        <a class="layui-btn layui-btn-primary" onclick="location.reload()"><i class="layui-icon">
                            &#x1002;</i> 刷新</a>
                    </div>


                </form>
            </div>
        </blockquote>

        <c:set var="checkAll">
            <input type="checkbox" id="chkall"/>
        </c:set>
        <display:table name="projectList" id="ProjectItem" requestURI="list.ht" sort="external" cellpadding="0"
                       cellspacing="0" export="false" class="layui-table" pagesize="10">
            <display:column title="${checkAll}" media="html" style="width:3%;">
                <input type="checkbox" class="pk" name="id" value="${ProjectItem.ddProjectId}">
            </display:column>
            <%--<display:column property="ddProjectId" title="项目编号" sortable="true" sortName="DD_PROJECT_ID"--%>
            <%--maxLength="80"></display:column>--%>
            <display:column property="ddProjectName" title="项目名称" sortable="true" sortName="DD_PROJECT_NAME"
                            maxLength="80"></display:column>
            <display:column property="ddProjectResponsibleUnits" title="项目责任单位" maxLength="80"></display:column>
            <display:column property="ddProjectPhaseId" title="项目阶段"></display:column>
            <display:column property="ddProjectCreateDatatime" title="项目创建时间" sortable="true"
                            sortName="DD_PROJECT_CREATE_DATATIME"></display:column>
            <%--<display:column property="ddProjectDescription" title="项目基本描述" maxLength="80"></display:column>--%>
            <%--<display:column property="ddProjectOwnerSystemId" title="项目所属系统" maxLength="80"></display:column>--%>
            <%--<display:column property="ddProjectCreatorId" title="项目创建者id" maxLength="80"></display:column>--%>
            <%--<display:column property="ddProjectFixedPattern" title="项目是否固化"></display:column>--%>
            <%--<display:column property="ddProjectResponsiblePersonId" title="项目负责人id" sortable="true"--%>
            <%--sortName="DD_PROJECT_RSPONSIBLE_PERSON_ID"></display:column>--%>
            <%--<display:column property="ddProjectType" title="项目类型" maxLength="80"></display:column>--%>
            <%--<display:column property="ddProjectBelongModel" title="所属型号" maxLength="80"></display:column>--%>
            <%--<display:column property="ddProjectSecretLevel" title="项目密级" maxLength="80"></display:column>--%>
            <%--<display:column property="ddProjectChangePersonId" title="修改人id"></display:column>--%>
            <%--<display:column property="ddProjectPriority" title="优先级" sortable="true"></display:column>--%>
            <%--<display:column property="ddProjectRemark" title="备注" maxLength="80"></display:column>--%>
            <%--<display:column property="ddProjectState" title="状态" maxLength="80"></display:column>--%>
            <%--<display:column property="ddProjectPlanStartDate" title="计划开始日期" maxLength="80"></display:column>--%>
            <%--<display:column property="ddProjectCompleteDate" title="计划完成日期"></display:column>--%>
            <%--<display:column property="ddProjectActualStartDate" title="实际开始日期"></display:column>--%>
            <%--<display:column property="ddProjectActualCompleteData" title="实际结束日期" maxLength="80"></display:column>--%>
            <%--<display:column property="ddProjectCurrentStage" title="当前项目进度"></display:column>--%>
            <%--<display:column property="ddProjectScheduleState" title="项目研制阶段"></display:column>--%>

            <display:column title="操作" media="html" style="width:380px">

                <%--          <a href="edit.ht?id=${ProjectItem.ddProjectId}" class="layui-btn layui-btn-small">编辑</a>--%>
                <%--<a href="start.ht?id=${ProjectItem.ddProjectId}"--%>
                <%--class="layui-btn layui-btn-primary layui-btn-small">启动</a>--%>
                <%--<a class="layui-btn layui-btn-small layui-btn-success"--%>
                <%--href="${ctx}/datadriver/task/list.ht?id=${ProjectItem.ddProjectId}">任务</a>--%>
                <%--<a href="" class="layui-btn layui-btn-small layui-btn-warm">引用</a>--%>
                <%--<a href="del.ht?id=${ProjectItem.ddProjectId}"--%>
                <%--class="layui-btn layui-btn-small layui-btn-danger">删除</a>--%>
                <c:choose><c:when test="${ProjectItem.ddProjectState==1}">
                              <a href="edit.ht?id=${ProjectItem.ddProjectId}" class="layui-btn layui-btn-disabled">编辑</a>
                    <a href="start.ht?id=${ProjectItem.ddProjectId}"
                       class="layui-btn layui-btn-disabled">启动</a>
                    <a class="layui-btn layui-btn-small layui-btn-success"
                       href="${ctx}/datadriver/task/list.ht?id=${ProjectItem.ddProjectId}">任务</a>
                    <a href="" class="layui-btn layui-btn-disabled">引用</a>
                    <a href="del.ht?id=${ProjectItem.ddProjectId}"
                       class="layui-btn layui-btn-disabled">删除</a>
                </c:when>
                    <c:otherwise>
                        <a href="edit.ht?id=${ProjectItem.ddProjectId}" class="layui-btn layui-btn-small">编辑</a>
                        <a href="start.ht?id=${ProjectItem.ddProjectId}"
                           class="layui-btn layui-btn-primary layui-btn-small">启动</a>
                        <a class="layui-btn layui-btn-small layui-btn-success"
                           href="${ctx}/datadriver/task/list.ht?id=${ProjectItem.ddProjectId}">任务</a>
                        <a href="" class="layui-btn layui-btn-small layui-btn-warm">引用</a>
                        <a class="layui-btn layui-btn-mini layui-btn-normal"
                   href="${ctx}/datadriver/index/indexedit.ht?id=${ProjectItem.ddProjectId}"><i class="layui-icon">
                    &#xe60a;</i> 指标</a>
                        <a href="del.ht?id=${ProjectItem.ddProjectId}"
                           class="layui-btn layui-btn-small layui-btn-danger">删除</a>>
                    </c:otherwise></c:choose>

            </display:column>
        </display:table>
        <%--<hotent:paging tableId="ProjectItem"/>--%>
    </div>
</div>

</body>
<script src="${ctx}/styles/layui/lay/dest/layui.all.js"></script>

</html>


