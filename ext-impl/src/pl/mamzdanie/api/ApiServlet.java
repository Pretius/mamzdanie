package pl.mamzdanie.api;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import pl.mamzdanie.CommonUtils;
import pl.mamzdanie.MZException;
import pl.mamzdanie.api.wrapper.ErrorWrapper;
import pl.mamzdanie.api.wrapper.ThreadWrapper;
import pl.mamzdanie.api.wrapper.ThreadsWrapper;
import pl.mamzdanie.api.wrapper.UserAddonWrapper;
import pl.mamzdanie.api.wrapper.UserOrganizationWrapper;
import pl.mamzdanie.manager.SummaryManager;
import pl.mamzdanie.mbthreadaddon.svc.model.MBAddon;
import pl.mamzdanie.mbthreadaddon.svc.service.MBAddonLocalServiceUtil;
import pl.mamzdanie.threaddetail.svc.model.ThreadDetail;
import pl.mamzdanie.threaddetail.svc.service.ThreadDetailLocalServiceUtil;
import pl.mamzdanie.useraddon.svc.model.UserAddon;
import pl.mamzdanie.useraddon.svc.service.UserAddonLocalServiceUtil;
import pl.mamzdanie.userorganization.svc.model.UserOrganization;
import pl.mamzdanie.userorganization.svc.service.UserOrganizationLocalServiceUtil;

import com.liferay.portal.SystemException;
import com.liferay.portal.kernel.bean.PortalBeanLocatorUtil;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.util.FileUtil;
import com.liferay.portal.kernel.util.PropsUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portlet.messageboards.model.MBMessage;
import com.liferay.portlet.messageboards.service.MBMessageLocalServiceUtil;
import com.thoughtworks.xstream.XStream;

public class ApiServlet extends HttpServlet {

	private final String apiKeyParam = "api_key";
	private final String methodParam = "method";

	private final String idParam = "id";

	private final String getConsultationsMethod = "get_consultations";
	private final String activeParam = "active";

	private final String getConsultationDetailsMethod = "get_consultation_details";

	private final String getEmiterMethod = "get_emiter";
	private final String getOrganizationMethod = "get_organization";

	private Logger logger = Logger.getLogger(ApiServlet.class);

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if ("synchronize".equals(req.getParameter("synchronize"))) {
			SummaryManager summaryManager = (SummaryManager) PortalBeanLocatorUtil.locate("summaryManager");
			summaryManager.checkAllThreads();
		}
		logRequest(req);

		try {
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/xml");

			String apiKey = req.getParameter(apiKeyParam);

			if (apiKey == null || apiKey.length() != 32) {
				throw new MZException("101");
			}

			UserAddon userAddon = UserAddonLocalServiceUtil.findByApiKey(apiKey);
			if (userAddon == null)
				throw new MZException("102");

			String method = req.getParameter(methodParam);
			if (StringUtils.isNotBlank(method)) {
				if (getConsultationsMethod.equals(method)) {
					boolean active = true;
					if ("false".equals(req.getParameter(activeParam)))
						active = false;

					apiLog(userAddon, method, new String[] { "active", String.valueOf(active) });

					List<ThreadDetail> threadDetails = ThreadDetailLocalServiceUtil.getThreadDetails(active, 0,
							Integer.MAX_VALUE, "dateFrom", false, null, false);

					getXStreamXmlForThreadsList(threadDetails, resp);
				} else if (getConsultationDetailsMethod.equals(method)) {
					Long id = getId(req);

					apiLog(userAddon, method, new String[] { "id", String.valueOf(id) });

					if (id == null)
						throw new MZException("103");

					ThreadDetail threadDetail = ThreadDetailLocalServiceUtil.getThreadDetail(id);
					if (threadDetail == null || !threadDetail.getAccepted())
						throw new MZException("104");

					MBMessage message = MBMessageLocalServiceUtil.getMBMessage(id);
					MBAddon threadAddon = MBAddonLocalServiceUtil.getMBAddon(message.getThreadId());

					getXStreamXmlForThreadDetails(threadDetail, message, threadAddon, resp);
				} else if (getEmiterMethod.equals(method)) {
					Long id = getId(req);

					apiLog(userAddon, method, new String[] { "id", String.valueOf(id) });

					if (id == null)
						throw new MZException("103");

					User user = getUser(id);
					if (user == null)
						throw new MZException("105");

					UserAddon userAddonDet = getUserAddon(id);
					UserOrganization userOrganization = null;
					if (userAddonDet != null) {
						if (userAddonDet.getOrganizationId() != null)
							userOrganization = UserOrganizationLocalServiceUtil.getUserOrganization(userAddonDet
									.getOrganizationId());
					}

					getXStreamXmlForEmiter(user, userAddonDet, userOrganization, resp);
				} else if (getOrganizationMethod.equals(method)) {
					Long id = getId(req);

					apiLog(userAddon, method, new String[] { "id", String.valueOf(id) });

					if (id == null)
						throw new MZException("103");

					UserOrganization userOrganization = getUserOrganization(id);
					if (userOrganization == null)
						throw new MZException("106");

					getXmlStreamForOrganization(userOrganization, resp);
				} else
					throw new MZException("107");
			} else
				throw new MZException("107");
		} catch (MZException me) {
			logger.error(me.getMessage(), me);
			getXmlStreamForError(me.getMessage(), resp);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			getXmlStreamForError("500", resp);
		}
	}

	private Long getId(HttpServletRequest req) {
		Long id = null;
		String idS = req.getParameter(idParam);
		try {
			return Long.parseLong(idS);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return id;
	}

	private void getXmlStreamForError(String errorCode, HttpServletResponse resp) {
		try {
			XStream xstream = new XStream();

			ErrorWrapper errorWrapper = new ErrorWrapper();
			errorWrapper.setErrorDate(new Date());
			errorWrapper.setErrorCode(errorCode);
			errorWrapper.setErrorMsg(LanguageUtil.get(new Locale("pl", "PL"), "apiCode" + errorCode));

			xstream.alias("error", ErrorWrapper.class);
			xstream.registerConverter(new DateTypeConverter("dd-MM-yyyy HH:mm:ss"));

			xstream.toXML(errorWrapper, resp.getOutputStream());
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	private User getUser(Long id) {
		User user = null;
		try {
			user = UserLocalServiceUtil.getUser(id);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return user;
	}

	private UserAddon getUserAddon(Long id) {
		UserAddon userAddon = null;
		try {
			userAddon = UserAddonLocalServiceUtil.getUserAddon(id);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return userAddon;
	}

	private UserOrganization getUserOrganization(Long id) {
		UserOrganization userOrganization = null;
		try {
			userOrganization = UserOrganizationLocalServiceUtil.getUserOrganization(id);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return userOrganization;
	}

	public void getXStreamXmlForThreadsList(List<ThreadDetail> threadDetails, HttpServletResponse resp) throws IOException {
		XStream xstream = new XStream();

		ThreadsWrapper threadsWrapper = convertThreadDetailsList(threadDetails);

		xstream.alias("consultations", ThreadsWrapper.class);
		xstream.alias("consultation", ThreadWrapper.class);
		xstream.alias("dateFrom", Date.class, Timestamp.class);
		xstream.addImplicitCollection(ThreadsWrapper.class, "threadWrappers");
		xstream.registerConverter(new DateTypeConverter("dd-MM-yyyy HH:mm"));

		xstream.toXML(threadsWrapper, resp.getOutputStream());
	}

	private void getXStreamXmlForThreadDetails(ThreadDetail threadDetail, MBMessage message, MBAddon threadAddon,
			HttpServletResponse resp) throws IOException, SystemException {
		XStream xstream = new XStream();

		xstream.alias("consultation", ThreadWrapper.class);
		xstream.alias("dateFrom", Date.class, Timestamp.class);
		xstream.alias("tag", String.class);
		xstream.registerConverter(new DateTypeConverter("dd-MM-yyyy HH:mm"));
		xstream.addImplicitCollection(Attachments.class, "attachments", "attachment", String.class);

		ThreadWrapper threadWrapper = getThreadWrapper(threadDetail);
		addThreadDetails(threadWrapper, message, threadAddon);

		xstream.toXML(threadWrapper, resp.getOutputStream());
	}

	private ThreadsWrapper convertThreadDetailsList(List<ThreadDetail> threadDetails) {
		ThreadsWrapper threadsWrapper = new ThreadsWrapper();
		List<ThreadWrapper> threadWrappers = new ArrayList<ThreadWrapper>();

		for (ThreadDetail threadDetail : threadDetails) {
			threadWrappers.add(getThreadWrapper(threadDetail));
		}

		threadsWrapper.setThreadWrappers(threadWrappers);

		return threadsWrapper;
	}

	private ThreadWrapper getThreadWrapper(ThreadDetail threadDetail) {
		ThreadWrapper threadWrapper = new ThreadWrapper();

		threadWrapper.setSignature(threadDetail.getSignature());
		threadWrapper.setSubject(threadDetail.getSubject());
		threadWrapper.setUserName(threadDetail.getUsername());
		threadWrapper.setUserId(threadDetail.getUserId());
		threadWrapper.setDateFrom(threadDetail.getDateFrom());
		threadWrapper.setDateTo(threadDetail.getDateTo());
		threadWrapper.setReplies(threadDetail.getQuantity());
		threadWrapper.setId(threadDetail.getRootMessageId());
		threadWrapper.setActive(threadDetail.isAccepted());
		threadWrapper.setOrganizationId(threadDetail.getOrganizationId());
		threadWrapper.setOrganizationName(threadDetail.getOrganizationName());

		try {
			threadWrapper.setUrl(PropsUtil.get("message.url.prefix") + threadDetail.getRootMessageId());
		} catch (Exception e) {
		}

		return threadWrapper;
	}

	private void addThreadDetails(ThreadWrapper threadWrapper, MBMessage message, MBAddon threadAddon) throws SystemException {
		threadWrapper.setDescription(message.getBody());

		List<String> allAttachments = getAttachments(message, threadAddon);
		Attachments attachments = new Attachments();
		attachments.setAttachments(allAttachments);

		threadWrapper.setAttachments(attachments);
		if (allAttachments.size() > 0) {
			threadWrapper.setMainAttachment(allAttachments.get(0));
			allAttachments.remove(0);
		} else
			threadWrapper.setMainAttachment("");

		threadWrapper.setTags(message.getTagsEntries());
		threadWrapper.setDiscussionArea(threadAddon.getDiscussionArea());
		threadWrapper.setTerritoryScope(threadAddon.getTerritory());
	}

	private List<String> getAttachments(MBMessage message, MBAddon threadAddon) {
		String[] attachments;
		try {
			attachments = message.getAttachmentsFiles();
			CommonUtils.swapFileNames(attachments, threadAddon.getMainAttachment());
		} catch (Exception e) {
			return null;
		}
		List<String> result = new ArrayList<String>();

		for (int i = 0; i < attachments.length; i++) {
			try {
				result.add(PropsUtil.get("attachment.url.prefix") + message.getMessageId() + "&_19_attachment="
						+ FileUtil.getShortFileName(attachments[i]));
			} catch (Exception e) {
			}
		}

		return result;
	}

	private void getXStreamXmlForEmiter(User user, UserAddon userAddonDet, UserOrganization userOrganization,
			HttpServletResponse resp) throws IOException {
		XStream xstream = new XStream();

		UserAddonWrapper UserAddonWrapper = getUserAddonWrapper(user, userAddonDet, userOrganization);

		xstream.alias("user", UserAddonWrapper.class);

		xstream.toXML(UserAddonWrapper, resp.getOutputStream());
	}

	private UserAddonWrapper getUserAddonWrapper(User user, UserAddon userAddonDet, UserOrganization userOrganization) {
		UserAddonWrapper userAddonWrapper = new UserAddonWrapper();

		userAddonWrapper.setUserId(user.getUserId());
		userAddonWrapper.setUserName(user.getFullName());
		if (userOrganization != null) {
			userAddonWrapper.setOrganizationId(userOrganization.getId());
			userAddonWrapper.setOrganizationName(userOrganization.getName());
			userAddonWrapper.setOrganizationPosition(userAddonDet.getPosition());
		}

		return userAddonWrapper;
	}

	private void getXmlStreamForOrganization(UserOrganization userOrganization, HttpServletResponse resp) throws IOException {
		XStream xstream = new XStream();

		UserOrganizationWrapper userOrganizationWrapper = getUserOrganizationWrapper(userOrganization);

		xstream.alias("organization", UserOrganizationWrapper.class);

		xstream.toXML(userOrganizationWrapper, resp.getOutputStream());
	}

	private UserOrganizationWrapper getUserOrganizationWrapper(UserOrganization userOrganization) {
		UserOrganizationWrapper userOrganizationWrapper = new UserOrganizationWrapper();

		userOrganizationWrapper.setOrganizationId(userOrganization.getId());
		userOrganizationWrapper.setOrganizationName(userOrganization.getName());
		userOrganizationWrapper.setAddress(userOrganization.getAddress());
		userOrganizationWrapper.setPostalCode(userOrganization.getPostalCode());
		userOrganizationWrapper.setCity(userOrganization.getCity());
		userOrganizationWrapper.setPhone(userOrganization.getPhone());
		userOrganizationWrapper.setFax(userOrganization.getFax());

		return userOrganizationWrapper;
	}

	private void apiLog(UserAddon userAddon, String method, String[] params) {
		StringBuilder sb = new StringBuilder();
		sb.append("User: ");
		sb.append(userAddon.getUserId());
		sb.append(" (");
		sb.append(userAddon.getOrganizationId());
		sb.append(") ");
		sb.append(", method: ");
		sb.append(method);
		sb.append(", params: ");
		for (int i = 0; i < params.length; i += 2)
			sb.append("[" + params[i] + "," + params[i + 1] + "]");

		logger.info(sb.toString());
	}

	private void logRequest(HttpServletRequest req) {
		Enumeration paraNames = req.getParameterNames();

		StringBuilder sb = new StringBuilder("Got request: ");

		while (paraNames.hasMoreElements()) {
			String name = (String) paraNames.nextElement();
			String value = req.getParameter(name);

			sb.append("[" + name + "," + value + "] ");
		}

		logger.info(sb.toString());
	}
}
