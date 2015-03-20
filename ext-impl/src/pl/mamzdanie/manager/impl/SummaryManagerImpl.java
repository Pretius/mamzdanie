package pl.mamzdanie.manager.impl;

import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import org.apache.log4j.Logger;
import org.stringtemplate.v4.ST;
import org.stringtemplate.v4.STGroup;
import org.stringtemplate.v4.STGroupFile;

import pl.mamzdanie.CommonUtils;
import pl.mamzdanie.manager.SummaryManager;
import pl.mamzdanie.threaddetail.svc.model.ThreadDetail;
import pl.mamzdanie.threaddetail.svc.service.ThreadDetailLocalServiceUtil;

import com.liferay.mail.service.MailService;
import com.liferay.portal.kernel.bean.PortalBeanLocatorUtil;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.mail.MailMessage;
import com.liferay.portal.kernel.util.DateUtil;
import com.liferay.portal.kernel.util.PropsUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;

public class SummaryManagerImpl implements SummaryManager {

	private static final Logger logger = Logger.getLogger(SummaryManagerImpl.class);

	private MailService mailService;

	public void checkAllThreads() {
		try {
			logger.info("Executing all threads summary reminder");

			mailService = (MailService) PortalBeanLocatorUtil.locate("com.liferay.mail.service.MailService.impl");

			List<ThreadDetail> candidateThreads = ThreadDetailLocalServiceUtil.getSummaryRemindCandidates();

			for (ThreadDetail candidateThread : candidateThreads) {
				int daysBetween = DateUtil.getDaysBetween(candidateThread.getDateTo(), new Date(), TimeZone.getDefault());

				if (daysBetween == 1 || daysBetween == 7 || daysBetween >= 11) {
					logger.info("Thread: " + candidateThread.getThreadId() + " requires emiter notifcation");

					User user = UserLocalServiceUtil.getUser(candidateThread.getUserId());
					String subject = LanguageUtil
							.format(new Locale("pl", "PL"), "reminder-subject", candidateThread.getSubject());
					String address = PropsUtil.get("message.url.prefix") + candidateThread.getRootMessageId();
					String body = getSTEmiterReminderBody(address, address);

					sendMail(user.getEmailAddress(), subject, body);
					if (daysBetween >= 11) {
						body = LanguageUtil.format(new Locale("pl", "PL"), "admin-reminder",
								new String[] { candidateThread.getUsername(), candidateThread.getSubject() });

						List<User> admins = CommonUtils.getAdmins();
						for (User admin : admins)
							sendMail(admin.getEmailAddress(), subject, body);
					}
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	private String getSTEmiterReminderBody(String boardAddress, String summaryAddress) {
		STGroup group = new STGroupFile(getClass().getClassLoader().getResource("mailBodies.stg"), "UTF-8", '$', '$');
		ST st = group.getInstanceOf("summaryReminder");
		st.add("boardAddress", boardAddress);
		st.add("summaryAddress", summaryAddress);

		return st.render();
	}

	private void sendMail(String toS, String subject, String body) throws AddressException {
		InternetAddress from = new InternetAddress("info@mamzdanie.org.pl");
		InternetAddress to = new InternetAddress(toS);
		// InternetAddress to = new InternetAddress("rolejnik@pretius.com");

		MailMessage message = new MailMessage(from, to, subject, body, true);

		logger.info("Sending mail to: " + to + ", subject: " + subject);
		mailService.sendEmail(message);
	}

}
