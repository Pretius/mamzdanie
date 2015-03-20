<%@page import="javax.portlet.PortletURL"%><%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="/html/portlet/ext/moderator/init.jsp"%>

<c:if test="<%=CommonUtils.isEmiter(user) || CommonUtils.isTechnicalAdmin(user)%>">
	<%@ include file="/html/portlet/ext/moderator/rejectGrid.jsp" %>
	<%@ include file="/html/portlet/ext/moderator/inactiveGrid.jsp" %>
</c:if>