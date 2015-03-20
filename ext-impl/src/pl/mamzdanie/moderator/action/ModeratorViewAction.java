package pl.mamzdanie.moderator.action;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import pl.mamzdanie.CommonUtils;
import pl.mamzdanie.manager.ModeratorManager;
import pl.mamzdanie.mbmessageaddon.svc.MBMessageStatusType;
import pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon;
import pl.mamzdanie.mbmessageaddon.svc.service.MBMessageAddonLocalServiceUtil;

import com.liferay.documentlibrary.FileNameException;
import com.liferay.documentlibrary.FileSizeException;
import com.liferay.portal.kernel.bean.PortalBeanLocatorUtil;
import com.liferay.portal.kernel.captcha.CaptchaTextException;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.Constants;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.security.auth.PrincipalException;
import com.liferay.portal.struts.PortletAction;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.messageboards.EmptyFieldException;
import com.liferay.portlet.messageboards.MessageBodyException;
import com.liferay.portlet.messageboards.MessageSubjectException;
import com.liferay.portlet.messageboards.MessageValidationException;
import com.liferay.portlet.messageboards.NoSuchMessageException;
import com.liferay.portlet.messageboards.RequiredMessageException;
import com.liferay.portlet.messageboards.model.MBMessage;
import com.liferay.portlet.messageboards.service.MBMessageLocalServiceUtil;
import com.liferay.portlet.tags.TagsEntryException;

public class ModeratorViewAction extends PortletAction {

	private static final Logger logger = Logger.getLogger(ModeratorViewAction.class);

	@Override
	public ActionForward render(ActionMapping mapping, ActionForm form, PortletConfig portletConfig, RenderRequest renderRequest,
			RenderResponse renderResponse) throws Exception {

		ActionForward actionForward;
		
		String cmd = ParamUtil.getString(renderRequest, Constants.CMD);
		String typeMode = ParamUtil.getString(renderRequest, "typeMode");
		
		if (cmd != null && !cmd.isEmpty()) {
			actionForward = processRequest(cmd, mapping, form, portletConfig, renderRequest, renderResponse);
		} else {
			actionForward = new ActionForward("p.moderator.view");
		}
		
		renderRequest.setAttribute("moderatorPortletView", "true");
		renderRequest.setAttribute("typeMode", typeMode);
		
		return actionForward;
	}
	
	private ActionForward processRequest(String cmd, ActionMapping mapping, ActionForm form, PortletConfig portletConfig,
			RenderRequest request, RenderResponse response) throws Exception {

		ModeratorManager moderatorManager = (ModeratorManager) PortalBeanLocatorUtil.locate("moderatorManager");		
		Long messageId = ParamUtil.getLong(request, "messageId");
		String redirect = ParamUtil.getString(request, "redirect");
		
		ActionForward actionForward;
		
		if (logger.isDebugEnabled()) {
			logger.debug(String.format("cmd: %s", cmd));
			logger.debug(String.format("mesageId: %d", messageId));
			logger.debug(String.format("redirect: %s", redirect));
		}
		
		if (messageId == null) {
			SessionErrors.add(request, "moderator.error.messageId.notExist");
			setForward(request, "portlet.moderator.error");
			return new ActionForward("p.moderator.view");
		}

		try {
			CommonUtils.verifyAccessToMessage(PortalUtil.getHttpServletRequest(request));
			User user = PortalUtil.getUser(request);
			
			MBMessageAddon messageAddon = MBMessageAddonLocalServiceUtil.getMBMessageAddon(messageId);
			MBMessage message = MBMessageLocalServiceUtil.getMessage(messageAddon.getMessageId());
			
			boolean isMessageAddonEdited = false;
			
			if (cmd.equals(Constants.REJECT)) {
				if (logger.isInfoEnabled()) {
					logger.info(String.format("Message with id: %d is going to be rejected.", messageId));
				}		
				
				if (!CommonUtils.isTechnicalAdmin(user) && messageAddon.getIssuerId().longValue() != user.getUserId()) {
					throw new PrincipalException();
				}
				
				if (
						!messageAddon.getStatus().equals(MBMessageStatusType.NEW_MESSAGE.name())) {
					throw new PrincipalException();
				}
				
				String body = ParamUtil.getString(request, "body");
				messageAddon.setComments(body);
				messageAddon.setStatus(MBMessageStatusType.REJECTED_MESSAGE.name());
				
				moderatorManager.sendRejectedMessageNotyfication(message, messageAddon);
				
				isMessageAddonEdited = true;
				
				actionForward = new ActionForward("p.moderator.view");
			} else if (cmd.equals(Constants.APPROVE)) {
				if (logger.isInfoEnabled()) {
					logger.info(String.format("Message with id: %d is going to be approved.", messageId));
				}
				
				if (!CommonUtils.isTechnicalAdmin(user) && messageAddon.getIssuerId().longValue() != user.getUserId()) {
					throw new PrincipalException();
				}
				
				if (
						!messageAddon.getStatus().equals(MBMessageStatusType.REJECTED_MESSAGE.name()) &&
						!messageAddon.getStatus().equals(MBMessageStatusType.NEW_MESSAGE.name())
				) {
					throw new PrincipalException();
				}
				
				messageAddon.setStatus(MBMessageStatusType.APPROVED_MESSAGE.name());
				isMessageAddonEdited = true;
				
				actionForward = new ActionForward("p.moderator.view"); 
			} else if (cmd.equals("hide") || cmd.equals("show")) {
				if (!CommonUtils.isTechnicalAdmin(user) && messageAddon.getIssuerId().longValue() != user.getUserId()) {
					throw new PrincipalException();
				}
				
				if (cmd.equals("hide")) {
					if (logger.isInfoEnabled()) {
						logger.info(String.format("Message with id: %d is going to be hidden.", messageId));
					}
					messageAddon.setVisible(false);
				} else {
					if (logger.isInfoEnabled()) {
						logger.info(String.format("Message with id: %d is going to be visibled.", messageId));
					}
					messageAddon.setVisible(true);
				}
				isMessageAddonEdited = true;
				
				actionForward = new ActionForward("p.mainpage.view");
			} else if (cmd.equals(Constants.VIEW)) {				
				if (!CommonUtils.isTechnicalAdmin(user) && messageAddon.getIssuerId().longValue() != user.getUserId()) {
					throw new PrincipalException();
				}
				
				request.setAttribute("mbMessageAddon", messageAddon);
				request.setAttribute("prevUrl", redirect);
				
				actionForward = new ActionForward("p.moderator.message");
			} else if (cmd.equals("active")) {
				if (!CommonUtils.isTechnicalAdmin(user) && messageAddon.getIssuerId().longValue() != user.getUserId()) {
					throw new PrincipalException();
				}
				
				if (logger.isInfoEnabled()) {
					logger.info(String.format("Message with id: %d is going to be inactive.", messageId));
				}
				messageAddon.setActive(true);
				messageAddon.setComments("");
				isMessageAddonEdited = true;  
				actionForward = new ActionForward("p.moderator.view");
			} else if (cmd.equals("commentAndReject")) {
				if (!CommonUtils.isTechnicalAdmin(user) && messageAddon.getIssuerId().longValue() != user.getUserId()) {
					throw new PrincipalException();
				}
				
				if (!messageAddon.getStatus().equals(MBMessageStatusType.NEW_MESSAGE.name())) {
					throw new PrincipalException();
				}
				
				request.setAttribute("cmd", cmd);
				request.setAttribute("mbMessageAddon", messageAddon);
				request.setAttribute("prevUrl", redirect);
				
				actionForward = new ActionForward("p.moderator.reject");				
			} else if (cmd.equals("commentAndInactive")) {
				if (!CommonUtils.isTechnicalAdmin(user) && messageAddon.getIssuerId().longValue() != user.getUserId()) {
					throw new PrincipalException();
				}
				
				request.setAttribute("cmd", cmd);
				request.setAttribute("mbMessageAddon", messageAddon);
				request.setAttribute("prevUrl", redirect);
				
				actionForward = new ActionForward("p.moderator.inactive");				
			} else {
				throw new PrincipalException();
			}
			
			if (isMessageAddonEdited) {
				MBMessageAddonLocalServiceUtil.updateMBMessageAddon(messageAddon);
			}
		} catch (Exception e) {
			if (e instanceof NoSuchMessageException || e instanceof PrincipalException || e instanceof RequiredMessageException) {

				SessionErrors.add(request, e.getClass().getName());

				setForward(request, "error");
			} else if (e instanceof CaptchaTextException || e instanceof FileNameException || e instanceof FileSizeException
					|| e instanceof MessageBodyException || e instanceof MessageSubjectException
					|| e instanceof EmptyFieldException || e instanceof MessageValidationException) {

				SessionErrors.add(request, e.getClass().getName());
			} else if (e instanceof TagsEntryException) {
				SessionErrors.add(request, e.getClass().getName(), e);
			} else {
				throw e;
			}
			actionForward = new ActionForward("p.moderator.view");
		}
		
		setForward(request, "success");
		
		return actionForward;
	}
	
	public void processAction(ActionMapping mapping, ActionForm form, PortletConfig portletConfig, ActionRequest request,
			ActionResponse response) throws Exception {
		
		ModeratorManager moderatorManager = (ModeratorManager) PortalBeanLocatorUtil.locate("moderatorManager");
		
		String cmd = ParamUtil.getString(request, Constants.CMD);
		String typeMode = ParamUtil.getString(request, "typeMode");		
				
		Long messageId = ParamUtil.getLong(request, "messageId");
		String redirect = ParamUtil.getString(request, "redirect");
		
		if (logger.isDebugEnabled()) {
			logger.debug(String.format("cmd: %s", cmd));
			logger.debug(String.format("mesageId: %d", messageId));
			logger.debug(String.format("redirect: %s", redirect));
		}
		
		if (messageId == null) {
			SessionErrors.add(request, "moderator.error.messageId.notExist");
			setForward(request, "portlet.moderator.error");
		}

		try {
			CommonUtils.verifyAccessToMessage(PortalUtil.getHttpServletRequest(request));
			User user = PortalUtil.getUser(request);
			
			MBMessageAddon messageAddon = MBMessageAddonLocalServiceUtil.getMBMessageAddon(messageId);
			MBMessage message = MBMessageLocalServiceUtil.getMessage(messageAddon.getMessageId());
			
			boolean isMessageAddonEdited = false;
			
			if (cmd.equals(Constants.REJECT)) {
				if (logger.isInfoEnabled()) {
					logger.info(String.format("Message with id: %d is going to be rejected.", messageId));
				}		
				
				if (!CommonUtils.isTechnicalAdmin(user) && messageAddon.getIssuerId().longValue() != user.getUserId()) {
					throw new PrincipalException();
				}
				
				if (
						!messageAddon.getStatus().equals(MBMessageStatusType.NEW_MESSAGE.name())) {
					throw new PrincipalException();
				}
				
				String body = ParamUtil.getString(request, "body");
				messageAddon.setComments(body);
				messageAddon.setStatus(MBMessageStatusType.REJECTED_MESSAGE.name());
				
				moderatorManager.sendRejectedMessageNotyfication(message, messageAddon);
				
				isMessageAddonEdited = true;
			} else if (cmd.equals(Constants.APPROVE)) {
				if (logger.isInfoEnabled()) {
					logger.info(String.format("Message with id: %d is going to be approved.", messageId));
				}
				
				if (!CommonUtils.isTechnicalAdmin(user) && messageAddon.getIssuerId().longValue() != user.getUserId()) {
					throw new PrincipalException();
				}
				
				if (
						!messageAddon.getStatus().equals(MBMessageStatusType.REJECTED_MESSAGE.name()) &&
						!messageAddon.getStatus().equals(MBMessageStatusType.NEW_MESSAGE.name())
				) {
					throw new PrincipalException();
				}
				
				messageAddon.setStatus(MBMessageStatusType.APPROVED_MESSAGE.name());
				isMessageAddonEdited = true; 
			} else if (cmd.equals("active")) {
				if (!CommonUtils.isTechnicalAdmin(user) && messageAddon.getIssuerId().longValue() != user.getUserId()) {
					throw new PrincipalException();
				}
				
				if (logger.isInfoEnabled()) {
					logger.info(String.format("Message with id: %d is going to be inactive.", messageId));
				}
				messageAddon.setActive(true);
				messageAddon.setComments("");
				isMessageAddonEdited = true;
			} else if (cmd.equals("inactive")) {
				if (logger.isInfoEnabled()) {
					logger.info(String.format("Message with id: %d is going to be inactivated.", messageId));
				}		
				
				if (!CommonUtils.isTechnicalAdmin(user) && messageAddon.getIssuerId().longValue() != user.getUserId()) {
					throw new PrincipalException();
				}
				
				String body = ParamUtil.getString(request, "body");
				messageAddon.setComments(body);
				messageAddon.setActive(false);
				
				moderatorManager.sendInactivatedMessageNotyfication(message, messageAddon);
				
				isMessageAddonEdited = true;
			} else {
				throw new PrincipalException();
			}
			
			if (isMessageAddonEdited) {
				MBMessageAddonLocalServiceUtil.updateMBMessageAddon(messageAddon);
			}
		} catch (Exception e) {
			if (e instanceof NoSuchMessageException || e instanceof PrincipalException || e instanceof RequiredMessageException) {

				SessionErrors.add(request, e.getClass().getName());

				setForward(request, "error");
			} else if (e instanceof CaptchaTextException || e instanceof FileNameException || e instanceof FileSizeException
					|| e instanceof MessageBodyException || e instanceof MessageSubjectException
					|| e instanceof EmptyFieldException || e instanceof MessageValidationException) {

				SessionErrors.add(request, e.getClass().getName());
			} else if (e instanceof TagsEntryException) {
				SessionErrors.add(request, e.getClass().getName(), e);
			} else {
				throw e;
			}
		}
		
		sendRedirect(request,  response, redirect);
	}
	
}
