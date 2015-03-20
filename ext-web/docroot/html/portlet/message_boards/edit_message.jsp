
<%@page import="com.liferay.portal.kernel.language.LanguageUtil"%>
<%@page import="com.liferay.portlet.messageboards.TooLongSubjectFieldValueException"%>
<%@page import="pl.mamzdanie.useraddon.svc.NoSuchUserAddonException"%>
<%@page import="pl.mamzdanie.useraddon.svc.service.UserAddonLocalServiceUtil"%>
<%@page import="pl.mamzdanie.threaddetail.svc.model.ThreadDetail"%>
<%@page
	import="pl.mamzdanie.threaddetail.svc.service.ThreadDetailLocalServiceUtil"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%
	/**
	 * Copyright (c) 2000-2009 Liferay, Inc. All rights reserved.
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining a copy
	 * of this software and associated documentation files (the "Software"), to deal
	 * in the Software without restriction, including without limitation the rights
	 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	 * copies of the Software, and to permit persons to whom the Software is
	 * furnished to do so, subject to the following conditions:
	 *
	 * The above copyright notice and this permission notice shall be included in
	 * all copies or substantial portions of the Software.
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	 * SOFTWARE.
	 */
%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="/html/portlet/message_boards/init.jsp"%>

<%
	String redirect = ParamUtil.getString(request, "redirect");

	MBMessage message = (MBMessage) request
			.getAttribute(WebKeys.MESSAGE_BOARDS_MESSAGE);

	long parentMessageId = BeanParamUtil.getLong(message, request,
			"parentMessageId", MBMessageImpl.DEFAULT_PARENT_MESSAGE_ID);

	MBAddon messageAddon = null;
	
	if (message != null) {
		messageAddon = MBAddonLocalServiceUtil.getMBAddon(message
				.getThreadId());
	}
	
	String signature = BeanParamUtil.getString(messageAddon, request,
			"signature");
	String discussionArea = BeanParamUtil.getString(messageAddon,
			request, "discussionArea");
	String territory = BeanParamUtil.getString(messageAddon, request,
			"territory");
	Boolean accepted = BeanParamUtil.getBoolean(messageAddon, request,
			"accepted");

	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	SimpleDateFormat hhmmf = new SimpleDateFormat("HH:mm");

	String dateFrom = ParamUtil.getString(request, "dateFrom");
	if (dateFrom.equals("") && messageAddon != null)
		dateFrom = sdf.format(messageAddon.getDateFrom());

	String dateTo = ParamUtil.getString(request, "dateTo");
	if (dateTo.equals("") && messageAddon != null)
		dateTo = sdf.format(messageAddon.getDateTo());

	String dateToHHmm = ParamUtil.getString(request, "dateToHHmm");
	if (dateToHHmm.equals("")) {
		dateToHHmm = "00:00";
		if (messageAddon != null)
			dateToHHmm = hhmmf.format(messageAddon.getDateTo());
	}

	long messageId = BeanParamUtil.getLong(message, request,
			"messageId");
	long categoryId = BeanParamUtil.getLong(message, request,
			"categoryId");
	long threadId = BeanParamUtil.getLong(message, request, "threadId");

	String subject = BeanParamUtil.getString(message, request,
			"subject");

	MBThread thread = null;
	ThreadDetail threadDetail = null;
	
	MBMessage curParentMessage = null;
	String parentAuthor = null;

	if (threadId > 0) {
		try {
			curParentMessage = MBMessageLocalServiceUtil
					.getMessage(parentMessageId);

			if (Validator.isNull(subject)) {
				subject = curParentMessage.getSubject();
			}

			parentAuthor = curParentMessage.isAnonymous()
					? LanguageUtil.get(pageContext, "anonymous")
					: PortalUtil.getUserName(
							curParentMessage.getUserId(),
							curParentMessage.getUserName());
			
			threadDetail = ThreadDetailLocalServiceUtil.getThreadDetail(curParentMessage.getMessageId());
		} catch (Exception e) {
		}
	}

	String body = BeanParamUtil.getString(message, request, "body");
	boolean attachments = BeanParamUtil.getBoolean(message, request,
			"attachments");
	boolean preview = ParamUtil.getBoolean(request, "preview");
	boolean quote = ParamUtil.getBoolean(request, "quote");

	String[] existingAttachments = new String[0];

	if ((message != null) && message.isAttachments()) {
		existingAttachments = DLServiceUtil.getFileNames(
				message.getCompanyId(), CompanyConstants.SYSTEM,
				message.getAttachmentsDir());
		if (messageAddon != null)
			CommonUtils.swapFileNames(existingAttachments,
					messageAddon.getMainAttachment());
	}
	
	boolean isUserAddon;	
	try {
		UserAddonLocalServiceUtil.getUserAddon(user.getUserId());
		isUserAddon = true;
	} catch (NoSuchUserAddonException e) {
		isUserAddon = false;
	}
%>


<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@page import="com.liferay.portal.security.auth.PrincipalException"%><script
	type="text/javascript">
jQuery(document).ready(function() {
	jQuery('#<portlet:namespace />dateFrom').datepicker({ 
		dateFormat: 'dd-mm-yy',
		dayNamesMin: ['Nd', 'Pn', 'Wt', '\u015ar', 'Cz', 'Pd', 'So'],
		currentText: 'Data od',
		monthNames: ['Stycze\u0144', 'Luty', 'Marzec', 'Kwiecie\u0144', 'Maj', 'Czerwiec', 
		 		'Lipiec', 'Sierpie\u0144', 'Wrzesie\u0144', 'Pa\u017adziernik', 'Listopad', 'Grudzie\u0144']
	});
	jQuery('#<portlet:namespace />dateTo').datepicker({ 
		dateFormat: 'dd-mm-yy',
		dayNamesMin: ['Nd', 'Pn', 'Wt', '\u015ar', 'Cz', 'Pd', 'So'],
		currentText: 'Data od',
		monthNames: ['Stycze\u0144', 'Luty', 'Marzec', 'Kwiecie\u0144', 'Maj', 'Czerwiec', 
		 		'Lipiec', 'Sierpie\u0144', 'Wrzesie\u0144', 'Pa\u017adziernik', 'Listopad', 'Grudzie\u0144']
	});
});

	function <portlet:namespace />getSuggestionsContent() {
		var content = '';

		content += document.<portlet:namespace />fm.<portlet:namespace />subject.value + ' ';
		content += <portlet:namespace />getHTML();

		return content;
	}

	function <portlet:namespace />saveMessage() {
		document.<portlet:namespace />fm.<portlet:namespace /><%=Constants.CMD%>.value = "<%=message == null ? Constants.ADD : Constants.UPDATE%>";
		document.<portlet:namespace />fm.<portlet:namespace />body.value = <portlet:namespace />getHTML();
		submitForm(document.<portlet:namespace />fm);
	}

	function <portlet:namespace />selectCategory(categoryId, categoryName) {
		document.<portlet:namespace />fm.<portlet:namespace />categoryId.value = categoryId;

		var nameEl = document.getElementById("<portlet:namespace />categoryName");

		nameEl.href = "<portlet:renderURL><portlet:param name="struts_action" value="/message_boards/view" /></portlet:renderURL>&<portlet:namespace />categoryId=" + categoryId;
		nameEl.innerHTML = categoryName + "&nbsp;";
	}
</script>

<%
	long breadcrumbsMessageId = parentMessageId;

	if (threadId <= 0) {
		breadcrumbsMessageId = messageId;
	}

	if (message != null) {
		breadcrumbsMessageId = message.getMessageId();
	}
%>

<div class="breadcrumbs"><%=BreadcrumbsUtil.removeLastClass(MBUtil.getBreadcrumbs(
					categoryId, breadcrumbsMessageId, pageContext,
					renderRequest, renderResponse))%>
	&raquo; <span class="last"><liferay-ui:message
			key='<%= ((message == null) ? Constants.ADD : Constants.UPDATE) + "-message" %>' /></span>
</div>

<c:if test="<%= curParentMessage != null %>">
	<%
		String parentBody = BBCodeUtil.getHTML(curParentMessage);
	%>

	<div class="dots_h dots_margin"></div>
	<span class="green_header"><liferay-ui:message key="message.consultation.subject"/></span>
	<br />
	<span class="consultation_header"><%=HtmlUtil.escape(curParentMessage.getSubject())%></span>
	<div class="dots_h dots_margin"></div>
	<span class="green_header"><liferay-ui:message key="message.consultation.target.edit"/></span>
	<br />
	<%=parentBody%>
</c:if>

<c:if test="<%= preview %>">
	<br />
	<br />
	<%
		MBMessage temp = null;

			if (message != null) {
				temp = message;

				message = new MBMessageImpl();

				message.setUserId(temp.getUserId());
				message.setUserName(temp.getUserName());
				message.setCreateDate(temp.getCreateDate());
				message.setModifiedDate(temp.getModifiedDate());
				message.setThreadId(temp.getThreadId());
				message.setSubject(subject);
				message.setBody(body);
				message.setAnonymous(temp.isAnonymous());

			} else {
				message = new MBMessageImpl();

				message.setUserId(user.getUserId());
				message.setUserName(user.getFullName());
				message.setCreateDate(new Date());
				message.setModifiedDate(new Date());
				message.setThreadId(threadId);
				message.setSubject(subject);
				message.setBody(body);
				message.setAnonymous(BeanParamUtil.getBoolean(message,
						request, "anonymous"));
			}

			boolean editable = false;

			MBCategory category = null;

			int depth = 0;

			String className = "portlet-section-body results-row";
			String classHoverName = "portlet-section-body-hover results-row hover";
	%>

	<%@ include
		file="/html/portlet/message_boards/view_thread_message.jspf"%>
	<%
		message = temp;
	%>

</c:if>
<div class="dots_big_h big_dots_margin"></div>
<%
	if (parentMessageId == 0) {
%>
<div class="adding_consultation"></div>
<%
	} else {
%>
<div class="adding_message"></div>
<%
	}
%>
<form
	action="<portlet:actionURL><portlet:param name="struts_action" value="/message_boards/edit_message" /></portlet:actionURL>"
	enctype="multipart/form-data" method="post"
	name="<portlet:namespace />fm"
	onSubmit="<portlet:namespace />saveMessage(); return false;">
	<input name="<portlet:namespace /><%=Constants.CMD%>" type="hidden"
		value="" /> <input name="<portlet:namespace />redirect" type="hidden"
		value="<%=HtmlUtil.escape(redirect)%>" /> <input
		name="<portlet:namespace />messageId" type="hidden"
		value="<%=messageId%>" /> <input
		name="<portlet:namespace />categoryId" type="hidden"
		value="<%=categoryId%>" /> <input
		name="<portlet:namespace />threadId" type="hidden"
		value="<%=threadId%>" /> <input
		name="<portlet:namespace />parentMessageId" type="hidden"
		value="<%=parentMessageId%>" /> <input
		name="<portlet:namespace />attachments" type="hidden"
		value="<%=attachments%>" /> <input
		name="<portlet:namespace />preview" type="hidden" value="" />	
	
	<liferay-ui:error exception="<%= TooLongDiscussionAreaFieldValueException.class %>" message="too-long-discussion-area-field-value" />
	<liferay-ui:error exception="<%= TooLongSignatureFieldValueException.class %>" message="too-long-signature-field-value" />
	<liferay-ui:error exception="<%= TooLongSubjectFieldValueException.class %>" message="too-long-subject-field-value" />
	<liferay-ui:error exception="<%= TooLongTerritoryFieldValueException.class %>" message="too-long-territory-field-value" />
	<liferay-ui:error exception="<%= TooShortDurationException.class %>" message="too-short-duration" />
	
	<liferay-ui:error exception="<%= EmptyFieldException.class %>"
		message="empty-field-message" />
	<liferay-ui:error exception="<%= CaptchaTextException.class %>"
		message="text-verification-failed" />
	<liferay-ui:error exception="<%= MessageBodyException.class %>"
		message="please-enter-a-valid-message" />
	<liferay-ui:error exception="<%= MessageSubjectException.class %>"
		message="please-enter-a-valid-subject" />
	<liferay-ui:error exception="<%= FileNameException.class %>">
		<liferay-ui:message
			key="document-names-must-end-with-one-of-the-following-extensions" /><%=StringUtil.merge(PrefsPropsUtil.getStringArray(
						PropsKeys.DL_FILE_EXTENSIONS, StringPool.COMMA),
						StringPool.COMMA_AND_SPACE)%>.
</liferay-ui:error>
	<liferay-ui:error exception="<%= FileSizeException.class %>"
		message="please-enter-a-file-with-a-valid-file-size" />
	<liferay-ui:tags-error />


	<%
		if (parentMessageId == 0) {
	%>

	<%
		if (CommonUtils.isTechnicalAdmin(user)) {
	%>
	<div class="details_header_row">
		<div class="dots_h"></div>
		<div class="details_header details-margin">
			<liferay-ui:message key="message.consultation.active"/>
		</div>
	</div>
	<input type="checkbox" value="accepted" <%if (accepted)%> checked
		name="<portlet:namespace />accepted"
		id="<portlet:namespace />accepted">
	<%
		}
	%>
	<%
		}
	%>

	<%
		if (parentMessageId == 0) {
	%>
	<div class="details_header_row">
		<div class="dots_h"></div>
		<div class="details_header details-margin">
			<liferay-ui:message key="message.consultation.signature"/>
		</div>
	</div>
	<input type="text" value="<%=signature%>" style="width: 150px;"
		name="<portlet:namespace />signature"
		id="<portlet:namespace />signature">
	<%
		}
	%>

	<%
		if (parentMessageId == 0) {
	%>
	<div class="details_header_row">
		<div class="dots_h"></div>
		<div class="details_header details-margin">
			<liferay-ui:message key="message.consultation.subject"/>
		</div>
	</div>
	<input type="text" value="<%=subject%>" style="width: 450px;"
		name="<portlet:namespace />subject" id="<portlet:namespace />subject">
	<%
		} else {
	%>
	<input type="hidden" value="<%=subject%>"
		name="<portlet:namespace />subject" id="<portlet:namespace />subject">
	<%
		}
	%>

	<%
		if (parentMessageId == 0) {
	%>
	<div class="details_header_row">
		<div class="dots_h"></div>
		<div class="details_header details-margin">
			<liferay-ui:message key="message.consultation.area"/>
		</div>
	</div>
	<input type="text" value="<%=discussionArea%>" style="width: 450px;"
		name="<portlet:namespace />discussionArea"
		id="<portlet:namespace />discussionArea">
	<%
		}
	%>

	<%
		if (parentMessageId == 0) {
	%>
	<div class="details_header_row">
		<div class="dots_h"></div>
		<div class="details_header details-margin">
			<liferay-ui:message key="message.consultation.territory"/>
		</div>
	</div>
	<input type="text" value="<%=territory%>" style="width: 450px;"
		name="<portlet:namespace />territory"
		id="<portlet:namespace />territory">
	<%
		}
	%>

	<%
		if (parentMessageId == 0) {
	%>
	<div class="dots_h" style="margin-top: 15px"></div>
	<table>
		<tr>
			<td style="width: 130px; vertical-align: top">
				<div class="details_header details-margin"><liferay-ui:message key="message.consultation.startDate"/></div> <input
				type="text" value="<%=dateFrom%>" style="width: 100px"
				name="<portlet:namespace />dateFrom"
				id="<portlet:namespace />dateFrom">
			</td>
			<td style="width: 250px; vertical-align: top">
				<div class="details_header details-margin"><liferay-ui:message key="message.consultation.endDateAndTime"/></div> <input type="text" value="<%=dateTo%>"
				style="width: 100px;" name="<portlet:namespace />dateTo"
				id="<portlet:namespace />dateTo"> <input type="text"
				value="<%=dateToHHmm%>" style="width: 70px;"
				name="<portlet:namespace />dateToHHmm"
				id="<portlet:namespace />dateToHHmm">
			</td>
		</tr>
	</table>
	<%
		}
	%>
	<div class="details_header_row">
		<div class="dots_h"></div>
		<div class="details_header details-margin">
			<%
				if (parentMessageId == 0) {
			%><liferay-ui:message key="message.consultation.target.edit"/><%
				} else {
			%><liferay-ui:message key="message.body"/><%
				}
			%>
		</div>
	</div>
	<%@ include file="/html/portlet/message_boards/bbcode_editor.jspf"%>

	<input name="<portlet:namespace />body" type="hidden" value="" />
	<c:if test="<%= attachments %>">
		<div class="details_header_row">
			<div class="dots_h"></div>
			<div class="details_header details-margin">Załączniki:</div>
		</div>
		<table class="lfr-table">
			<%
				for (int i = 0; i < existingAttachments.length; i++) {
						String existingPath = existingAttachments[i];
						String existingName = StringUtil.extractLast(existingPath,
								StringPool.SLASH);
			%>
			<%
				if (parentMessageId==0 && i == 0) {
			%>
			<tr>
				<td><liferay-ui:message key="message.consultation.mainAttachment"/></td>
				<td></td>
			</tr>
			<%
				} else if (parentMessageId==0 && i == 1) {
			%>
			<tr>
				<td><liferay-ui:message key="message.consultation.otherAttachments"/></td>
				<td></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td><span id="<portlet:namespace />existingFile<%=i + 1%>">
						<input name="<portlet:namespace />existingPath<%=i + 1%>"
						type="hidden" value="<%=existingPath%>" /> <%=existingName%>
				</span> <input id="<portlet:namespace />msgFile<%=i + 1%>"
					name="<portlet:namespace />msgFile<%=i + 1%>" size="70"
					style="display: none;" type="file" /></td>
				<td><img id="<portlet:namespace />removeExisting<%=i + 1%>"
					src="<%=themeDisplay.getPathThemeImages()%>/arrows/02_x.png" /></td>
			</tr>
			<%
				}
			%>
			<%
				for (int i = existingAttachments.length + 1; i <= 15; i++) {
			%>
			<%
				if (parentMessageId==0 && i == 1) {
			%>
			<tr>
				<td><liferay-ui:message key="message.consultation.mainAttachment"/></td>
				<td></td>
			</tr>
			<%
				} else if (parentMessageId==0 && i == 2) {
			%>
			<tr>
				<td><liferay-ui:message key="message.consultation.otherAttachments"/></td>
				<td></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td><input name="<portlet:namespace />msgFile<%=i%>" size="50"
					type="file" /></td>
				<td></td>
			</tr>
			<%
				}
			%>
		</table>
	</c:if>
	<c:if
		test="<%= MBCategoryPermission.contains(permissionChecker, categoryId, ActionKeys.ADD_MESSAGE) %>">

		<div class="smaller_button green_sm attachment_button">
			<div class="left"></div>
			<div class="middle">
				<a href="#"
					onclick="document.<portlet:namespace />fm.<portlet:namespace />body.value = <portlet:namespace />getHTML(); document.<portlet:namespace />fm.<portlet:namespace />attachments.value = '<%=!attachments%>'; submitForm(document.<portlet:namespace />fm); return false;"><%=(attachments)
						? "Usuń załączniki"
						: "Dodaj załączniki"%></a>
			</div>
			<div class="right"></div>
		</div>
		<div class="clear"></div>
	</c:if>
	
	
	<c:if test="<%= (message == null) && themeDisplay.isSignedIn() && allowAnonymousPosting && !isUserAddon%>">
		<div class="details_header_row">
			<div class="dots_h"></div>
			<div class="details_header details-margin">
				<liferay-ui:message key="message.consultation.anonymous"/>&nbsp;
				<liferay-ui:input-checkbox param="anonymous" />
				<span class="helpIcon" title="<liferay-ui:message key="helpIcon.message.anonymouse"/>">
					<img src="<%=themeDisplay.getPathThemeImages()%>/common/help.png">
				</span>
			</div>
		</div>
	</c:if>
	
	<c:if test="<%= curParentMessage != null %>">
		<div class="details_header_row">
			<div class="dots_h"></div>
			<div id="license_tooltip" class="details_header details-margin">
				<liferay-ui:message key="message.consultation.selectLicense"/><br />
				<input type="radio" name="<portlet:namespace />licenseType" value="CREATIVE_COMMONS_LICENSE" checked="checked" />&nbsp;<liferay-ui:message key="message.consultation.license.cc"/>
				<span class="helpIcon" title="<liferay-ui:message key="helpIcon.message.license.cc"/>">
					<img src="<%=themeDisplay.getPathThemeImages()%>/common/help.png">
				</span>
				<br/>
				<input type="radio" name="<portlet:namespace />licenseType" value="QUOTE_LICENSE" />&nbsp;<%= LanguageUtil.format(pageContext, "message.consultation.license.quote", new Object[] {threadDetail.getOrganizationName()}) %>
				<span class="helpIcon" title="<liferay-ui:message key="helpIcon.message.license.quote"/>">
					<img src="<%=themeDisplay.getPathThemeImages()%>/common/help.png">
				</span>						
			</div>
		</div>
	</c:if>
	
	<c:if
		test="<%= (curParentMessage == null) || childrenMessagesTaggable %>">
		<div class="details_header_row">
			<div class="dots_h"></div>
			<div class="details_header details-margin"><liferay-ui:message key="message.consultation.labels"/></div>
		</div>
		<%
			long classPK = 0;

				if (message != null) {
					classPK = message.getMessageId();
				}
		%>

		<liferay-ui:tags-selector className="<%= MBMessage.class.getName() %>"
			classPK="<%= classPK %>" hiddenInput="tagsEntries"
			contentCallback='<%= renderResponse.getNamespace() + "getSuggestionsContent" %>' />
	</c:if>
	<c:if test="<%= message == null && false%>">
		<liferay-ui:input-permissions
			modelName="<%= MBMessage.class.getName() %>" />
	</c:if>
	<c:if
		test="<%= (message == null) && PropsValues.CAPTCHA_CHECK_PORTLET_MESSAGE_BOARDS_EDIT_MESSAGE %>">
		<portlet:actionURL
			windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>"
			var="captchaURL">
			<portlet:param name="struts_action" value="/message_boards/captcha" />
		</portlet:actionURL>

		<liferay-ui:captcha url="<%= captchaURL %>" />
	</c:if>

	<div class="dots_h dots_margin"></div>

	<div class="messages_box message_actions">
		<div class="big_button menu_button green">
			<div class="left"></div>
			<div class="middle">
				<a href="#"
					onclick="<portlet:namespace />saveMessage(); return false;">Zapisz</a>
			</div>
			<div class="right"></div>
		</div>
		<div class="big_button menu_button grey">
			<div class="left"></div>
			<div class="middle">
				<a href="#"
					onClick="document.<portlet:namespace />fm.<portlet:namespace />body.value = <portlet:namespace />getHTML(); document.<portlet:namespace />fm.<portlet:namespace />preview.value = 'true'; submitForm(document.<portlet:namespace />fm); return false;">Podgląd</a>
			</div>
			<div class="right"></div>
		</div>
		<div class="big_button menu_button grey cancel_button">
			<div class="left"></div>
			<div class="middle">
				<a href="#"
					onClick="location.href = '<%=HtmlUtil.escape(redirect)%>'; return false;">Anuluj</a>
			</div>
			<div class="right"></div>
		</div>
	</div>

</form>

<script type="text/javascript">
	jQuery(
		function() {
			<c:if test="<%=windowState.equals(WindowState.MAXIMIZED)
					&& !themeDisplay.isFacebook()%>">
				Liferay.Util.focusFormField(document.<portlet:namespace />fm.<portlet:namespace />subject);
			</c:if>

			<%for (int i = 1; i <= existingAttachments.length; i++) {%>

				jQuery("#<portlet:namespace />removeExisting" + <%=i%>).click(
					function() {
						var button = jQuery(this);
						var span = jQuery("#<portlet:namespace />existingFile" + <%=i%>);
						var file = jQuery("#<portlet:namespace />msgFile" + <%=i%>);

						button.remove();
						span.remove();
						file.show();
					}
				);

			<%}%>
		}
	);
</script>