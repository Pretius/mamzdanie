package pl.mamzdanie.manager.impl;

import java.util.Locale;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import org.apache.log4j.Logger;
import org.stringtemplate.v4.ST;
import org.stringtemplate.v4.STGroup;
import org.stringtemplate.v4.STGroupFile;

import com.liferay.mail.service.MailService;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.mail.MailMessage;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portlet.messageboards.model.MBMessage;
import com.liferay.portlet.messageboards.service.MBMessageLocalServiceUtil;

import pl.mamzdanie.manager.ModeratorManager;
import pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon;

public class ModeratorManagerImpl implements ModeratorManager {
	
	private Logger logger = Logger.getLogger(ModeratorManagerImpl.class);
	
	private MailService mailService;
	
	private String appVersion;
	
	private String applicationServerBaseUrl;
	

	public void sendNewMessageNotyfication(MBMessage message)
			throws Exception {
		
		String subject = LanguageUtil.format(new Locale("pl", "PL"), "new-message-in-thread-notify", message.getSubject());		
		
		String body = getSTNotifyMsgBodyForNewMessageInThread(
				applicationServerBaseUrl,
				message.getParentMessageId(),
				message.getSubject(),
				message.getUserName(),
				message.getBody(),
				message.getMessageId(),
				appVersion
		);
		
		MBMessage thread = MBMessageLocalServiceUtil.getMBMessage(message.getParentMessageId());
		User moderator = UserLocalServiceUtil.getUser(thread.getUserId());		
		sendMail(moderator.getEmailAddress(), subject, body);
	}

	public void sendRejectedMessageNotyfication(MBMessage message, MBMessageAddon messageAddon)
			throws Exception {
		
		User moderator = UserLocalServiceUtil.getUser(messageAddon.getIssuerId());
		
		String subject = LanguageUtil.format(new Locale("pl", "PL"), "rejected-message-in-thread-notify", message.getMessageId());		
		
		String body = getSTNotifyMsgBodyForRejectedMessageInThread(
				applicationServerBaseUrl,
				message.getCategoryId(),
				message.getParentMessageId(),
				message.getThreadId(),
				message.getSubject(),
				moderator.getFullName(),
				messageAddon.getComments(),
				message.getBody(),
				message.getMessageId(),
				appVersion
		);
		
		User author = UserLocalServiceUtil.getUser(message.getUserId());		
		sendMail(author.getEmailAddress(), subject, body);
	}
	
	public void sendInactivatedMessageNotyfication(MBMessage message, MBMessageAddon messageAddon)
			throws Exception {
		
		User moderator = UserLocalServiceUtil.getUser(messageAddon.getIssuerId());
		
		String subject = LanguageUtil.format(new Locale("pl", "PL"), "inactivated-message-in-thread-notify", message.getMessageId());		
		
		String body = getSTNotifyMsgBodyForInactivatedMessageInThread(
				applicationServerBaseUrl,
				message.getCategoryId(),
				message.getParentMessageId(),
				message.getThreadId(),
				message.getSubject(),
				moderator.getFullName(),
				messageAddon.getComments(),
				message.getBody(),
				appVersion
		);
		
		User author = UserLocalServiceUtil.getUser(message.getUserId());		
		sendMail(author.getEmailAddress(), subject, body);
	}
	
	private String getSTNotifyMsgBodyForNewMessageInThread(String host, Long parentMessageId, String threadTitle, String author, String messageBody, Long messageId, String appVersion) {
		STGroup group = new STGroupFile(getClass().getClassLoader().getResource("mailBodies.stg"), "UTF-8", '$', '$');
		ST st = group.getInstanceOf("notifyNewMessageInThread");
		st.add("host", host);
		st.add("parentMessageId", parentMessageId);
		st.add("threadTitle", threadTitle);
		st.add("author", author);
		st.add("messageBody", messageBody);
		st.add("messageId", messageId);
		st.add("appVersion", appVersion);
		
		return st.render();
	}
	
	private String getSTNotifyMsgBodyForRejectedMessageInThread(
			String host, Long categoryId, Long parentMessageId, Long threadId, String threadTitle, String moderator,
			String rejectedReasonBody,  String messageBody, Long messageId, String appVersion) {
		STGroup group = new STGroupFile(getClass().getClassLoader().getResource("mailBodies.stg"), "UTF-8", '$', '$');
		ST st = group.getInstanceOf("notifyRejectedMessageInThread");
		st.add("host", host);
		st.add("categoryId", categoryId);
		st.add("parentMessageId", parentMessageId);
		st.add("threadId", threadId);
		st.add("threadTitle", threadTitle);
		st.add("moderator", moderator);
		st.add("rejectedReasonBody", rejectedReasonBody);
		st.add("messageBody", messageBody);
		st.add("messageId", messageId);
		st.add("appVersion", appVersion);
		
		return st.render();
	}
	
	private String getSTNotifyMsgBodyForInactivatedMessageInThread(
			String host, Long categoryId, Long parentMessageId, Long threadId, String threadTitle, String moderator,
			String inactivatedReasonBody,  String messageBody, String appVersion) {
		STGroup group = new STGroupFile(getClass().getClassLoader().getResource("mailBodies.stg"), "UTF-8", '$', '$');
		ST st = group.getInstanceOf("notifyInactivatedMessageInThread");
		st.add("host", host);
		st.add("categoryId", categoryId);
		st.add("parentMessageId", parentMessageId);
		st.add("threadId", threadId);
		st.add("threadTitle", threadTitle);
		st.add("moderator", moderator);
		st.add("inactivatedReasonBody", inactivatedReasonBody);
		st.add("messageBody", messageBody);
		st.add("appVersion", appVersion);
		
		return st.render();
	}
	
	private void sendMail(String toS, String subject, String body) throws AddressException {
		InternetAddress from = new InternetAddress("info@mamzdanie.org.pl");
		InternetAddress to = new InternetAddress(toS);

		MailMessage message = new MailMessage(from, to, subject, body, true);

		logger.info("Sending mail to: " + to + ", subject: " + subject);
		mailService.sendEmail(message);
	}
	
	public MailService getMailService() {
		return mailService;
	}

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
	
	public String getAppVersion() {
		return appVersion;
	}
	
	public void setAppVersion(String appVersion) {
		this.appVersion = appVersion;
	}
	
	public String getApplicationServerBaseUrl() {
		return applicationServerBaseUrl;
	}
	
	public void setApplicationServerBaseUrl(String applicationServerBaseUrl) {
		this.applicationServerBaseUrl = applicationServerBaseUrl;
	}

}
