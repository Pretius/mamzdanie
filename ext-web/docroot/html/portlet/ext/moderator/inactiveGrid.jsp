<%@page import="pl.mamzdanie.mbmessageaddon.svc.NoSuchMBMessageAddonException"%>
<%@page import="pl.mamzdanie.MZConstants"%>
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
	PortletURL portletURL;
	SearchContainer searchContainer;
	
	DetachedCriteria messageAddonCriteria;
	DynamicQuery messageAddonDynamicQuery;
	int messageAddonsTotal;
	List<MBMessageAddon> messageAddons;
	
	String currentUrl = PortalUtil.getCurrentURL(request);

	String moderatorPortletView = (String) request.getAttribute("moderatorPortletView");
	boolean isModeratorPortletView = moderatorPortletView != null && moderatorPortletView.equals("true");
	
	SimpleDateFormat format = new SimpleDateFormat("dd MMMM yyyy");
	
	portletURL = renderResponse.createRenderURL();

	searchContainer = new SearchContainer(
			renderRequest,
			null,
			null,
			SearchContainer.DEFAULT_CUR_PARAM,
			10,
			portletURL,
			null,
			null
	);
	
	messageAddonCriteria = DetachedCriteria.forClass(MBMessageAddon.class);
	
	if (!CommonUtils.isTechnicalAdmin(user)) {
		messageAddonCriteria.add(Restrictions.eq("issuerId", user.getUserId()));
	}
	
	messageAddonCriteria.add(Restrictions.eq("status", MBMessageStatusType.APPROVED_MESSAGE.name()));
	messageAddonCriteria.add(Restrictions.eq("active", false));
	
	messageAddonDynamicQuery = new DynamicQueryImpl(messageAddonCriteria);		
	messageAddons = new LinkedList(MBMessageAddonLocalServiceUtil.dynamicQuery(messageAddonDynamicQuery));
	messageAddonsTotal = messageAddons.size();
%>

<div class="dots_big_h big_h_subpage_margin"></div>
<div class="moderator_grid"></div>

<div>
	<h1 style="color: #AE4A4A;"><liferay-ui:message key="moderator.view.grid.inactive.title" /></h1>
</div>

<%
if (messageAddons != null && messageAddons.size() > 0) {
%>

<c:if test="<%=!isModeratorPortletView%>">
	<a class="see_more_link" href="<%=CommonUtils.manageUrl(currentUrl, "/moderator")%>">Zobacz wszystkie</a>
</c:if>

<div class="common_container">
<div class="red_header">Wszystkie wiadomości dla moderatora: <%=messageAddonsTotal%></div>
<table class="common_table">
	<tr class="header">
		<td>Autor</td>
		<td style="width: 380px;">Treść</td>
		<td>Data utwerzenia</td>
		<td style="min-width: 95px;">Licencja</td>
		<td>Akcje</td>
	</tr>
	<tbody>
<%
	for (MBMessageAddon messageAddon : messageAddons) {
		MBMessage message = MBMessageLocalServiceUtil.getMBMessage(messageAddon.getMessageId());
		MBMessageAddon threadMbMessageAddon;
		
		boolean isActive = messageAddon.getActive() != null && messageAddon.getActive().booleanValue();
		boolean isVisible = messageAddon.getVisible() != null && messageAddon.getVisible().booleanValue();
		
		boolean isCreativeCommonsLicense = false;
		boolean isQuoteLicense = false;
		
		String messageSubject;
		String messageBody;
		
		try {
			threadMbMessageAddon = MBMessageAddonLocalServiceUtil.getMBMessageAddon(message.getMessageId());
		} catch (NoSuchMBMessageAddonException e) {
			throw new IllegalStateException("Message not found.", e);
		}
		
		isCreativeCommonsLicense = threadMbMessageAddon.getLicenseType().equalsIgnoreCase("CREATIVE_COMMONS_LICENSE");
		isQuoteLicense = threadMbMessageAddon.getLicenseType().equalsIgnoreCase("QUOTE_LICENSE");
		
		if (message.getSubject().length() > 40) {
			messageSubject = message.getSubject().substring(0, 40) + "&hellip;";
		} else {
			messageSubject = message.getSubject();
		}
		
		if (message.getBody().length() > 200) {
			messageBody = message.getBody().substring(0, 200) + "&hellip;";
		} else {
			messageBody = message.getBody();
		}
		
		messageBody = "Konsultacja: <strong>" + messageSubject + "</strong><br/>" + messageBody;
				
		String showMessageUrl = "/web/guest/moderator" +
				"?p_p_id=moderator" + "&" +
				"p_p_lifecycle=0" + "&" +
				"p_p_state=normal" + "&" +
				"p_p_mode=view" + "&" +
				"p_p_col_id=column-1" + "&" +
				"p_p_col_count=1" + "&" +
				"_moderator_struts_action=%2Fp%2Fmoderator%2Fview&_moderator_cmd=view" + "&" +
				"_moderator_redirect=" + (isModeratorPortletView ? "/web/guest/moderator" : "/web/guest") + "&" +
				"_moderator_messageId=" + String.valueOf(message.getMessageId());
		
		String activeMessageUrl = "/web/guest/moderator?" +
				"p_p_id=moderator" + "&" +
				"p_p_lifecycle=0" + "&" +
				"p_p_state=normal" + "&" +
				"p_p_mode=view" + "&" +
				"p_p_col_id=column-1" + "&" +
				"p_p_col_count=1" + "&" +
				"_moderator_struts_action=/p/moderator/view" + "&" +
				"_moderator_cmd=active" + "&" +
				"_moderator_redirect=" + (isModeratorPortletView ? "/web/guest/moderator" : "/web/guest") + "&" +
				"_moderator_messageId=" + String.valueOf(message.getMessageId());
%>
	<tr>
		<td><%=message.getUserName()%></td>
		<td>
			<%=messageBody%>
			<c:if test="<%=message.getBody().length() > 200%>">
				<a href="<%=showMessageUrl %>">
					<liferay-ui:message key="common.action.more"/>&nbsp;
				</a>				
			</c:if>
		</td>
		<td><%=format.format(message.getCreateDate())%></td>
		<td>
			<c:choose>
				<c:when test="<%= isCreativeCommonsLicense %>">
					<a class="licenseLink" href="http://creativecommons.org/licenses/by-sa/3.0/" title="Creative Commons Attribution 3.0 License">				
						<div class="grid_creativeCommonsLicense"></div>
					</a>
				</c:when>
				<c:when test="<%= isQuoteLicense %>">
					<a class="licenseLink" href="#<portlet:namespace />message_<%=message.getMessageId()%>" title="Licencja zezwalająca Emitentowi na wykorzystanie wypowiedzi (cytowanie z przytoczeniem autorstwa)">
						<div class="grid_quoteLicense"></div>
					</a>
				</c:when>
			</c:choose>
		</td>		
		<td>
			<a href="<%=showMessageUrl %>">
				<liferay-ui:message key="moderator.action.viewMessage"/>&nbsp;
			</a>
			<a href="<%=activeMessageUrl%>">
				<liferay-ui:message key="moderator.action.active"/>
			</a>
		</td>
	</tr>
<%
	}
%>
	</tbody>
</table>
</div>
<%
} /* end of: if (messageAddons != null && messageAddons.size() > 0) */
else {
%>
	<div class="emptyList">
		<span><liferay-ui:message key="moderator.list.empty"/></span>
	</div>
<%
}
%>

<%
} /* end of: section */
%>