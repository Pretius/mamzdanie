<%@page import="pl.mamzdanie.useraddon.svc.NoSuchUserAddonException"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.liferay.portlet.PortletRequestImpl"%>
<%@page import="javax.portlet.ProcessAction"%>
<%@page import="javax.portlet.PortletRequest"%>
<%@page import="com.liferay.portal.struts.Action"%>
<%@page import="pl.mamzdanie.useraddon.svc.model.UserAddon"%>
<%@page
	import="pl.mamzdanie.useraddon.svc.service.UserAddonLocalServiceUtil"%>
<%@page
	import="pl.mamzdanie.userorganization.svc.model.UserOrganization"%>
<%@page
	import="pl.mamzdanie.userorganization.svc.service.UserOrganizationLocalServiceUtil"%>
<%@ include file="/html/portlet/ext/userdetails/init.jsp"%>
<%
	if (request.getUserPrincipal() != null) {
%>
<%
	int userId;
		try {
			userId = Integer.parseInt(request.getParameter("user_id"));
		} catch (NumberFormatException e) {
			userId = -1;
		}

		User userDet = null;
		UserAddon userAddon = null;
		UserOrganization userOrganization = null;
		boolean isUserAddonExist = false;
		
		if (userId != -1) {
			userDet = UserLocalServiceUtil.getUser(userId);
			try {
				userAddon = UserAddonLocalServiceUtil.getUserDetails(userId);
			} catch (NoSuchUserAddonException e) {
				isUserAddonExist = false;
			}
			if (userAddon != null) {
				isUserAddonExist = true;
				userOrganization = UserOrganizationLocalServiceUtil.getUserOrganization(userAddon.getOrganizationId());
			}
			isUserAddonExist = userAddon != null;
		}
%>

<%
	if (user != null) {
%>
<style>

table.paddings td{
	padding:0px 8px 0px 0;
}

</style>

<table style="width:700px" class="paddings">
	<tr>
		<td><b>Dane użytkownika</b></td>
		<%
			if (isUserAddonExist) {
		%><td style="padding-left:25px"><b>Dane organizacji</b></td>
		<%
			}
		%>
	</tr>
	<tr>
		<td style="vertical-align:top"><table>
				<tr>
					<td style="width:150px">Imię i nazwisko:</td>
					<td><%=userDet.getFullName()%></td>
				</tr>
				<%
					if (isUserAddonExist) {
				%><tr>
					<td>Stanowisko w organizacji:</td>
					<td><%=userAddon.getPosition()%></td>
				</tr>
				<%
					}
				%>
			</table></td>
		<%
			if (isUserAddonExist) {
		%>
		<td style="padding-left:25px">
			<table>
				<tr>
					<td style="width:150px">Nazwa:</td>
					<td style="width:150px"><%=userOrganization.getName()%></td>
				</tr>
				<tr>
					<td>Adres:</td>
					<td><%=userOrganization.getAddress()%></td>
				</tr>
				<tr>
					<td>Kod pocztowy:</td>
					<td><%=userOrganization.getPostalCode()%></td>
				</tr>
				<tr>
					<td>Miasto:</td>
					<td><%=userOrganization.getCity()%></td>
				</tr>
				<tr>
					<td>Telefon:</td>
					<td><%=userOrganization.getPhone()%></td>
				</tr>
			</table>
		</td>
		<%
			}
		%>
	</tr>
</table>
<%
	}
%>

<%
	if (userDet == null) {
%>
<span class="portlet-msg-error">Użytkownik niedostępny.</span>
<%
	}
%>

<%
	} else {
%>
<span class="portlet-msg-error">Musisz być zalogowany.</span>
<%
	}
%>