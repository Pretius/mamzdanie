<%@page import="javax.portlet.PortletURL"%><%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="/html/portlet/ext/pending/init.jsp"%>
<%
String type=MZConstants.pending;
boolean withIterator=true;
%>
<%@ include file="/html/portlet/ext/commongrid/grid.jsp" %>