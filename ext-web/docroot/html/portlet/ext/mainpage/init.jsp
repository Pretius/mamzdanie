<%@ include file="/html/common/init.jsp"%>
<%@page import="pl.mamzdanie.MZConstants"%>

<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="java.net.URLEncoder"%>

<portlet:defineObjects />

<%
	String currentURL = PortalUtil.getCurrentURL(request);
%>