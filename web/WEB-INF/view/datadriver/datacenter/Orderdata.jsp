<%--
  Created by IntelliJ IDEA.
  User: 忠
  Date: 2017/2/20
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" pageEncoding="UTF-8" %>
<%@include file="/commons/include/html_doctype.html" %>
<%@page import="com.hotent.core.util.ContextUtil" %>
<html>
<head>
    <%--<title>任务数据中心</title>--%>
    <%@include file="/commons/include/form.jsp" %>
    <%@include file="/newtable/tablecontext.jsp" %>
    <script type="text/javascript" src="${ctx}/js/hotent/CustomValid.js"></script>
    <script type="text/javascript" src="${ctx}/js/hotent/formdata.js"></script>
    <script type="text/javascript" src="${ctx}/js/hotent/subform.js"></script>
    <link href="${ctx}/styles/layui/css/layui.css" rel="stylesheet" type="text/css"/>
</head>
<%--<%--%>
<%--request.setCharacterEncoding("UTF-8");--%>
<%--String major=new String(request.getParameter("major").getBytes("ISO-8859-1"),"utf-8");--%>
<%--out.print("name:"+major);--%>
<%--%>--%>
<body>
<table id="tb_departments" data-url="publishorderdata1.ht?id=<%=request.getParameter("id")%>">
</table>
<script src="${ctx}/styles/layui/lay/dest/layui.all.js"></script>
<script src="${ctx}/newtable/Orderdata.js"></script>
</body>
</html>