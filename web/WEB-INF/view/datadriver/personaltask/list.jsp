<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/commons/include/html_doctype.html" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="f" uri="http://www.jee-soft.cn/functions" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>
<%@ taglib prefix="hotent" uri="http://www.jee-soft.cn/paging" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>个人任务</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8"/>
    <script src="${ctx}/newtable/jquery.js"></script>
    <%--<%@include file="/commons/include/get.jsp" %>--%>

    <link href="${ctx}/styles/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/newtable/bootstrap.css" rel="stylesheet" type="text/css"/>
    <style>
        .fl {
            float: left;
        }

        .fr {
            float: right;
        }
    </style>
</head>
<body>

<div class="layui-tab layui-tab-card">
    <ul class="layui-tab-title">
        <li class="layui-this">我的任务</li>
    </ul>
    <div class="layui-tab-content">
        <blockquote class="layui-elem-quote">
            <div style="height: 36px;">
                <form id="searchForm" method="post" action="list.ht">
                    <div class="fl">
                        <input type="text" name="Q_name_SL " class="layui-input layui-"
                               value="${param['Q_name_SL']}" placeholder="任务名称"/>
                    </div>
                    <div class="fr">
                        <a class="layui-btn layui-btn-normal layui-btn-small" id="Search"><i class="layui-icon">&#xe615;</i> 查询</a>
                        <a class="layui-btn layui-btn-primary layui-btn-small" onclick="location.reload()"><i class="layui-icon">
                            &#xe63d;</i> 刷新</a>
                    </div>
                </form>
            </div>
        </blockquote>
        <%--<c:set var="checkAll">--%>
        <%--<input type="checkbox" id="chkall"/>--%>
        <%--</c:set>--%>
        <display:table name="taskList" id="taskList" requestURI="list.ht" sort="external" cellpadding="0"
                       cellspacing="0" export="false" class="layui-table" pagesize="10">
            <%--<display:column title="${checkAll}" media="html" style="width:3%;">--%>
            <%--<input type="checkbox" class="pk" name="id" value="${taskList.ddTaskId}">--%>
            <%--</display:column>--%>
            <display:column property="ddTaskProjectName" title="任务所属项目名称" maxLength="80" sortable="false"
                            style="width:40%"></display:column>
            <display:column property="ddTaskName" title="任务名称" sortable="false" maxLength="80"
                            style="width:40%"></display:column>
            <display:column title="任务阶段" media="html" style="width:13%">
                <c:choose><c:when test="${taskList.ddTaskState==1}">
                    <i style="font-size: 14px; color: #F7B824;">待审核</i>
                </c:when>
                    <c:when test="${taskList.ddTaskState==0}">
                        <i style="font-size: 14px; color: #1E9FFF;">未提交</i>
                    </c:when>
                    <c:otherwise>
                        <i style="font-size: 14px; color: #5FB878;">已完成</i>
                    </c:otherwise></c:choose>
            </display:column>
            <display:column title="操作" media="html" style="width:7%">
                <c:choose><c:when test="${taskList.ddTaskState==0}">
                    <a href="todotask.ht?id=${taskList.ddTaskId}" class="layui-btn layui-btn-normal layui-btn-mini"><i
                            class="layui-icon">&#xe642;</i> 办理</a>
                </c:when>
                    <c:otherwise>
                        <a href="recovertask.ht?id=${taskList.ddTaskId}"
                           class="layui-btn layui-btn-warm layui-btn-mini"><i
                                class="layui-icon">&#xe603;</i> 收回</a>
                    </c:otherwise></c:choose>
            </display:column>
        </display:table>
    </div>
</div>
</body>
<script src="${ctx}/styles/layui/lay/dest/layui.all.js"></script>
</html>


