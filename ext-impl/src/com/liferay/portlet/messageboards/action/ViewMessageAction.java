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

package com.liferay.portlet.messageboards.action;

import javax.portlet.PortletConfig;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import pl.mamzdanie.CommonUtils;
import pl.mamzdanie.MZException;
import pl.mamzdanie.threaddetail.svc.model.ThreadDetail;
import pl.mamzdanie.threaddetail.svc.service.ThreadDetailLocalServiceUtil;

import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.ArrayUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.model.User;
import com.liferay.portal.security.auth.PrincipalException;
import com.liferay.portal.struts.PortletAction;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portal.util.PortletKeys;
import com.liferay.portal.util.PropsValues;
import com.liferay.portal.util.WebKeys;
import com.liferay.portlet.PortalPreferences;
import com.liferay.portlet.PortletPreferencesFactoryUtil;
import com.liferay.portlet.messageboards.NoSuchMessageException;
import com.liferay.portlet.messageboards.NoSuchThreadException;
import com.liferay.portlet.messageboards.model.MBMessage;
import com.liferay.portlet.messageboards.model.MBMessageDisplay;
import com.liferay.portlet.messageboards.service.MBMessageLocalServiceUtil;
import com.liferay.portlet.messageboards.service.MBMessageServiceUtil;
import com.liferay.portlet.messageboards.service.MBThreadLocalServiceUtil;

/**
 * <a href="ViewMessageAction.java.html"><b><i>View Source</i></b></a>
 * 
 * @author Brian Wing Shun Chan
 * 
 */
public class ViewMessageAction extends PortletAction {

	public ActionForward render(ActionMapping mapping, ActionForm form, PortletConfig portletConfig, RenderRequest renderRequest,
			RenderResponse renderResponse) throws Exception {
		try {
			long messageId = ParamUtil.getLong(renderRequest, "messageId");
			String cmd = ParamUtil.getString(renderRequest, "cmd");
			
			User user = PortalUtil.getUser(renderRequest);
			long threadId = MBMessageLocalServiceUtil.getMessage(messageId).getThreadId();
			long rootId = MBThreadLocalServiceUtil.getThread(threadId).getRootMessageId();
			ThreadDetail threadDetail = ThreadDetailLocalServiceUtil.getThreadDetail(rootId);

			if ((user == null && !threadDetail.getAccepted()) || (!threadDetail.getAccepted() && !(CommonUtils.isTechnicalAdmin(user) || isThreadOwner(rootId,
							user.getUserId())))) {
				throw new NoSuchThreadException();
			}
			PortalPreferences preferences = PortletPreferencesFactoryUtil.getPortalPreferences(renderRequest);

			String threadView = ParamUtil.getString(renderRequest, "threadView");

			if (Validator.isNotNull(threadView)) {
				preferences.setValue(PortletKeys.MESSAGE_BOARDS, "thread-view", threadView);
			} else {
				threadView = preferences.getValue(PortletKeys.MESSAGE_BOARDS, "thread-view",
						PropsValues.MESSAGE_BOARDS_THREAD_VIEWS_DEFAULT);
			}

			if (!ArrayUtil.contains(PropsValues.MESSAGE_BOARDS_THREAD_VIEWS, threadView)) {

				threadView = PropsValues.MESSAGE_BOARDS_THREAD_VIEWS_DEFAULT;

				preferences.setValue(PortletKeys.MESSAGE_BOARDS, "thread-view", threadView);
			}

			MBMessageDisplay messageDisplay = MBMessageServiceUtil.getMessageDisplay(messageId, threadView);
			
			renderRequest.setAttribute(WebKeys.MESSAGE_BOARDS_MESSAGE, messageDisplay);			
			renderRequest.setAttribute("cmd", cmd);
			
			return mapping.findForward("portlet.message_boards.view_message");
		} catch (Exception e) {
			if (e instanceof NoSuchMessageException || e instanceof PrincipalException || e instanceof NoSuchThreadException) {

				SessionErrors.add(renderRequest, e.getClass().getName());

				return mapping.findForward("portlet.message_boards.error");
			} else {
				throw e;
			}
		}
	}

	private boolean isThreadOwner(long rootId, long userId) {
		MBMessage mbMessage;
		try {
			mbMessage = MBMessageLocalServiceUtil.getMBMessage(rootId);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return mbMessage.getUserId() == userId;
	}

}