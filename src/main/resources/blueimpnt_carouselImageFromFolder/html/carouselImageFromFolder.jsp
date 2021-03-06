<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<c:set value="${currentNode.properties.source.node}" var="sourceFolder"/>

<c:choose>
    <c:when test="${currentNode.properties.allowSubDirectories.boolean}">
        <c:set value="${jcr:getDescendantNodes(sourceFolder, 'jmix:image')}" var="sourceChild"/>
    </c:when>
    <c:otherwise>
        <c:set value="${jcr:getChildrenOfType(sourceFolder, 'jmix:image')}" var="sourceChild"/>
    </c:otherwise>
</c:choose>

<c:forEach items="${sourceChild}" var="imageChild">
    <a href="<c:url value='${imageChild.url}' context='/'/>" title="${imageChild.displayableName}" data-gallery>
        <c:if test="${fn:length(imageChild.thumbnails) ne 0}">
            <img src="<c:url value='${imageChild.thumbnailUrls.thumbnail}' context='/'/>" alt="${imageChild.displayableName}">
        </c:if>
    </a>
</c:forEach>