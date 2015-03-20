<%@page import="javax.portlet.WindowState"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="pl.mamzdanie.CommonUtils"%>
<%@page import="com.liferay.portal.kernel.util.Constants"%>
<%@page import="com.liferay.portlet.messageboards.service.MBMessageLocalServiceUtil"%>
<%@page import="com.liferay.portlet.messageboards.model.MBMessage"%>
<%@page import="java.util.LinkedList"%>
<%@page import="pl.mamzdanie.mbmessageaddon.svc.MBMessageStatusType"%>
<%@page import="pl.mamzdanie.mbmessageaddon.svc.service.MBMessageAddonLocalServiceUtil"%>
<%@page import="pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon"%>
<%@page import="com.liferay.portal.dao.orm.hibernate.DynamicQueryImpl"%>
<%@page import="org.hibernate.criterion.DetachedCriteria"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="com.liferay.portal.kernel.dao.orm.DynamicQuery"%>
<%@page import="java.util.List"%>
<%@page import="javax.portlet.PortletURL"%>
<%@page import="com.liferay.portal.kernel.dao.search.SearchContainer"%>
<%@page contentType="text/html; charset=UTF-8"%>

<%
{ /* start of: section */
%>

<%
	PortletURL portletURL = renderResponse.createRenderURL();
	String currentUrl = PortalUtil.getCurrentURL(request);
	MBMessageAddon messageAddon = (MBMessageAddon) request.getAttribute("mbMessageAddon");
	MBMessage message = null;
	
	String prevUrl = (String) request.getAttribute("prevUrl");
	
	boolean isCreativeCommonsLicense = false;
	boolean isQuoteLicense = false;
	
	if (messageAddon != null) {
		message = MBMessageLocalServiceUtil.getMBMessage(messageAddon.getMessageId());
		
		isCreativeCommonsLicense = messageAddon.getLicenseType().equalsIgnoreCase("CREATIVE_COMMONS_LICENSE");
		isQuoteLicense = messageAddon.getLicenseType().equalsIgnoreCase("QUOTE_LICENSE");
	}
%>

<div class="dots_big_h big_h_subpage_margin"></div>
<div class="moderator_grid"></div>

<div><h1 style="color: #AE4A4A;"><liferay-ui:message key="moderator.view.grid.message.title"/></h1></div>

<%
if (messageAddon != null && message != null) {
%>
<div class="moderatorMessageViewActions">
	<div class="moderatorMessageViewAction">
		<c:choose>
			<c:when test="<%=prevUrl != null%>">
				<a href="<%=prevUrl%>">Powrót</a>
			</c:when>
			<c:otherwise>
				<a href="<%=portletURL%>">Powrót</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<div class="common_container">
	<div class="red_header">Tytuł: <%=message.getSubject()%></div>
		<div class="moderatorMessageBody">
			<span><%=message.getBody()%></span>
		</div>
		<c:choose>
			<c:when test="<%= isCreativeCommonsLicense %>">
				<a class="licenseLink" href="http://creativecommons.org/licenses/by-sa/3.0/" title="Creative Commons Attribution 3.0 License">				
					<div class="creativeCommonsLicense">&nbsp;</div>
				</a>
			</c:when>
			<c:when test="<%= isQuoteLicense %>">
				<a class="licenseLink" href="#<portlet:namespace />message_<%=message.getMessageId()%>" title="Licencja zezwalająca Emitentowi na wykorzystanie wypowiedzi (cytowanie z przytoczeniem autorstwa)">
					<div class="quoteLicense">&nbsp;</div>
				</a>
			</c:when>
			<c:otherwise>
				&nbsp;
			</c:otherwise> 
		</c:choose>
</div>
<%
} /* end of: if (messageAddon != null && message != null) */
%>

<%
} /* end of: section */
%>