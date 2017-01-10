<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/commons/include/html_doctype.html" %>
<html>
<head>
<title>能力分类管理</title>
<%@include file="/commons/include/get.jsp" %>

</head>
<body>
	<div class="panel">
		<div class="panel-top">
			<div class="tbar-title">
				<span class="tbar-label">能力分类管理列表</span>
			</div>
			<div class="panel-toolbar">
				<div class="toolBar">
					<div class="group"><a class="link search" id="btnSearch">查询</a></div>
					<div class="l-bar-separator"></div>
					<div class="group"><a class="link add" href="edit.ht">添加</a></div>
					<div class="l-bar-separator"></div>
					<div class="group"><a class="link update" id="btnUpd" action="edit.ht">修改</a></div>
					<div class="l-bar-separator"></div>
					<div class="group"><a class="link del"  action="del.ht">删除</a></div>
				</div>	
			</div>
			<div class="panel-search">
				<form id="searchForm" method="post" action="list.ht">
					<div class="row">
						<span class="label">能力分类名称:</span><input type="text" name="Q_name_SL"  class="inputText" />
						<span class="label">层级:</span><input type="text" name="Q_levels_SL"  class="inputText" />
						<span class="label">父级:</span><input type="text" name="Q_parentName_SL"  class="inputText" />
					</div>
				</form>
			</div>
		</div>
		<div class="panel-body">
	    	<c:set var="checkAll">
				<input type="checkbox" id="chkall"/>
			</c:set>
		    <display:table name="capabilityClassList" id="capabilityClassItem" requestURI="list.ht" sort="external" cellpadding="1" cellspacing="1" export="true"  class="table-grid">
				<display:column title="${checkAll}" media="html" style="width:30px;">
			  		<input type="checkbox" class="pk" name="id" value="${capabilityClassItem.id}">
				</display:column>
				<display:column property="name" title="能力分类名称" sortable="true" sortName="name"></display:column>
				<display:column property="levels" title="层级" sortable="true" sortName="levels"></display:column>
				<display:column property="parentName" title="父级" sortable="true" sortName="parentName"></display:column>
				<display:column title="管理" media="html" style="width:180px">
					<a href="del.ht?id=${capabilityClassItem.id}" class="link del">删除</a>
					<a href="edit.ht?id=${capabilityClassItem.id}" class="link edit">编辑</a>
					<a href="get.ht?id=${capabilityClassItem.id}" class="link detail">明细</a>
					
				</display:column>
			</display:table>
			<hotent:paging tableId="capabilityClassItem"/>
		</div><!-- end of panel-body -->				
	</div> <!-- end of panel -->
</body>
</html>


