<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/commons/include/html_doctype.html" %>
<html>
<head>
	<title>系统角色表管理</title>
	<%@include file="/commons/include/get.jsp" %>
	<%@ taglib prefix="hotent" uri="http://www.jee-soft.cn/paging" %>

	<script type="text/javascript" src="${ctx}/js/hotent/platform/system/CopyRoleDialog.js"></script>
    <script type="text/javascript">
	    function copyRole(roleId,roleName){
	    	CopyRoleDialog({roleId:roleId});
	    }
	    
		function editRoleRes(roleId){
	        var url=__ctx+"/platform/system/roleResources/edit.ht?roleId="+roleId;
	    	var winArgs="dialogWidth=350px;dialogHeight=460px;status=0;help=0;";
	    	url=url.getNewUrl();
	    	window.open(url,"",winArgs);
	    }
    </script>
</head>
<body>
			<div class="panel">
				<div class="panel-top">
					<div class="tbar-title">
						<span class="tbar-label">系统角色管理列表</span>
					</div>
					<div class="panel-toolbar">
						<div class="toolBar">
							<div class="group"><f:a alias="searchRole" css="link search" id="btnSearch" >查询</f:a></div>
							<div class="l-bar-separator"></div>
							<div class="group">
								<f:a alias="addRole" css="link add" href="edit.ht">添加</f:a>
							</div>
							<div class="l-bar-separator"></div>
							<div class="group">
								<f:a alias="delRole" css="link del" action="del.ht">删除</f:a>
							</div>
						</div>	
					</div>
					<div class="panel-search">
							<form id="searchForm" method="post" action="list.ht">
									<div class="row">
										<span class="label">角色名:</span><input type="text" name="Q_roleName_SL"  class="inputText" value="${param['Q_roleName_SL']}"/>
										<span class="label">子系统名称:</span><input type="text" name="Q_sysName_SL"  class="inputText" value="${param['Q_sysName_SL']}"/>
										<span class="label">允许删除:</span>
										<select name="Q_allowDel_SN" class="select" style="width:8%;">
											<option value="">--全部--</option>
											<option value="1">允许</option>
											<option value="0">不允许</option>
										</select>
										<span class="label">允许编辑:</span>
										<select name="Q_allowEdit_SN" class="select" style="width:8%;">
											<option value="">--全部--</option>
											<option value="1">允许</option>
											<option value="0">不允许</option>
										</select>
										<span class="label">是否启用:</span>
										<select name="Q_enabled_SN" class="select" style="width:8%;">
											<option value="">--全部--</option>
											<option value="1">是</option>
											<option value="0">否</option>
										</select>
									</div>
							</form>
					</div>
				</div>
				<div class="panel-body">
					
				
				    	<c:set var="checkAll">
							<input type="checkbox" id="chkall"/>
						</c:set>
					    <display:table name="sysRoleList" id="sysRoleItem" requestURI="list.ht" sort="external" cellpadding="1" cellspacing="1" export="false"  class="table-grid">
							<display:column title="${checkAll}" media="html" style="width:30px;">
							<c:if test="${sysRoleItem.allowDel==0}"><input type="checkbox" class="disabled" name="roleId" id="roleId" value="${sysRoleItem.roleId}" disabled="disabled"></c:if>
							<c:if test="${sysRoleItem.allowDel==1}"><input type="checkbox" class="pk" name="roleId" id="roleId" value="${sysRoleItem.roleId}"></c:if>
							</display:column>
							<display:column property="roleName" title="角色名" style="text-align:left" sortable="true" sortName="roleName"></display:column>
							<display:column property="subSystem.sysName" title="子系统名称" style="text-align:left">
							</display:column>
							<display:column property="memo" title="备注" style="text-align:left"></display:column>
 			                <display:column title="允许删除">
							<c:choose>
								<c:when test="${sysRoleItem.allowDel eq 0}"><span class="red">不允许</span></c:when>
								<c:when test="${sysRoleItem.allowDel eq 1}"><span class="green">允许</font></c:when>
								<c:otherwise>未设定</c:otherwise>
							</c:choose>
							</display:column>
							<display:column  title="允许编辑">
							<c:choose>
								<c:when test="${sysRoleItem.allowEdit eq 0}"><span class="red">不允许</span></c:when>
								<c:when test="${sysRoleItem.allowEdit eq 1}"><span class="green">允许</font></c:when>
								<c:otherwise>未设定</c:otherwise>
							</c:choose>
							</display:column>
							<display:column title="状态" >
							<c:choose>
							    <c:when test="${sysRoleItem.enabled eq 0}"><span class="red">禁用</span></c:when>
								<c:when test="${sysRoleItem.enabled eq 1}"><span class="green">启用</span></c:when>
								<c:otherwise><span class="red">未设定</span></c:otherwise>
							</c:choose>
							</display:column>
							<display:column title="管理" media="html" style="text-align:center">
								<c:choose>
									<c:when test="${sysRoleItem.allowDel==0}">
										<a href="#" class="link del disabled" >删除</a>
									</c:when>
									<c:otherwise>
										<f:a alias="delRole" css="link del" href="del.ht?roleId=${sysRoleItem.roleId}">删除</f:a>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${sysRoleItem.allowEdit==0}">
										<a href="#" class="link edit disabled" >编辑</a>
									</c:when>
									<c:otherwise>
										<f:a alias="updRole" css="link edit" href="edit.ht?roleId=${sysRoleItem.roleId}">编辑</f:a>
									</c:otherwise>
								</c:choose>
								<f:a alias="roleDetail" css="link detail" href="get.ht?roleId=${sysRoleItem.roleId}">明细</f:a>
								<f:a alias="copyRole" css="link copy" onclick="copyRole('${sysRoleItem.roleId}','${sysRoleItem.roleName}')" >复制角色</f:a>
								<button onclick="editRoleRes(${sysRoleItem.roleId });">资源分配</button>
								<f:a alias="userRole" css="link auth" href="${ctx}/platform/system/userRole/edit.ht?roleId=${sysRoleItem.roleId}" >人员分配</f:a>
								
								<f:a alias="stopRole" css="link lock" href="runEnable.ht?roleId=${sysRoleItem.roleId }" >
									<c:choose>
									    <c:when test="${sysRoleItem.enabled eq 1}">禁用</c:when>
										<c:when test="${sysRoleItem.enabled eq 0}">启用</c:when>
								    </c:choose>
								</f:a>
								
							</display:column>
						</display:table>
						<hotent:paging tableId="sysRoleItem"/>
					
				</div> 			
			</div> 
</body>
</html>


