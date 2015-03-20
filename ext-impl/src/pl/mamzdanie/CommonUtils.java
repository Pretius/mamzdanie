package pl.mamzdanie;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.portlet.PortletURL;
import javax.portlet.RenderResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import pl.mamzdanie.threaddetail.svc.model.ThreadDetail;
import pl.mamzdanie.threaddetail.svc.service.ThreadDetailLocalServiceUtil;
import pl.mamzdanie.useraddon.svc.service.UserAddonLocalServiceUtil;

import com.caucho.quercus.lib.curl.HttpRequest;
import com.liferay.portal.PortalException;
import com.liferay.portal.SystemException;
import com.liferay.portal.kernel.dao.search.SearchContainer;
import com.liferay.portal.kernel.util.DateUtil;
import com.liferay.portal.kernel.util.FileUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.User;
import com.liferay.portal.security.auth.PrincipalException;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.messageboards.model.MBMessage;
import com.liferay.portlet.messageboards.service.MBMessageServiceUtil;

public class CommonUtils {

	public static <T> List<T> filter(List<?> source, Class<T> clazz) {
		if (source == null) {
			return null;
		}
		List<T> result = new ArrayList<T>();
		for (Object o : source) {
			if (clazz.isAssignableFrom(o.getClass())) {
				result.add((T) o);
			}
		}
		return result;
	}

	public static String manageUrl(String currenUrl, String path) {
		StringBuilder finalUrl = new StringBuilder();
		//if (currenUrl.contains("dev"))
		//	finalUrl.append("/dev");
		finalUrl.append("/web/guest");
		finalUrl.append(path);

		return finalUrl.toString();
	}

	public static String getStackTraceAsString(Exception exception) {
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		pw.print(" [ ");
		pw.print(exception.getClass().getName());
		pw.print(" ] ");
		pw.print(exception.getMessage());
		exception.printStackTrace(pw);
		return sw.toString();
	}

	public static PortletURL generateOrderByUrl(RenderResponse renderResponse, String paramName, String currParamName,
			boolean currAsc) {
		PortletURL returnURL = renderResponse.createRenderURL();
		returnURL.setParameter("orderByCol", paramName);

		boolean asc = false;
		if (paramName.equals(currParamName)) {
			asc = !currAsc;
		}

		returnURL.setParameter("orderByType", asc ? "asc" : "desc");

		return returnURL;
	}

	public static boolean isTechnicalAdmin(User u) {
		return isInRole(u, "Administrator");
	}

	public static boolean isEmiter(User u) {
		return isInRole(u, "EMITER");
	}

	public static boolean isConsultant(User u) {
		return isInRole(u, "CONSULTANT");
	}

	public static boolean isPerson(User u) {
		try {
			return UserAddonLocalServiceUtil.getUserAddon(u.getUserId()) == null;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean isInRole(User u, String roleName) {
		if (u == null)
			return false;
		List<Role> roles = u.getRoles();
		for (Role r : roles) {
			if (roleName.equals(r.getName())) {
				return true;
			}
		}
		return false;
	}

	public static void verifyAccessToMessage(HttpServletRequest request) throws PrincipalException {
		long messageId = ParamUtil.getLong(request, "messageId");

		User user;
		try {
			user = PortalUtil.getUser(request);
		} catch (Exception e) {
			throw new PrincipalException(e);
		}

		if (messageId == 0) {
			long parentMessageId = ParamUtil.getLong(request, "parentMessageId");

			if (parentMessageId == 0) {
				if (!(CommonUtils.isEmiter(user) || CommonUtils.isTechnicalAdmin(user)))
					throw new PrincipalException();
			} else {
				if (!(CommonUtils.isEmiter(user) || CommonUtils.isConsultant(user) || CommonUtils.isTechnicalAdmin(user)))
					throw new PrincipalException();

				boolean active = false;
				Long summaryId = null;
				boolean author = false;
				try {
					ThreadDetail threadDetail = ThreadDetailLocalServiceUtil.getThreadDetail(parentMessageId);
					active = threadDetail.getActive() == 1;
					summaryId = threadDetail.getSummaryId();
					author = threadDetail.getUserId() == user.getUserId();
				} catch (Exception e) {
					/*summary = true;*/
					summaryId = null;
				}

				if (!active)
					if (summaryId != null && !CommonUtils.isTechnicalAdmin(user))
						throw new PrincipalException();
					else if (summaryId == null && !author && !CommonUtils.isTechnicalAdmin(user))
						throw new PrincipalException();
			}
		}
	}

	public static boolean isActiveThread(long rootMessageId) {
		try {
			ThreadDetail threadDetail = ThreadDetailLocalServiceUtil.getThreadDetail(rootMessageId);
			return threadDetail.getActive() == 1;
		} catch (Exception e) {
			return false;
		}
	}

	public static boolean threadHasSummary(long rootMessageId) {
		try {
			ThreadDetail threadDetail = ThreadDetailLocalServiceUtil.getThreadDetail(rootMessageId);
			return threadDetail.getSummaryId() != null;
		} catch (Exception e) {
			return false;
		}
	}

	public static String getSummary(ThreadDetail threadDetail, String detailsUrl) {

		if (threadDetail.getSummaryId() != null)
			return "<a href=\"" + detailsUrl + threadDetail.getRootMessageId() + "#podsumowanie\">Zobacz</a>";
		else if (threadDetail.getQuantity() == 0)
			return "-";
		else {
			Calendar dateToCal = Calendar.getInstance();
			dateToCal.setTime(threadDetail.getDateTo());
			dateToCal.add(Calendar.DATE, 14);

			int left = DateUtil.getDaysBetween(new Date(), dateToCal.getTime(), TimeZone.getDefault());
			int after = DateUtil.getDaysBetween(dateToCal.getTime(), new Date(), TimeZone.getDefault());

			if (left >= 0 && after == 0)
				return "Do: " + left + ((left == 1) ? " dzień" : " dni");
			else
				return "Po: " + after + ((after == 1) ? " dzień" : " dni");
		}
	}

	public static void swapFileNames(String[] fileNames, String mainName) {
		if (StringUtils.isBlank(mainName))
			return;

		String[] newFileNames = new String[fileNames.length];

		int add = 1;
		for (int i = 0; i < fileNames.length; i++) {
			if (FileUtil.getShortFileName(fileNames[i]).equals(mainName)) {
				add = 0;
				newFileNames[0] = fileNames[i];
				continue;
			}
			newFileNames[i + add] = fileNames[i];
		}

		for (int i = 0; i < fileNames.length; i++)
			fileNames[i] = newFileNames[i];
	}

	public static List<User> getAdmins() throws PortalException, SystemException {
		Role adminRole = RoleLocalServiceUtil.getRole(10113L, "Administrator");
		long[] userIds = UserLocalServiceUtil.getRoleUserIds(adminRole.getRoleId());

		List<User> admins = new ArrayList<User>();
		for (long userId : userIds) {
			admins.add(UserLocalServiceUtil.getUser(userId));
		}

		return admins;
	}	
}
