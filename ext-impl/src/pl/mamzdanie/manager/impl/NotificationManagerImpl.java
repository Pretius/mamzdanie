package pl.mamzdanie.manager.impl;

import java.util.List;
import java.util.Locale;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import org.apache.log4j.Logger;
import org.stringtemplate.v4.ST;
import org.stringtemplate.v4.STGroup;
import org.stringtemplate.v4.STGroupFile;

import pl.mamzdanie.CommonUtils;
import pl.mamzdanie.manager.NotificationManager;
import pl.mamzdanie.threaddetail.svc.model.ThreadDetail;
import pl.mamzdanie.threaddetail.svc.service.ThreadDetailLocalServiceUtil;
import pl.mamzdanie.useraddon.svc.service.UserAddonLocalServiceUtil;

import com.liferay.mail.service.MailService;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.mail.MailMessage;
import com.liferay.portal.kernel.util.PropsUtil;
import com.liferay.portal.model.User;
import com.liferay.portlet.messageboards.model.MBMessage;

public class NotificationManagerImpl implements NotificationManager {

	private Logger logger = Logger.getLogger(NotificationManagerImpl.class);

	private MailService mailService;

	public void sendOnNewMessage(MBMessage message) throws Exception {
		List<User> notifyUsers = CommonUtils.getAdmins();

		String subject = LanguageUtil.format(new Locale("pl", "PL"), "new-message-notify", null);
		String body = getSTNotifyMsgBody(message.getSubject(), PropsUtil.get("message.url.prefix") + message.getMessageId());

		for (User notifyUser : notifyUsers) {
			sendMail(notifyUser.getEmailAddress(), subject, body);
		}
		sendMail("mamzdanie@pretius.com", subject, body);
	}

	public String getSTNotifyMsgBody(String subject, String boardAddress) {
		STGroup group = new STGroupFile(getClass().getClassLoader().getResource("mailBodies.stg"), "UTF-8", '$', '$');
		ST st = group.getInstanceOf("notifyMessage");
		st.add("name", subject);
		st.add("boardAddress", boardAddress);

		return st.render();
	}

	public void sendOnNewNotAcceptedThread(MBMessage message) throws Exception {
		List<User> notifyUsers = CommonUtils.getAdmins();

		ThreadDetail threadDetail = ThreadDetailLocalServiceUtil.getThreadDetail(message.getMessageId());

		String subject = LanguageUtil.format(new Locale("pl", "PL"), "new-thread-notify-to-acceptation", new String[] { message.getSubject() });
		String body = getSTNotifyThreadToAcceptationBody(message.getSubject(), threadDetail.getOrganizationName(), threadDetail.getUsername(),
				PropsUtil.get("message.url.prefix") + message.getMessageId());

		for (User notifyUser : notifyUsers) {
			sendMail(notifyUser.getEmailAddress(), subject, body);
		}
	}
	
	public void sendOnNewThread(MBMessage message) throws Exception {
		List<User> notifyUsers = UserAddonLocalServiceUtil.findByNotifyFlag(true);

		ThreadDetail threadDetail = ThreadDetailLocalServiceUtil.getThreadDetail(message.getMessageId());

		String subject = LanguageUtil.format(new Locale("pl", "PL"), "new-thread-notify", new String[] { message.getSubject() });
		String body = getSTNotifyThreadBody(message.getSubject(), threadDetail.getOrganizationName(), threadDetail.getUsername(),
				PropsUtil.get("message.url.prefix") + message.getMessageId());

		for (User notifyUser : notifyUsers) {
			sendMail(notifyUser.getEmailAddress(), subject, body);
		}
	}

	public String getSTNotifyThreadBody(String subject, String organizationName, String userName, String boardAddress) {
		STGroup group = new STGroupFile(getClass().getClassLoader().getResource("mailBodies.stg"), "UTF-8", '$', '$');
		ST st = group.getInstanceOf("notifyThread");
		st.add("name", subject);
		st.add("organizationName", organizationName);
		st.add("userName", userName);
		st.add("boardAddress", boardAddress);

		return st.render();
	}
	
	public String getSTNotifyThreadToAcceptationBody(String subject, String organizationName, String userName, String boardAddress) {
		STGroup group = new STGroupFile(getClass().getClassLoader().getResource("mailBodies.stg"), "UTF-8", '$', '$');
		ST st = group.getInstanceOf("notifyThreadToAcceptation");
		st.add("name", subject);
		st.add("organizationName", organizationName);
		st.add("userName", userName);
		st.add("boardAddress", boardAddress);

		return st.render();
	}

	private void sendMail(String toS, String subject, String body) throws AddressException {
		InternetAddress from = new InternetAddress("info@mamzdanie.org.pl");
		InternetAddress to = new InternetAddress(toS);
		// InternetAddress to = new InternetAddress("krostkowski@pretius.com");

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
}
