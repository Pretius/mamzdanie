
<%@page import="pl.mamzdanie.userorganization.svc.service.UserOrganizationLocalServiceUtil"%>
<%@page import="pl.mamzdanie.userorganization.svc.model.UserOrganization"%>
<%@page
	import="pl.mamzdanie.threaddetail.svc.service.ThreadDetailLocalServiceUtil"%>
<%@page import="pl.mamzdanie.threaddetail.svc.model.ThreadDetail"%>
<%@page contentType="text/html; charset=UTF-8"%>
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

<%@ include file="/html/portlet/message_boards/init.jsp"%>

<%
	String cmd = (String) request.getAttribute("cmd");
	boolean isShowHidden = cmd != null && cmd.equalsIgnoreCase("showHidden");

	themeDisplay.setIncludeServiceJs(true);

	MBMessageDisplay messageDisplay = (MBMessageDisplay) request.getAttribute(WebKeys.MESSAGE_BOARDS_MESSAGE);

	MBMessage message = messageDisplay.getMessage();

	MBCategory category = messageDisplay.getCategory();

	MBThread thread = messageDisplay.getThread();

	MBThread previousThread = messageDisplay.getPreviousThread();
	MBThread nextThread = messageDisplay.getNextThread();

	PortalPreferences portalPrefs = PortletPreferencesFactoryUtil.getPortalPreferences(request);

	String threadView = MBThreadImpl.THREAD_VIEW_FLAT; //messageDisplay.getThreadView();
	
	String detailsURL = "/web/guest/konsultacje/-/message_boards/message/";
%>


<%@page import="com.liferay.portal.kernel.bean.PortalBeanLocatorUtil"%><script
	type="text/javascript">

	<c:if test="<%=thread.getRootMessageId() != message.getMessageId()%>">
		jQuery(
			function() {
				document.getElementById("<portlet:namespace />message_" + <%=message.getMessageId()%>).scrollIntoView(true);
			}
		);
	</c:if>
</script>

<c:if test="<%= includeFormTag %>">
	<form>
		<input name="<portlet:namespace />breadcrumbsCategoryId" type="hidden"
			value="<%=category.getCategoryId()%>" /> <input
			name="<portlet:namespace />breadcrumbsMessageId" type="hidden"
			value="<%=message.getMessageId()%>" /> <input
			name="<portlet:namespace />threadId" type="hidden"
			value="<%=message.getThreadId()%>" />
</c:if>

<!--<table cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="stretch">
		<div class="breadcrumbs"><%=MBUtil.getBreadcrumbs(null, message, pageContext, renderRequest, renderResponse)%>
		</div>
		</td>
	</tr>
</table>
-->
<%
	if (CommonUtils.isTechnicalAdmin(user)) {
%>
<div class="thread-controls">
	<div class="thread-actions">
		<table class="lfr-table">
			<tr>
				<c:if
					test="<%= MBCategoryPermission.contains(permissionChecker, category, ActionKeys.ADD_MESSAGE) %>">
					<td><portlet:renderURL var="addMessageURL">
							<portlet:param name="struts_action"
								value="/message_boards/edit_message" />
							<portlet:param name="redirect" value="<%= currentURL %>" />
							<portlet:param name="categoryId"
								value="<%= String.valueOf(category.getCategoryId()) %>" />
						</portlet:renderURL> <liferay-ui:icon image="post" message="post-new-thread"
							url="<%= addMessageURL %>" label="<%= true %>" /></td>
				</c:if>

				<c:if
					test="<%= MBMessagePermission.contains(permissionChecker, message, ActionKeys.SUBSCRIBE) %>">
					<td><c:choose>
							<c:when
								test="<%= SubscriptionLocalServiceUtil.isSubscribed(user.getCompanyId(), user.getUserId(), MBThread.class.getName(), message.getThreadId()) %>">
								<portlet:actionURL var="unsubscribeURL">
									<portlet:param name="struts_action"
										value="/message_boards/edit_message" />
									<portlet:param name="<%= Constants.CMD %>"
										value="<%= Constants.UNSUBSCRIBE %>" />
									<portlet:param name="redirect" value="<%= currentURL %>" />
									<portlet:param name="messageId"
										value="<%= String.valueOf(message.getMessageId()) %>" />
								</portlet:actionURL>

								<liferay-ui:icon image="unsubscribe" url="<%= unsubscribeURL %>"
									label="<%= true %>" />
							</c:when>
							<c:otherwise>
								<portlet:actionURL var="subscribeURL">
									<portlet:param name="struts_action"
										value="/message_boards/edit_message" />
									<portlet:param name="<%= Constants.CMD %>"
										value="<%= Constants.SUBSCRIBE %>" />
									<portlet:param name="redirect" value="<%= currentURL %>" />
									<portlet:param name="messageId"
										value="<%= String.valueOf(message.getMessageId()) %>" />
								</portlet:actionURL>

								<liferay-ui:icon image="subscribe" url="<%= subscribeURL %>"
									label="<%= true %>" />
							</c:otherwise>
						</c:choose></td>
				</c:if>

				<c:if
					test="<%= MBCategoryPermission.contains(permissionChecker, category, ActionKeys.MOVE_THREAD) %>">
					<td><portlet:renderURL var="editThreadURL">
							<portlet:param name="struts_action"
								value="/message_boards/move_thread" />
							<portlet:param name="redirect" value="<%= currentURL %>" />
							<portlet:param name="threadId"
								value="<%= String.valueOf(message.getThreadId()) %>" />
						</portlet:renderURL> <liferay-ui:icon image="forward" message="move-thread"
							url="<%= editThreadURL %>" label="<%= true %>" /></td>
				</c:if>
			</tr>
		</table>
	</div>
	<div class="clear"></div>
</div>
<%
	}
%>

<%
	MBTreeWalker treeWalker = messageDisplay.getTreeWalker();

	List<MBMessage> messages = null;

	if (treeWalker != null) {
		messages = new ArrayList<MBMessage>();
		messages.addAll(treeWalker.getMessages());
		messages = ListUtil.sort(messages, new MessageCreateDateComparator(true));
	}
	TagsUtil.addLayoutTagsEntries(request,
			TagsEntryLocalServiceUtil.getEntries(MBMessage.class.getName(), thread.getRootMessageId(), true));
%>

<div class="message-scroll" id="<portlet:namespace />message_0"></div>

<%
	MBMessage detailMessage = MBMessageLocalServiceUtil.getMessage(thread.getRootMessageId());
	String detailBody = BBCodeUtil.getHTML(detailMessage);

	MBAddon messageAddon = MBAddonLocalServiceUtil.getMBAddon(detailMessage.getThreadId());
	
	SimpleDateFormat format = new SimpleDateFormat("dd MMMM yyyy");
	SimpleDateFormat format2 = new SimpleDateFormat("dd MMMM yyyy HH:mm");

	User authorUser = UserLocalServiceUtil.getUserById(detailMessage.getUserId());
	
	String[] detailFiles = detailMessage.getAttachmentsFiles();
	CommonUtils.swapFileNames(detailFiles, messageAddon.getMainAttachment());

	List<TagsEntry> detailEntries = TagsEntryLocalServiceUtil.getEntries(MBMessage.class.getName(),
			detailMessage.getMessageId(), true);

	int detailTotal = MBMessageLocalServiceUtil.getThreadMessagesCount(message.getThreadId());
	boolean editable = true;

	String backUrl;

	Calendar cal = Calendar.getInstance();
	cal.add(Calendar.DATE, -1);

	if (messageAddon.getDateTo().compareTo(cal.getTime()) < 0)
		backUrl = CommonUtils.manageUrl(currentURL, "/konsultacje-zakonczone");
	else
		backUrl = CommonUtils.manageUrl(currentURL, "/konsultacje-aktywne");

	boolean active = false;
	boolean summary = false;
	Long organizationId=null;
	try {
		ThreadDetail threadDetail = ThreadDetailLocalServiceUtil.getThreadDetail(detailMessage.getMessageId());
		active = threadDetail.getActive() == 1;
		summary = threadDetail.getSummaryId() != null;
		organizationId=threadDetail.getOrganizationId();
	} catch (Exception e) {
	}
	
	UserOrganization userOrganization=null;	
	if(organizationId!=null)
		userOrganization=UserOrganizationLocalServiceUtil.getUserOrganization(organizationId);

	int lastIdx = MBMessageLocalServiceUtil.getThreadMessagesCount(message.getThreadId());

	MBMessage summaryMessage = null;
	if (summary)
		summaryMessage = MBMessageLocalServiceUtil.getThreadMessages(message.getThreadId(), lastIdx - 1, lastIdx).get(0);
%>
<portlet:renderURL var="replyURLDetail">
	<portlet:param name="struts_action"
		value="/message_boards/edit_message" />
	<portlet:param name="redirect" value="<%= currentURL %>" />
	<portlet:param name="categoryId"
		value="<%= String.valueOf(detailMessage.getCategoryId()) %>" />
	<portlet:param name="threadId"
		value="<%= String.valueOf(detailMessage.getThreadId()) %>" />
	<portlet:param name="parentMessageId"
		value="<%= String.valueOf(detailMessage.getMessageId()) %>" />
</portlet:renderURL>

<c:if
	test='<%= threadView.equals(MBThreadImpl.THREAD_VIEW_COMBINATION) && (messages.size() > 1) %>'>
	<liferay-ui:toggle-area
		id="toggle_id_message_boards_view_message_thread">
		<table class="toggle_id_message_boards_view_message_thread">
			<%
				request.setAttribute(WebKeys.MESSAGE_BOARDS_TREE_WALKER, treeWalker);
						request.setAttribute(WebKeys.MESSAGE_BOARDS_TREE_WALKER_SEL_MESSAGE, message);
						request.setAttribute(WebKeys.MESSAGE_BOARDS_TREE_WALKER_CUR_MESSAGE, treeWalker.getRoot());
						request.setAttribute(WebKeys.MESSAGE_BOARDS_TREE_WALKER_CATEGORY, category);
						request.setAttribute(WebKeys.MESSAGE_BOARDS_TREE_WALKER_THREAD, thread);
						request.setAttribute(WebKeys.MESSAGE_BOARDS_TREE_WALKER_LAST_NODE, Boolean.valueOf(false));
						request.setAttribute(WebKeys.MESSAGE_BOARDS_TREE_WALKER_DEPTH, new Integer(0));
			%>

			<liferay-util:include
				page="/html/portlet/message_boards/view_thread_shortcut.jsp" />

		</table>
	</liferay-ui:toggle-area>
</c:if>

<c:choose>
	<c:when test='<%= threadView.equals(MBThreadImpl.THREAD_VIEW_TREE) %>'>

		<%
			request.setAttribute(WebKeys.MESSAGE_BOARDS_TREE_WALKER, treeWalker);
					request.setAttribute(WebKeys.MESSAGE_BOARDS_TREE_WALKER_SEL_MESSAGE, message);
					request.setAttribute(WebKeys.MESSAGE_BOARDS_TREE_WALKER_CUR_MESSAGE, treeWalker.getRoot());
					request.setAttribute(WebKeys.MESSAGE_BOARDS_TREE_WALKER_CATEGORY, category);
					request.setAttribute(WebKeys.MESSAGE_BOARDS_TREE_WALKER_THREAD, thread);
					request.setAttribute(WebKeys.MESSAGE_BOARDS_TREE_WALKER_LAST_NODE, Boolean.valueOf(false));
					request.setAttribute(WebKeys.MESSAGE_BOARDS_TREE_WALKER_DEPTH, new Integer(0));
		%>

		<liferay-util:include
			page="/html/portlet/message_boards/view_thread_tree.jsp" />
	</c:when>
	<c:otherwise>
		<c:if test="<%= !messageAddon.getAccepted()%>">
			<span class="portlet-msg-error">Konsultacja nie została
				jeszcze zaakceptowana przez moderatora.</span>
		</c:if>
		<div class="details_narrow">
			<div class="arrows_left"></div>
			<a href="<%=backUrl%>"> <strong>Powrót do listy
					konsultacji</strong></a>
			<div class="detail_row">
				<div class="details_header"><liferay-ui:message key="message.consultation.signature"/></div>
				<%=messageAddon.getSignature()%></div>
			<div class="detail_row">
				<div class="details_header"><liferay-ui:message key="message.consultation.area"/></div>
				<%=messageAddon.getDiscussionArea()%></div>
			<div class="detail_row">
				<div class="details_header"><liferay-ui:message key="message.consultation.territory"/></div>
				<%=messageAddon.getTerritory()%></div>
			<div class="detail_row">
				<div class="details_header"><liferay-ui:message key="message.consultation.startDate"/></div>
				<%=format.format(messageAddon.getDateFrom())%></div>
			<div class="detail_row">
				<div class="details_header"><liferay-ui:message key="message.consultation.endDate"/></div>
				<%=format2.format(messageAddon.getDateTo())%></div>
			<div class="detail_row">
				<div class="details_header">Autor:</div>
				<%if(userOrganization!=null){ %>
					<%=userOrganization.getName() %><br/>
				<%} %>
				<%=detailMessage.getUserName()%></div>
			<div class="detail_row">
				<div class="details_header">Kontakt do autora:</div>
				<div class="smaller_header">Adres e-mail:</div>
				<%=authorUser.getEmailAddress()%></div>
			<c:if test="<%= detailMessage.isAttachments() %>">
				<div class="detail_row">
					<div class="details_header">Załączniki:</div>
					<%
						for (int j = 0; j < detailFiles.length; j++) {
										String fileName = FileUtil.getShortFileName(detailFiles[j]);
					%>
			<% if(j==0){ %>
				<div class="smaller_header">Załącznik główny konsultacji:</div>
			<%}else if(j==1){%>
				<div class="smaller_header" style="margin-top:6px">Pozostałe załączniki konsultacji:</div>
			<%} %>
					<div class="link_attachment">
						<div class="file_icon <%=MBUtil.getCssStyledIcon(fileName)%>_ext"></div>
						<div class="arrows_right"></div>
						<a
							href="<portlet:actionURL windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>"><portlet:param name="struts_action" value="/message_boards/get_message_attachment" /><portlet:param name="messageId" value="<%= String.valueOf(detailMessage.getMessageId()) %>" /><portlet:param name="attachment" value="<%= fileName %>" /></portlet:actionURL>"><%=fileName%></a>
					</div>
					<%
						}
					%>
				</div>
			</c:if>
			<div class="detail_row">
				<div class="details_header">Tagi:</div>
				<div class="tag_labels">
					<%
						for (int j = 0; j < detailEntries.size(); j++) {
									out.write(detailEntries.get(j).getName() + " &nbsp ");
								}
					%>
				</div>
			</div>
			<div class="detail_row">
				<div class="details_header">Liczba wypowiedzi:</div>
				<%=String.valueOf(detailTotal - 1)%></div>
		</div>
		<div class="posts_narrow">
			<!-- AddThis Button BEGIN -->
			<div class="addthis_toolbox addthis_default_style "
				style="float: right;">
				<a
					href="http://www.addthis.com/bookmark.php?v=250&amp;username=xa-4d21f6cf0ccf8763"
					class="addthis_button_compact">Share</a> <span
					class="addthis_separator">|</span> <a
					class="addthis_button_preferred_1"></a> <a
					class="addthis_button_preferred_2"></a> <a
					class="addthis_button_preferred_3"></a> <a
					class="addthis_button_preferred_4"></a>
			</div>
			<script type="text/javascript"
				src="http://s7.addthis.com/js/250/addthis_widget.js#username=xa-4d21f6cf0ccf8763"></script>
			<!-- AddThis Button END -->

			<div class="dots_h dots_margin"></div>
			<span class="green_header"><liferay-ui:message key="message.consultation.subject"/></span><br /> <span
				class="consultation_header"><%=HtmlUtil.escape(detailMessage.getSubject())%></span>
			<div class="dots_h dots_margin"></div>
			<span class="green_header"><liferay-ui:message key="message.consultation.target"/></span><br />
			<%=detailBody%>
			<%
				if (summary) {
			%>
			<div class="dots_h dots_margin"></div>
			<a name="podsumowanie" style="text-decoration:none"><span class="green_header">Podsumowanie konsultacji:</span></a><br />
			<%
			String summaryBody = BBCodeUtil.getHTML(summaryMessage.getBody());
			summaryBody = StringUtil.replace(summaryBody,
					"@theme_images_path@/emoticons", themeDisplay
							.getPathThemeImages()
							+ "/emoticons");
			%>
			<%=summaryBody%>
			<div class="dots_grey attachments_line"></div>
			<b>Załączniki:</b>
			<c:if test="<%= summaryMessage.isAttachments() %>">
				<%
					String[] attachmentsFiles = summaryMessage.getAttachmentsFiles();
									for (int j = 0; j < attachmentsFiles.length; j++) {
										String fileName = FileUtil.getShortFileName(attachmentsFiles[j]);
				%>
				<div class="link_attachment">
					<div class="file_icon <%=MBUtil.getCssStyledIcon(fileName)%>_ext"></div>
					<div class="arrows_right"></div>
					<a
						href="<portlet:actionURL windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>"><portlet:param name="struts_action" value="/message_boards/get_message_attachment" /><portlet:param name="messageId" value="<%= String.valueOf(summaryMessage.getMessageId()) %>" /><portlet:param name="attachment" value="<%= fileName %>" /></portlet:actionURL>"><%=fileName%></a>
				</div>
				<%
					}
				%>
			</c:if>
			<%
				}
			%>

			<c:if test="<%= CommonUtils.isTechnicalAdmin(user) && editable %>">
				<div class="editable_icons main_consultation_icons">
					<c:if
						test="<%= MBMessagePermission.contains(permissionChecker, detailMessage, ActionKeys.UPDATE) %>">
						<portlet:renderURL var="editURL">
							<portlet:param name="struts_action"
								value="/message_boards/edit_message" />
							<portlet:param name="redirect" value="<%= currentURL %>" />
							<portlet:param name="messageId"
								value="<%= String.valueOf(detailMessage.getMessageId()) %>" />
						</portlet:renderURL>
						<liferay-ui:icon image="edit" url="<%= editURL %>"
							label="<%= true %>" />
					</c:if>
					<c:if
						test="<%= MBMessagePermission.contains(permissionChecker, detailMessage, ActionKeys.PERMISSIONS) %>">
						<liferay-security:permissionsURL
							modelResource="<%= MBMessage.class.getName() %>"
							modelResourceDescription="<%= HtmlUtil.escape(detailMessage.getSubject()) %>"
							resourcePrimKey="<%= String.valueOf(detailMessage.getMessageId()) %>"
							var="permissionsURL" />
						<liferay-ui:icon image="permissions" url="<%= permissionsURL %>"
							label="<%= true %>" />
					</c:if>
					<c:if
						test="<%= MBMessagePermission.contains(permissionChecker, detailMessage, ActionKeys.DELETE) %>">
						<%
							PortletURL categoryURL = renderResponse.createRenderURL();

											categoryURL.setParameter("struts_action", "/message_boards/view");
											categoryURL.setParameter("categoryId", String.valueOf(detailMessage.getCategoryId()));
						%>
						<portlet:actionURL var="deleteURL">
							<portlet:param name="struts_action"
								value="/message_boards/edit_message" />
							<portlet:param name="<%= Constants.CMD %>"
								value="<%= Constants.DELETE %>" />
							<portlet:param name="redirect"
								value="<%= categoryURL.toString() %>" />
							<portlet:param name="messageId"
								value="<%= String.valueOf(detailMessage.getMessageId()) %>" />
						</portlet:actionURL>
						<liferay-ui:icon-delete url="<%= deleteURL %>" label="<%= true %>" />
					</c:if>
				</div>
			</c:if>
			<div class="dots_big_h big_dots_margin"></div>
			<c:if
				test="<%= editable && active && (MBCategoryPermission.contains(permissionChecker, category, ActionKeys.ADD_MESSAGE) || MBCategoryPermission.contains(permissionChecker, category, ActionKeys.REPLY_TO_MESSAGE)) %>">
				<div class="messages_label"></div>
				<div class="messages_box">
					<div class="big_button menu_button green">
						<div class="left"></div>
						<div class="middle">
							<a href="<%=replyURLDetail%>">Dodaj wypowiedź</a>
						</div>
						<div class="right"></div>
					</div>
					<!-- <div class="or_send">lub wyślij ją na adres</div>
					<div class="big_button green">
						<div class="left"></div>
						<div class="middle">
							<a
								href="mailto:<%=detailMessage.getMessageId()%>@mamzdanie.org.pl"><%=detailMessage.getMessageId()%>@mamzdanie.org.pl</a>
						</div>
						<div class="right"></div>
					</div> -->
					<!-- <c:if test="<%=!isShowHidden%>">
						<div class="big_button menu_button green">
							<div class="left"></div>
							<div class="middle">
								<a href="<%=detailsURL + detailMessage.getMessageId()%>?_19_delta=100&_19_cmd=showHidden"><liferay-ui:message key="message.list.show.hidden"/></a>
							</div>
							<div class="right"></div>
						</div>
					</c:if> -->
				</div>
			</c:if>
			<c:if
				test="<%= !active && !summary && (detailMessage.getUserId()==user.getUserId() || CommonUtils.isTechnicalAdmin(user)) %>">
				<div class="messages_label"></div>
				<div class="messages_box">
					<div class="big_button menu_button green">
						<div class="left"></div>
						<div class="middle">
							<a href="<%=replyURLDetail%>">Dodaj podsumowanie konsultacji</a>
						</div>
						<div class="right"></div>
					</div>
				</div>
			</c:if>

			<div><%@ include
					file="/html/portlet/message_boards/view_thread_flat.jspf"%>
			</div>
	</c:otherwise>
</c:choose>
</div>

<c:if test="<%= includeFormTag %>">
	</form>
</c:if>

<%
	MBMessageFlagLocalServiceUtil.addReadFlags(themeDisplay.getUserId(), thread);

	message = messageDisplay.getMessage();

	PortalUtil.setPageSubtitle(message.getSubject(), request);
	PortalUtil.setPageDescription(message.getSubject(), request);

	List<TagsEntry> tagsEntries = TagsEntryLocalServiceUtil.getEntries(MBMessage.class.getName(), message.getMessageId(),
			true);

	PortalUtil.setPageKeywords(ListUtil.toString(tagsEntries, "name"), request);
%>