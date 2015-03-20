package pl.mamzdanie.editaccount.action;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import pl.mamzdanie.useraddon.svc.NoSuchUserAddonException;
import pl.mamzdanie.useraddon.svc.model.UserAddon;
import pl.mamzdanie.useraddon.svc.service.UserAddonLocalServiceUtil;

import com.liferay.portal.kernel.bean.BeanParamUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.security.auth.PrincipalException;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.struts.PortletAction;
import com.liferay.portal.util.PortalUtil;

public class EditAccountViewAction extends PortletAction {

	private static final Logger logger = Logger.getLogger(EditAccountViewAction.class);

	@Override
	public ActionForward render(ActionMapping mapping, ActionForm form, PortletConfig portletConfig, RenderRequest renderRequest,
			RenderResponse renderResponse) throws Exception {

		User user = PortalUtil.getUser(renderRequest);
		if (user == null)
			throw new PrincipalException();

		UserAddon userAddon = (UserAddon) renderRequest.getAttribute("userAddon");
		if (userAddon == null) {
			try {
				userAddon = UserAddonLocalServiceUtil.getUserAddon(user.getUserId());
				renderRequest.setAttribute("userAddon", userAddon);
			} catch (NoSuchUserAddonException e) {
				userAddon = null;
			}
		}

		return new ActionForward("p.edit_account.view");
	}

	@Override
	public void processAction(ActionMapping mapping, ActionForm form, PortletConfig portletConfig, ActionRequest actionRequest,
			ActionResponse actionResponse) throws Exception {
		if (!PortalUtil.isMethodPost(actionRequest)) {
			return;
		}

		User user = PortalUtil.getUser(actionRequest);
		if (user == null)
			throw new PrincipalException();

		Boolean notify = ParamUtil.getBoolean(actionRequest, "notify");

		String firstName = ParamUtil.getString(actionRequest, "firstName");
		String lastName = ParamUtil.getString(actionRequest, "lastName");
		String emailAddress = ParamUtil.getString(actionRequest, "emailAddress");
		String phone = ParamUtil.getString(actionRequest, "phone");
		String companyPosition = ParamUtil.getString(actionRequest, "companyPosition");
		String description = ParamUtil.getString(actionRequest, "description");
		
		UserAddon userAddon;
		boolean isUserAddonExist;
		
		try {
			userAddon = UserAddonLocalServiceUtil.getUserAddon(user.getUserId());
			isUserAddonExist = true;
		} catch (NoSuchUserAddonException e) {
			userAddon = null;
			isUserAddonExist = false;
		}		
		
		String deleteAccountAnswer = ParamUtil.getString(actionRequest, "deleteAccountAnswer");		
		boolean deleteAccount = deleteAccountAnswer != null && deleteAccountAnswer.equalsIgnoreCase("TAK");
		
		System.out.println(String.format("delete account: %s", deleteAccount));
		
		if (deleteAccount) {
			/*
			 * Account will be deleted for the end-user, in db flag active will be switched off.
			 * */
			user.setActive(false);
			UserLocalServiceUtil.updateUser(user);
			
			System.out.println(String.format("user updated - is active: %s", user.isActive()));
			
			actionResponse.sendRedirect("/c/portal/logout");
		} else {
			boolean userAddonUpdated = false;
			boolean userUpdated = false;
				
			if (isUserAddonExist) {
				if (userAddon != null && userAddon.getNotify() == null || userAddon.getNotify().booleanValue() != notify) {
					userAddon.setNotify(notify);
					userAddonUpdated = true;
				}
				
				if (userAddon.getPhone() == null || !userAddon.getPhone().equals(phone)) {
					userAddon.setPhone(phone);
					userAddonUpdated = true;
				}
				
				if (userAddon.getPosition() == null || !userAddon.getPosition().equals(companyPosition)) {
					userAddon.setPosition(companyPosition);
					userAddonUpdated = true;
				}
				
				if (userAddon.getDescription() == null || !userAddon.getDescription().equals(description)) {
					userAddon.setDescription(description);
					userAddonUpdated = true;
				}
			}
			
			
			if (user.getFirstName() == null || !user.getFirstName().equals(firstName)) {
				user.setFirstName(firstName);
				userUpdated = true;
			}
			
			if (user.getLastName() == null || !user.getLastName().equals(lastName)) {
				user.setLastName(lastName);
				userUpdated = true;
			}
			
			if (user.getEmailAddress() == null || !user.getEmailAddress().equals(emailAddress)) {
				user.setEmailAddress(emailAddress);
				userUpdated = true;
			}
			
			
			if (isUserAddonExist && userAddonUpdated) {
				UserAddonLocalServiceUtil.updateUserAddon(userAddon);
			}
			
			if (userUpdated) {
				UserLocalServiceUtil.updateUser(user);
			}
			
			System.out.println(String.format("user - is active: %s", user.isActive()));
			
			setForward(actionRequest, "success");
		}
	}
}