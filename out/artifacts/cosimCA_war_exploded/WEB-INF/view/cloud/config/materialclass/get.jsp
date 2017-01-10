
<%--
	time:2013-04-16 18:32:56
--%>
<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/commons/include/html_doctype.html"%>
<html>
<head>
<title>cloud_material_class明细</title>
<%@include file="/commons/include/getById.jsp"%>
<script type="text/javascript">
	//放置脚本
</script>
</head>
<body>
	<div class="panel">
		<div class="panel-top">
			<div class="tbar-title">
				<span class="tbar-label">cloud_material_class详细信息</span>
			</div>
			<div class="panel-toolbar">
				<div class="toolBar">
					<div class="group">
						<a class="link back" href="list.ht">返回</a>
					</div>
				</div>
			</div>
		</div>
		<div class="panel-body">
		<table class="table-detail" cellpadding="0" cellspacing="0" border="0">
			 
			<tr>
				<th width="20%">分类名称:</th>
				<td>${materialClass.name}</td>
			</tr>
 
			<tr>
				<th width="20%">上级分类:</th>
				<td>${materialClass.parentname}</td>
			</tr>
 
			<tr>
				<th width="20%">当前层级:</th>
				<td>${materialClass.levels}</td>
			</tr>
		</table>
		</div>
		
	</div>
</body>
</html>

