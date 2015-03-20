<%@page import="com.liferay.portal.kernel.bean.BeanParamUtil"%>
<%@page import="pl.mamzdanie.useraddon.svc.model.UserAddon"%>
<%@page import="javax.portlet.PortletURL"%><%@page
	contentType="text/html; charset=UTF-8"%>
<%@ include file="/html/portlet/ext/editaccount/init.jsp"%>
<div class="portlet_title">Edycja konta</div>
<br />
<br />

<portlet:actionURL windowState="<%= WindowState.NORMAL.toString() %>"
	var="editAccountActionUrl">
	<portlet:param name="struts_action" value="/p/edit_account/view" />
</portlet:actionURL>

<portlet:actionURL windowState="<%= WindowState.NORMAL.toString() %>"
	var="deleteAccountActionUrl">
	<portlet:param name="struts_action" value="/p/delete_account/view" />
</portlet:actionURL>

<%
	UserAddon userAddon = (UserAddon) request.getAttribute("userAddon");
	boolean isUserAddonExist = userAddon != null;
	Boolean notify=null;
	String phone=null;
	String companyPosition=null;
	String description=null;
	
	if (isUserAddonExist) {
		notify=BeanParamUtil.getBoolean(userAddon, request, "notify");
		phone=BeanParamUtil.getString(userAddon, request, "phone");
		companyPosition=BeanParamUtil.getString(userAddon, request, "position");
		description=BeanParamUtil.getString(userAddon, request, "description");
	}
	
	String userName=BeanParamUtil.getString(user, request, "firstName");
	String lastName=BeanParamUtil.getString(user, request, "lastName");
	String emailAddress=BeanParamUtil.getString(user, request, "emailAddress");
%>
<form method="post" action="<portlet:actionURL><portlet:param name="struts_action" value="/p/edit_account/view" /></portlet:actionURL>">
<div id="ext_edit_view">
	<div id="left_col">
		<div class="rounded_box">
			<div class="top_left top_left_grey"></div>
			<div class="top_right top_right_grey"></div>
			<div class="inside_grey">
				<div class="inside_content">
					<div class="details_header details-margin">Dane ogólne:</div>
					<div class="dots_h"></div>
					<br/>
					<table>						
						<tr>
						<td style="width:105px" >Imię: </td><td>
						<div class="input_row">
							<div class="left"></div>
							<input type="text" name="firstName" class="middle" value="<%=userName%>" />
							<div class="right"></div>
						</div>
							</td>
						</tr>
						<tr>
						<td>Nazwisko: </td><td>
						<div class="input_row">
							<div class="left"></div>
							<input type="text" name="lastName" class="middle" value="<%=lastName%>" />
							<div class="right"></div>
						</div>
						</td>
						</tr>
						<tr>
						<td>Adres e-mail: </td><td><div class="input_row">
							<div class="left"></div>
							<input type="text" name="emailAddress" class="middle" value="<%=emailAddress%>" />
							<div class="right"></div>
						</div></td>
						</tr>
						<c:if test="<%=isUserAddonExist%>">
							<tr id="phone_row">
							<td>Telefon: </td><td><div class="input_row">
								<div class="left"></div>
								<input type="text" name="phone" class="middle" value="<%=phone%>" />
								<div class="right"></div>
							</div></td>
							</tr>
							<tr id="position_row">
							<td>Stanowisko w organizacji: </td><td><div class="input_row">
								<div class="left"></div>
								<input type="text" name="companyPosition" class="middle" value="<%=companyPosition%>" />
								<div class="right"></div>
							</div></td>
							</tr>
							<tr id="description_row">
							<td>Krótki opis: </td><td><div class="input_row">
								<div class="left"></div>
								<input type="text" name="description" class="middle" value="<%=description%>" />
								<div class="right"></div>
							</div></td>
							</tr>
						</c:if>
						<tr id="buttons_row">
						<td colspan="2">
								<br/>
								<div>
									<div class="left"></div>
									<input type="submit" value="Zapisz" class="middle"/>
									<div class="right"></div>
								</div>
							</td>
						</tr>
					</table>
					<br />
					<c:if test="<%=isUserAddonExist%>">
						<div class="details_header details-margin">Pozostałe:</div>
						<div class="dots_h"></div>
						<br/>
						<table>
							<tr id="notify_row">
							<td>Chcę otrzymywać notyfikację mailową w przypadku pojawienia się nowej konsultacji:&nbsp;</td>
							<td><div>
								<div class="left"></div>
								<input type="checkbox" name="notify" <%= notify?"checked":""%>/>
								<div class="right"></div>
							</div></td>
							</tr>
							<tr id="authorizationApiKey_row">
							<td colspan="2">
								<table>
									<tr>
										<td>Twój kod autoryzacyjny API:&nbsp;</td>
										<td><div>
											<div class="left"></div>
											<input type="text" value="<%=userAddon.getApiKey()%>" readonly="readonly" size="39" class="midlle"/>
											<div class="right"></div>
										</div></td>
									</tr>
								</table>
							</td>
							</tr>							
						</table>
						<p class="nobottomgap"></p>
					</c:if>
				</div>
				<div class="clear"></div>
			</div>
			<div class="bottom_left bottom_left_grey"></div>
			<div class="bottom_right bottom_right_grey"></div>
		</div>
	</div>
	<br />
	<br />
	<div>	
		<label for="deleteAccount"></label>
		<a href="#" onclick="javascript:showDeleteView();">Usuń moje konto</a>
		<br />
	</div>
</div>

<div id="ext_delete_view" style="display: none;">
	<div id="left_col">
		<div class="rounded_box">
			<div class="top_left top_left_grey"></div>
			<div class="top_right top_right_grey"></div>
			<div class="inside_grey">
				<div class="inside_content">
					<div class="details_header details-margin">Usuwanie konta:</div>
					<div class="dots_h"></div>
					<br/>
					<table>
						<tr>
							<td colspan="2">
								<p>Operacja usunięcia konta jest nieodwracalna.</p>
								<p>Jeżeli nadal chcesz usunąć swoje konto, wpisz w polu tekstowym słowo 'TAK':</p>
							</td>
						</tr>
						<tr>
						<td colspan="2">
						<div class="input_row">
							<div class="left"></div>
							<input type="text" name="deleteAccountAnswer" class="middle" value="" />
							<div class="right"></div>
						</div>
						</td>
						</tr>
						<tr>
							<td colspan="2">
								<br/>
								<input type="button" value="Anuluj" onclick="javascript:showEditView();"/>
								<input type="submit" value="Usuń konto" />
							</td>
						</tr>
					</table>
					<p class="nobottomgap"></p>
				</div>
				<div class="clear"></div>
			</div>
			<div class="bottom_left bottom_left_grey"></div>
			<div class="bottom_right bottom_right_grey"></div>
		</div>
	</div>
</div>
<br />

</form>


<script type="text/javascript">
function showEditView() {
	var editView = document.getElementById('ext_edit_view');
	var deleteView = document.getElementById('ext_delete_view');
	
	editView.style.display = "block";
	deleteView.style.display = "none";
}

function showDeleteView() {
	var editView = document.getElementById('ext_edit_view');
	var deleteView = document.getElementById('ext_delete_view');
	
	deleteView.style.display = "block";
	editView.style.display = "none";
}
</script>
