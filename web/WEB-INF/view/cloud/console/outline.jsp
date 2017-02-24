<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="/commons/cloud/global.jsp" %>

    <c:forEach items="${leftResourcesList}" var="leftResourcesItem">
        <ul class="list-group">
            <li class="list-group-item">
                <c:choose>
                <c:when test="${fn:contains(leftResourcesItem.defaultUrl,'http')||fn:contains(leftResourcesItem.defaultUrl,'cosim')}">
                <a href="javascript:openFrame('${leftResourcesItem.defaultUrl}');">${leftResourcesItem.resName}</a>
                </c:when>
                <c:otherwise>
                <a href="javascript:openFrame('${ctx}${leftResourcesItem.defaultUrl}');">${leftResourcesItem.resName}</a>
                </c:otherwise>
                </c:choose>
                <c:forEach items="${leftResourcesItem.children}" var="child">
            <li class="list-group-item">
                <c:choose>
                    <c:when test="${fn:contains(child.defaultUrl,'http')||fn:contains(child.defaultUrl,'cosim')}">
                        <a href="javascript:openFrame('${child.defaultUrl}');">${child.resName}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:openFrame('${ctx}${child.defaultUrl}');">${child.resName}</a>
                    </c:otherwise>
                </c:choose>
            </li>
            </c:forEach>
            </li>
        </ul>
    </c:forEach>