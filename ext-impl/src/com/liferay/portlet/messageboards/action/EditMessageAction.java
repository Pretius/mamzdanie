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

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.PortletURL;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import pl.mamzdanie.CommonUtils;
import pl.mamzdanie.manager.ModeratorManager;
import pl.mamzdanie.manager.NotificationManager;
import pl.mamzdanie.mbmessageaddon.svc.MBMessageLicenseType;
import pl.mamzdanie.mbmessageaddon.svc.MBMessageStatusType;
import pl.mamzdanie.mbmessageaddon.svc.NoSuchMBMessageAddonException;
import pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon;
import pl.mamzdanie.mbmessageaddon.svc.service.MBMessageAddonLocalServiceUtil;
import pl.mamzdanie.mbthreadaddon.svc.model.MBAddon;
import pl.mamzdanie.mbthreadaddon.svc.service.MBAddonLocalServiceUtil;
import pl.mamzdanie.threaddetail.svc.model.ThreadDetail;
import pl.mamzdanie.threaddetail.svc.service.ThreadDetailLocalServiceUtil;

import com.liferay.documentlibrary.FileNameException;
import com.liferay.documentlibrary.FileSizeException;
import com.liferay.ibm.icu.text.SimpleDateFormat;
import com.liferay.portal.SystemException;
import com.liferay.portal.kernel.bean.PortalBeanLocatorUtil;
import com.liferay.portal.kernel.captcha.CaptchaTextException;
import com.liferay.portal.kernel.captcha.CaptchaUtil;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.Constants;
import com.liferay.portal.kernel.util.FileUtil;
import com.liferay.portal.kernel.util.ObjectValuePair;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.model.User;
import com.liferay.portal.security.auth.PrincipalException;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.struts.PortletAction;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portal.util.PrefsPropsUtil;
import com.liferay.portal.util.PropsValues;
import com.liferay.portlet.ActionResponseImpl;
import com.liferay.portlet.messageboards.EmptyFieldException;
import com.liferay.portlet.messageboards.MessageBodyException;
import com.liferay.portlet.messageboards.MessageSubjectException;
import com.liferay.portlet.messageboards.MessageValidationException;
import com.liferay.portlet.messageboards.NoSuchMessageException;
import com.liferay.portlet.messageboards.RequiredMessageException;
import com.liferay.portlet.messageboards.TooLongDiscussionAreaFieldValueException;
import com.liferay.portlet.messageboards.TooLongSignatureFieldValueException;
import com.liferay.portlet.messageboards.TooLongSubjectFieldValueException;
import com.liferay.portlet.messageboards.TooLongTerritoryFieldValueException;
import com.liferay.portlet.messageboards.TooShortDurationException;
import com.liferay.portlet.messageboards.model.MBMessage;
import com.liferay.portlet.messageboards.model.MBThread;
import com.liferay.portlet.messageboards.service.MBMessageFlagLocalServiceUtil;
import com.liferay.portlet.messageboards.service.MBMessageServiceUtil;
import com.liferay.portlet.messageboards.service.MBThreadLocalServiceUtil;
import com.liferay.portlet.tags.TagsEntryException;

/**
 * <a href="EditMessageAction.java.html"><b><i>View Source</i></b></a>
 * 
 * @author Brian Wing Shun Chan
 * 
 */
public class EditMessageAction extends PortletAction {

	private Logger logger = Logger.getLogger(EditMessageAction.class);
	
	private static Integer MAX_SUBJECT_FIELD_LENGTH;
	private static Integer MAX_DISCUSSION_AREA_FIELD_LENGTH;
	private static Integer MAX_TERRITORY_FIELD_LENGTH;
	private static Integer MAX_SIGNATURE_FIELD_LENGTH;	
	
	private static Integer MIN_CONSULTATION_DURATION;
	
	static {
		try {
			MAX_SUBJECT_FIELD_LENGTH = PrefsPropsUtil.getInteger("mz.consultation.subject.field.length.max");
		} catch (SystemException e) {
			MAX_SUBJECT_FIELD_LENGTH = 125;
		}
		
		try {
			MAX_DISCUSSION_AREA_FIELD_LENGTH = PrefsPropsUtil.getInteger("mz.consultation.discussionArea.field.length.max");
		} catch (SystemException e) {
			MAX_DISCUSSION_AREA_FIELD_LENGTH = 150;
		}
		
		try {
			MAX_TERRITORY_FIELD_LENGTH = PrefsPropsUtil.getInteger("mz.consultation.territory.field.length.max");
		} catch (SystemException e) {
			MAX_TERRITORY_FIELD_LENGTH = 75;
		}
		
		try {
			MAX_SIGNATURE_FIELD_LENGTH = PrefsPropsUtil.getInteger("mz.consultation.signature.field.length.max");
		} catch (SystemException e) {
			MAX_SIGNATURE_FIELD_LENGTH = 50;
		}
		
		try {
			MIN_CONSULTATION_DURATION = PrefsPropsUtil.getInteger("mz.consultation.duration.min");
		} catch (SystemException e) {
			MIN_CONSULTATION_DURATION = 7;
		}
	}
	
	public void processAction(ActionMapping mapping, ActionForm form, PortletConfig portletConfig, ActionRequest actionRequest,
			ActionResponse actionResponse) throws Exception {

		String cmd = ParamUtil.getString(actionRequest, Constants.CMD);

		try {
			CommonUtils.verifyAccessToMessage(PortalUtil.getHttpServletRequest(actionRequest));
			User user = PortalUtil.getUser(actionRequest);

			
			if (!CommonUtils.isTechnicalAdmin(user)
					&& (cmd.equals(Constants.DELETE) || cmd.equals(Constants.SUBSCRIBE) || cmd
							.equals(Constants.UNSUBSCRIBE)))
				throw new PrincipalException();
			if (cmd.equals(Constants.ADD) || cmd.equals(Constants.UPDATE)) {
				updateMessage(actionRequest, actionResponse);
			} else if (cmd.equals(Constants.DELETE)) {
				deleteMessage(actionRequest);
			} else if (cmd.equals(Constants.SUBSCRIBE)) {
				subscribeMessage(actionRequest);
			} else if (cmd.equals(Constants.UNSUBSCRIBE)) {
				unsubscribeMessage(actionRequest);
			}

			if (cmd.equals(Constants.DELETE) || cmd.equals(Constants.SUBSCRIBE) || cmd.equals(Constants.UNSUBSCRIBE)) {

				sendRedirect(actionRequest, actionResponse);
			}
		} catch (Exception e) {
			if (e instanceof NoSuchMessageException || e instanceof PrincipalException || e instanceof RequiredMessageException) {

				SessionErrors.add(actionRequest, e.getClass().getName());

				setForward(actionRequest, "portlet.message_boards.error");
			} else if (e instanceof CaptchaTextException || e instanceof FileNameException || e instanceof FileSizeException
					|| e instanceof MessageBodyException || e instanceof MessageSubjectException
					|| e instanceof EmptyFieldException || e instanceof MessageValidationException) {
				SessionErrors.add(actionRequest, e.getClass().getName());
			} else if (e instanceof TagsEntryException) {
				SessionErrors.add(actionRequest, e.getClass().getName(), e);
			} else {
				throw e;
			}
		}
	}

	public ActionForward render(ActionMapping mapping, ActionForm form, PortletConfig portletConfig, RenderRequest renderRequest,
			RenderResponse renderResponse) throws Exception {

		try {
			ActionUtil.getMessage(renderRequest);
		} catch (Exception e) {
			if (e instanceof NoSuchMessageException || e instanceof PrincipalException) {

				SessionErrors.add(renderRequest, e.getClass().getName());

				return mapping.findForward("portlet.message_boards.error");
			} else {
				throw e;
			}
		}

		return mapping.findForward(getForward(renderRequest, "portlet.message_boards.edit_message"));
	}

	protected void deleteMessage(ActionRequest actionRequest) throws Exception {
		long messageId = ParamUtil.getLong(actionRequest, "messageId");

		MBMessageServiceUtil.deleteMessage(messageId);
		MBMessageAddonLocalServiceUtil.deleteMBMessageAddon(messageId);
	}

	protected void subscribeMessage(ActionRequest actionRequest) throws Exception {

		long messageId = ParamUtil.getLong(actionRequest, "messageId");

		MBMessageServiceUtil.subscribeMessage(messageId);
	}

	protected void unsubscribeMessage(ActionRequest actionRequest) throws Exception {

		long messageId = ParamUtil.getLong(actionRequest, "messageId");

		MBMessageServiceUtil.unsubscribeMessage(messageId);
	}

	protected void updateMessage(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {

		User user = PortalUtil.getUser(actionRequest);

		long messageId = ParamUtil.getLong(actionRequest, "messageId");

		long categoryId = ParamUtil.getLong(actionRequest, "categoryId");
		long threadId = ParamUtil.getLong(actionRequest, "threadId");
		long parentMessageId = ParamUtil.getLong(actionRequest, "parentMessageId");
		String subject = ParamUtil.getString(actionRequest, "subject");
		String body = ParamUtil.getString(actionRequest, "body");
		String licenseType = ParamUtil.getString(actionRequest, "licenseType");

		if (subject.equals("") || body.equals(""))
			throw new EmptyFieldException();

		boolean attachments = ParamUtil.getBoolean(actionRequest, "attachments");

		List<ObjectValuePair<String, byte[]>> files = new ArrayList<ObjectValuePair<String, byte[]>>();

		String mainAttachment = null;
		Boolean changeMainAttachment = false;
		
		String cmd = ParamUtil.getString(actionRequest, Constants.CMD);
		MBMessageAddon editMessageAddon = null;

		if (cmd.equals(Constants.UPDATE)) {
			if (parentMessageId != 0) {
				try {
					editMessageAddon = MBMessageAddonLocalServiceUtil.getMBMessageAddon(messageId);
					
					if (!CommonUtils.isTechnicalAdmin(user) && user.getUserId() != editMessageAddon.getUserId()) {
						throw new PrincipalException();
					}
					
					if (!editMessageAddon.getStatus().equals(MBMessageStatusType.REJECTED_MESSAGE.name())) {
						throw new PrincipalException();
					}
					
				} catch(NoSuchMBMessageAddonException e) {
					throw new PrincipalException();
				}
			}
		}
		
		if (attachments) {
			UploadPortletRequest uploadRequest = PortalUtil.getUploadPortletRequest(actionRequest);

			if (StringUtils.isBlank(uploadRequest.getParameter("existingPath1")))
				changeMainAttachment = true;

			for (int i = 1; i <= 15; i++) {
				File file = uploadRequest.getFile("msgFile" + i);
				String fileName = uploadRequest.getFileName("msgFile" + i);

				if (i == 1 && StringUtils.isNotBlank(fileName))
					mainAttachment = fileName;

				byte[] bytes = FileUtil.getBytes(file);

				if ((bytes != null) && (bytes.length > 0)) {
					ObjectValuePair<String, byte[]> ovp = new ObjectValuePair<String, byte[]>(fileName, bytes);

					files.add(ovp);
				}
			}
		} else
			changeMainAttachment = true;

		boolean question = ParamUtil.getBoolean(actionRequest, "question");
		boolean anonymous = ParamUtil.getBoolean(actionRequest, "anonymous");
		double priority = ParamUtil.getDouble(actionRequest, "priority");

		ServiceContext serviceContext = ServiceContextFactory.getInstance(MBMessage.class.getName(), actionRequest);

		MBMessage message = null;

		NotificationManager notificationManager = (NotificationManager) PortalBeanLocatorUtil.locate("notificationManager");
		ModeratorManager moderatorManager = (ModeratorManager) PortalBeanLocatorUtil.locate("moderatorManager");

		if (messageId <= 0) {
			if (PropsValues.CAPTCHA_CHECK_PORTLET_MESSAGE_BOARDS_EDIT_MESSAGE) {
				CaptchaUtil.check(actionRequest);
			}

			if (threadId <= 0) {

				// Post new thread

				message = MBMessageServiceUtil.addMessage(categoryId, subject, body, files, anonymous, priority, serviceContext);

				String signature = ParamUtil.getString(actionRequest, "signature");
				String discussionArea = ParamUtil.getString(actionRequest, "discussionArea");
				String territory = ParamUtil.getString(actionRequest, "territory");
				String dateFrom = ParamUtil.getString(actionRequest, "dateFrom");
				String dateTo = ParamUtil.getString(actionRequest, "dateTo");
				String dateToHHmm = ParamUtil.getString(actionRequest, "dateToHHmm");
				String accepted = ParamUtil.getString(actionRequest, "accepted");

				if (signature.equals("") || discussionArea.equals("") || territory.equals("") || dateFrom.equals("")
						|| dateTo.equals(""))
					throw new EmptyFieldException();				

				if ("".equals(dateToHHmm))
					dateToHHmm = "00:00";

				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
				SimpleDateFormat sdfHHmm = new SimpleDateFormat("dd-MM-yyyy HH:mm");
				
				long diffDays = this.countDaysDiff(dateFrom, dateTo, dateToHHmm);
				
				this.validate(subject, signature, discussionArea, territory, diffDays);				
				
				MBAddon mbAddon = MBAddonLocalServiceUtil.createMBAddon(message.getThreadId());				
				mbAddon.setSignature(signature);
				mbAddon.setDiscussionArea(discussionArea);
				mbAddon.setTerritory(territory);
				mbAddon.setDateFrom(sdf.parse(dateFrom));
				mbAddon.setDateTo(sdfHHmm.parse(dateTo + " " + dateToHHmm));
				mbAddon.setAccepted(accepted.equals("accepted"));
				if (changeMainAttachment)
					mbAddon.setMainAttachment(mainAttachment);

				MBAddonLocalServiceUtil.updateMBAddon(mbAddon);

				try {
					if (mbAddon.isAccepted()) {
						notificationManager.sendOnNewThread(message);
					} else {
						notificationManager.sendOnNewNotAcceptedThread(message);
					}
				} catch (Exception e) {
					logger.error(e);
				}

				if (question) {
					MBMessageFlagLocalServiceUtil.addQuestionFlag(message.getMessageId());
				}

				logger.info("[UserId: " + user.getUserId() + "] Creating new thread: " + message.getThreadId() + ".Subject: "
						+ message.getSubject() + ", body: " + message.getBody());
			} else {
				message = MBMessageServiceUtil.addMessage(categoryId, threadId, parentMessageId, subject, body, files, anonymous,
						priority, serviceContext);

				MBThread thread = MBThreadLocalServiceUtil.getThread(message.getThreadId());
				ThreadDetail threadDetail = ThreadDetailLocalServiceUtil.getThreadDetail(thread.getRootMessageId());
				MBAddon mbAddon = MBAddonLocalServiceUtil.getMBAddon(thread.getThreadId());

				if (threadDetail.getActive() == 0 && !(threadDetail.getSummaryId() != null) /*!threadDetail.getSummary()*/) {
					mbAddon.setSummaryId(threadDetail.getSummaryId());
					MBAddonLocalServiceUtil.updateMBAddon(mbAddon);
					
					logger.info("[UserId: " + user.getUserId() + "] Adding thread summary: " + message.getMessageId() + " in thread: "
							+ message.getThreadId() + ". Body: " + message.getBody());
				} else {
					MBMessageAddon mbMessageAddon = MBMessageAddonLocalServiceUtil.createMBMessageAddon(message.getMessageId());					
					MBMessageLicenseType messageLicenseType = null;
					boolean isEmiterOrAdmin = CommonUtils.isEmiter(user) || CommonUtils.isTechnicalAdmin(user);
							
					if (licenseType == null || licenseType.isEmpty()) {
						messageLicenseType = MBMessageLicenseType.CREATIVE_COMMONS_LICENSE;
					} else {
						for (MBMessageLicenseType license : MBMessageLicenseType.values()) {
							if (licenseType.equalsIgnoreCase(license.name())) {
								messageLicenseType = MBMessageLicenseType.valueOf(licenseType);
								break;
							}
						}
						
						if (messageLicenseType == null) {
							messageLicenseType = MBMessageLicenseType.CREATIVE_COMMONS_LICENSE;
						}
					}
					
					MBMessage parentMessage = MBMessageServiceUtil.getMessage(message.getParentMessageId());
					
					mbMessageAddon.setUserId(user.getUserId());
					mbMessageAddon.setIssuerId(parentMessage.getUserId());
					mbMessageAddon.setThreadId(message.getParentMessageId());
					mbMessageAddon.setLicenseType(messageLicenseType.name());
					
					if (isEmiterOrAdmin) {
						mbMessageAddon.setStatus(MBMessageStatusType.APPROVED_MESSAGE.name());
					} else {
						mbMessageAddon.setStatus(MBMessageStatusType.NEW_MESSAGE.name());
					}
					mbMessageAddon.setActive(true);
					mbMessageAddon.setVisible(true);
					
					MBMessageAddonLocalServiceUtil.updateMBMessageAddon(mbMessageAddon);
					
					if (!isEmiterOrAdmin) {
						moderatorManager.sendNewMessageNotyfication(message);
					}
					
					logger.info("[UserId: " + user.getUserId() + "] Adding message: " + message.getMessageId() + " in thread: "
							+ message.getThreadId() + " on license: " + licenseType + ". Status: " + mbMessageAddon.getStatus() + " Body: " + message.getBody());					
				}
			}
		} else {
			List<String> existingFiles = new ArrayList<String>();

			for (int i = 1; i <= 5; i++) {
				String path = ParamUtil.getString(actionRequest, "existingPath" + i);

				if (Validator.isNotNull(path)) {
					existingFiles.add(path);
				}
			}

			// Update message

			if (editMessageAddon != null) {
				MBMessageLicenseType messageLicenseType = null;
				
				message = MBMessageServiceUtil.getMessage(editMessageAddon.getMessageId());
				message.setCategoryId(categoryId);
				message.setSubject(subject);
				message.setBody(body);
				message.setAnonymous(anonymous);
				message.setPriority(priority);
				
				if (licenseType == null || licenseType.isEmpty()) {
					messageLicenseType = MBMessageLicenseType.CREATIVE_COMMONS_LICENSE;
				} else {
					for (MBMessageLicenseType license : MBMessageLicenseType.values()) {
						if (licenseType.equalsIgnoreCase(license.name())) {
							messageLicenseType = MBMessageLicenseType.valueOf(licenseType);
							break;
						}
					}
					
					if (messageLicenseType == null) {
						messageLicenseType = MBMessageLicenseType.CREATIVE_COMMONS_LICENSE;
					}
				}
				editMessageAddon.setLicenseType(licenseType);
				
				message = updateRejectedMessage(message, editMessageAddon, files, serviceContext, moderatorManager);
			} else {
				message = MBMessageServiceUtil
						.updateMessage(messageId, subject, body, files, existingFiles, priority, serviceContext);
			}

			if (message.isRoot()) {
				String signature = ParamUtil.getString(actionRequest, "signature");
				String discussionArea = ParamUtil.getString(actionRequest, "discussionArea");
				String territory = ParamUtil.getString(actionRequest, "territory");
				String dateFrom = ParamUtil.getString(actionRequest, "dateFrom");
				String dateTo = ParamUtil.getString(actionRequest, "dateTo");
				String dateToHHmm = ParamUtil.getString(actionRequest, "dateToHHmm");
				String accepted = ParamUtil.getString(actionRequest, "accepted");

				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
				SimpleDateFormat sdfHHmm = new SimpleDateFormat("dd-MM-yyyy HH:mm");

				if (signature.equals("") || discussionArea.equals("") || territory.equals("") || dateFrom.equals("")
						|| dateTo.equals(""))
					throw new EmptyFieldException();

				long diffDays = this.countDaysDiff(dateFrom, dateTo, dateToHHmm);
				
				this.validate(subject, signature, discussionArea, territory, diffDays);
				
				MBAddon mbAddon = MBAddonLocalServiceUtil.getMBAddon(message.getThreadId());				
				mbAddon.setSignature(signature);
				mbAddon.setDiscussionArea(discussionArea);
				mbAddon.setTerritory(territory);
				mbAddon.setDateFrom(sdf.parse(dateFrom));
				mbAddon.setDateTo(sdfHHmm.parse(dateTo + " " + dateToHHmm));
				mbAddon.setAccepted(accepted.equals("accepted"));
				if (changeMainAttachment)
					mbAddon.setMainAttachment(mainAttachment);

				MBAddonLocalServiceUtil.updateMBAddon(mbAddon);

				try {
					if (mbAddon.isAccepted())
						notificationManager.sendOnNewThread(message);
				} catch (Exception e) {
					logger.error(e);
				}
			}

			if (message.isRoot()) {
				if (question) {
					MBMessageFlagLocalServiceUtil.addQuestionFlag(messageId);
				} else {
					MBMessageFlagLocalServiceUtil.deleteQuestionAndAnswerFlags(message.getThreadId());
				}
			}
		}

		PortletURL portletURL = ((ActionResponseImpl) actionResponse).createRenderURL();

		portletURL.setParameter("struts_action", "/message_boards/view_message");
		portletURL.setParameter("messageId", String.valueOf(message.getMessageId()));

		actionResponse.sendRedirect(portletURL.toString());
	}
	
	private MBMessage updateRejectedMessage(
			MBMessage message, MBMessageAddon messageAddon,
			List<ObjectValuePair<String, byte[]>> files,
			ServiceContext serviceContext,
			ModeratorManager moderatorManager) throws Exception {
		
		MBMessage newMessage = MBMessageServiceUtil.addMessage(
				message.getCategoryId(),
				message.getThreadId(),
				message.getParentMessageId(),
				message.getSubject(),
				message.getBody(),
				files,
				message.isAnonymous(),
				message.getPriority(),
				serviceContext);
		
		MBMessageAddon newMessageAddon = MBMessageAddonLocalServiceUtil.createMBMessageAddon(newMessage.getMessageId());
		
		newMessageAddon.setUserId(newMessage.getUserId());
		newMessageAddon.setOldMessageId(message.getMessageId());
		newMessageAddon.setIssuerId(messageAddon.getIssuerId());
		newMessageAddon.setThreadId(messageAddon.getThreadId());
		newMessageAddon.setLicenseType(messageAddon.getLicenseType());
		newMessageAddon.setStatus(MBMessageStatusType.NEW_MESSAGE.name());					
		
		MBMessageAddonLocalServiceUtil.updateMBMessageAddon(newMessageAddon);
		
		messageAddon.setStatus(MBMessageStatusType.ARCHIVED_MESSAGE.name());
		MBMessageAddonLocalServiceUtil.updateMBMessageAddon(messageAddon);
		
		moderatorManager.sendNewMessageNotyfication(newMessage);
		
		logger.info("[UserId: " + newMessage.getUserId() + "] Adding message: " + newMessage.getMessageId() + " in thread: "
				+ newMessage.getThreadId() + " on license: " + newMessageAddon.getLicenseType() + ". Body: " + newMessage.getBody());	
		
		return newMessage;
	}
	
	
	private long countDaysDiff(String dateFrom, String dateTo, String dateToHHmm) throws Exception {
		Calendar calDateFrom = Calendar.getInstance();
		Calendar calDateTo = Calendar.getInstance();
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat sdfHHmm = new SimpleDateFormat("dd-MM-yyyy HH:mm");
		
		calDateFrom.setTime(sdf.parse(dateFrom));
		calDateTo.setTime(sdfHHmm.parse(dateTo + " " + dateToHHmm));
		
		long diff = calDateTo.getTimeInMillis() - calDateFrom.getTimeInMillis();
		long diffDays = diff / (24 * 60 * 60 * 1000);
		
		return diffDays;
	}
	
	private void validate(
			String subject, String signature, String discussionArea, String territory, long diffDays
			) throws MessageValidationException {
		if (subject.length() > MAX_SUBJECT_FIELD_LENGTH) {
			throw new TooLongSubjectFieldValueException();
		}
		
		if (signature.length() > MAX_SIGNATURE_FIELD_LENGTH) {
			throw new TooLongSignatureFieldValueException();
		}
		
		if (discussionArea.length() > MAX_DISCUSSION_AREA_FIELD_LENGTH) {
			throw new TooLongDiscussionAreaFieldValueException();
		} 
		
		if (territory.length() > MAX_TERRITORY_FIELD_LENGTH) {
			throw new TooLongTerritoryFieldValueException();
		}
		
		if (diffDays < MIN_CONSULTATION_DURATION) {
			throw new TooShortDurationException();
		}
	}
}
	