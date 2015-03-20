<%@page import="javax.portlet.PortletURL"%><%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="/html/portlet/ext/last_closed/init.jsp"%>
<%
String type=MZConstants.last;
boolean withIterator=true;
%>
<%@ include file="/html/portlet/ext/commongrid/grid.jsp" %>