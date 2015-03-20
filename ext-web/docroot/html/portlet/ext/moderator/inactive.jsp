<%@page import="com.liferay.portal.security.auth.PrincipalException"%>
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
	
	String cmd = (String) request.getAttribute("cmd");
	
	if (cmd == null || (!cmd.equals("commentAndReject") && !cmd.equals("commentAndInactive"))) {
		throw new PrincipalException();
	}
	
	String submitCmd = cmd.equals("commentAndReject") ? "reject" : "inactive";
	
	MBMessageAddon messageAddon = (MBMessageAddon) request.getAttribute("mbMessageAddon");
	MBMessage message = null;
	
	String prevUrl = (String) request.getAttribute("prevUrl");
	
	if (messageAddon != null) {
		message = MBMessageLocalServiceUtil.getMBMessage(messageAddon.getMessageId());
	}
	
	String threadDetailsURL = "/web/guest/konsultacje/-/message_boards/message/";
%>

<div class="dots_big_h big_h_subpage_margin"></div>
<div class="moderator_grid"></div>

<div><h1 style="color: #AE4A4A;"><liferay-ui:message key="moderator.view.inactive.title"/></h1></div>

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
	<form
	id="inactiveForm"
	action="<portlet:actionURL><portlet:param name="struts_action" value="/p/moderator/view" /><portlet:param name="redirect" value="<%=threadDetailsURL + message.getParentMessageId()%>"/><portlet:param name="<%= Constants.CMD %>" value="<%=submitCmd%>" /><portlet:param name="messageId" value="<%= String.valueOf(message.getMessageId()) %>" /></portlet:actionURL>"
	enctype="multipart/form-data" method="post">
		<div class="rejectOrInactive_textarea_message">
			<liferay-ui:message key="moderator.view.inactive.message.info"/>&nbsp;<%=message.getUserName()%>
		</div>
		
		<textarea class="rejectOrInactive_textarea" id="_moderator_body" name="_moderator_body" wrap="soft" onkeydown="Liferay.Util.disableEsc();" onkeypress="Liferay.Util.checkMaxLength(this, 4000);"></textarea>		
		
		<div class="messages_box message_actions">
			<div class="big_button menu_button green">
				<div class="left"></div>
				<div class="middle">
					<a href="#"
						onclick="rejectMessage(); return false;">
						<liferay-ui:message key="moderator.action.inactive"/>
					</a>
				</div>
				<div class="right"></div>
			</div>
			<div class="big_button menu_button grey cancel_button">
				<div class="left"></div>
				<div class="middle">
					<a href="<%=portletURL%>">Anuluj</a>
				</div>
				<div class="right"></div>
			</div>
		</div>
	</form>
</div>
<%
} /* end of: if (messageAddon != null && message != null) */
%>

<%
} /* end of: section */
%>

<script type="text/javascript">
	function rejectMessage() {
		document.getElementById("inactiveForm").submit();
	}
</script>