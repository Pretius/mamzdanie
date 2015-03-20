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

package com.liferay.portlet.login.action;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.PortletURL;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Hex;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import pl.mamzdanie.MZConstants;
import pl.mamzdanie.exception.CompanyAddressException;
import pl.mamzdanie.exception.CompanyCityException;
import pl.mamzdanie.exception.CompanyNameException;
import pl.mamzdanie.exception.CompanyPostalCodeException;
import pl.mamzdanie.exception.NotAcceptRulesException;
import pl.mamzdanie.exception.PositionException;
import pl.mamzdanie.useraddon.svc.model.UserAddon;
import pl.mamzdanie.useraddon.svc.service.UserAddonLocalServiceUtil;
import pl.mamzdanie.userorganization.svc.model.UserOrganization;
import pl.mamzdanie.userorganization.svc.service.UserOrganizationLocalServiceUtil;

import com.liferay.counter.service.CounterLocalServiceUtil;
import com.liferay.portal.ContactFirstNameException;
import com.liferay.portal.ContactLastNameException;
import com.liferay.portal.DuplicateUserEmailAddressException;
import com.liferay.portal.DuplicateUserScreenNameException;
import com.liferay.portal.NoSuchLayoutException;
import com.liferay.portal.NoSuchOrganizationException;
import com.liferay.portal.OrganizationParentException;
import com.liferay.portal.PhoneNumberException;
import com.liferay.portal.PortalException;
import com.liferay.portal.RequiredUserException;
import com.liferay.portal.ReservedUserEmailAddressException;
import com.liferay.portal.ReservedUserScreenNameException;
import com.liferay.portal.SystemException;
import com.liferay.portal.UserEmailAddressException;
import com.liferay.portal.UserIdException;
import com.liferay.portal.UserPasswordException;
import com.liferay.portal.UserScreenNameException;
import com.liferay.portal.UserSmsException;
import com.liferay.portal.kernel.captcha.CaptchaTextException;
import com.liferay.portal.kernel.captcha.CaptchaUtil;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.util.Constants;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.model.Company;
import com.liferay.portal.model.CompanyConstants;
import com.liferay.portal.model.Layout;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.User;
import com.liferay.portal.security.auth.PrincipalException;
import com.liferay.portal.service.LayoutLocalServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.service.UserServiceUtil;
import com.liferay.portal.struts.PortletAction;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portal.util.PropsValues;
import com.liferay.portal.util.WebKeys;
import com.liferay.portlet.login.AccountType;
import com.liferay.portlet.login.util.LoginUtil;

/**
 * <a href="CreateAccountAction.java.html"><b><i>View Source</i></b></a>
 * 
 * @author Brian Wing Shun Chan
 * 
 */
public class CreateAccountAction extends PortletAction {

	private Logger logger = Logger.getLogger(CreateAccountAction.class);

	public void processAction(ActionMapping mapping, ActionForm form, PortletConfig portletConfig, ActionRequest actionRequest,
			ActionResponse actionResponse) throws Exception {

		String cmd = ParamUtil.getString(actionRequest, Constants.CMD);

		try {
			if (cmd.equals(Constants.ADD)) {
				addUser(actionRequest, actionResponse);
			}
		} catch (Exception e) {
			if (e instanceof CaptchaTextException || e instanceof ContactFirstNameException
					|| e instanceof ContactLastNameException || e instanceof DuplicateUserEmailAddressException
					|| e instanceof DuplicateUserScreenNameException || e instanceof NoSuchOrganizationException
					|| e instanceof OrganizationParentException || e instanceof RequiredUserException
					|| e instanceof ReservedUserEmailAddressException || e instanceof ReservedUserScreenNameException
					|| e instanceof UserEmailAddressException || e instanceof UserIdException
					|| e instanceof UserPasswordException || e instanceof UserScreenNameException
					|| e instanceof UserSmsException || e instanceof NotAcceptRulesException || e instanceof PhoneNumberException
					|| e instanceof PositionException || e instanceof CompanyNameException
					|| e instanceof CompanyAddressException || e instanceof CompanyPostalCodeException
					|| e instanceof CompanyCityException) {

				SessionErrors.add(actionRequest, e.getClass().getName(), e);
			} else {
				throw e;
			}
		}

		if (Validator.isNull(PropsValues.COMPANY_SECURITY_STRANGERS_URL)) {
			return;
		}

		ThemeDisplay themeDisplay = (ThemeDisplay) actionRequest.getAttribute(WebKeys.THEME_DISPLAY);

		try {
			Layout layout = LayoutLocalServiceUtil.getFriendlyURLLayout(themeDisplay.getScopeGroupId(), false,
					PropsValues.COMPANY_SECURITY_STRANGERS_URL);

			String redirect = PortalUtil.getLayoutURL(layout, themeDisplay);

			sendRedirect(actionRequest, actionResponse, redirect);
		} catch (NoSuchLayoutException nsle) {
		}
	}

	public ActionForward render(ActionMapping mapping, ActionForm form, PortletConfig portletConfig, RenderRequest renderRequest,
			RenderResponse renderResponse) throws Exception {

		Company company = PortalUtil.getCompany(renderRequest);

		if (!company.isStrangers()) {
			throw new PrincipalException();
		}

		ThemeDisplay themeDisplay = (ThemeDisplay) renderRequest.getAttribute(WebKeys.THEME_DISPLAY);

		renderResponse.setTitle(LanguageUtil.get(themeDisplay.getCompanyId(), themeDisplay.getLocale(), "create-account"));

		return mapping.findForward("portlet.login.create_account");
	}

	protected void addUser(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {

		HttpServletRequest request = PortalUtil.getHttpServletRequest(actionRequest);
		HttpSession session = request.getSession();

		ThemeDisplay themeDisplay = (ThemeDisplay) actionRequest.getAttribute(WebKeys.THEME_DISPLAY);

		Company company = themeDisplay.getCompany();

		boolean autoPassword = true;
		String password1 = null;
		String password2 = null;
		boolean autoScreenName = false;
		String screenName = ParamUtil.getString(actionRequest, "emailAddress");
		String emailAddress = ParamUtil.getString(actionRequest, "emailAddress");
		String openId = ParamUtil.getString(actionRequest, "openId");
		String firstName = ParamUtil.getString(actionRequest, "firstName");
		String middleName = ParamUtil.getString(actionRequest, "middleName");
		String lastName = ParamUtil.getString(actionRequest, "lastName");
		int prefixId = ParamUtil.getInteger(actionRequest, "prefixId");
		int suffixId = ParamUtil.getInteger(actionRequest, "suffixId");
		boolean male = ParamUtil.get(actionRequest, "male", true);
		int birthdayMonth = 1;
		int birthdayDay = 1;
		int birthdayYear = 1970;
		String jobTitle = ParamUtil.getString(actionRequest, "jobTitle");
		long[] groupIds = null;
		long[] organizationIds = null;
		long[] userGroupIds = null;
		boolean sendEmail = true;

		// additional data [KRS]
		String phone = ParamUtil.getString(actionRequest, "phone");
		String position = ParamUtil.getString(actionRequest, "position");
		String companyName = ParamUtil.getString(actionRequest, "company_name");
		String companyAddress = ParamUtil.getString(actionRequest, "company_address");
		String companyPostalCode = ParamUtil.getString(actionRequest, "company_postal_code");
		String companyCity = ParamUtil.getString(actionRequest, "company_city");
		String companyPhone = ParamUtil.getString(actionRequest, "company_phone");
		String companyFax = ParamUtil.getString(actionRequest, "company_fax");
		String companyMail = ParamUtil.getString(actionRequest, "company_email");
		AccountType accountType = AccountType.valueOf(ParamUtil.getString(actionRequest, "account_type"));
		String acceptRules = ParamUtil.getString(actionRequest, "accept_rules");

		long[] roleIds = getUserRoles(accountType);

		additionalValidate(emailAddress, phone, position, companyName, companyAddress, companyPostalCode, companyCity,
				companyPhone, companyFax, companyMail, accountType, acceptRules);

		ServiceContext serviceContext = ServiceContextFactory.getInstance(User.class.getName(), actionRequest);

		if (PropsValues.LOGIN_CREATE_ACCOUNT_ALLOW_CUSTOM_PASSWORD) {
			autoPassword = false;

			password1 = ParamUtil.getString(actionRequest, "password1");
			password2 = ParamUtil.getString(actionRequest, "password2");
		}

		boolean openIdPending = false;

		Boolean openIdLoginPending = (Boolean) session.getAttribute(WebKeys.OPEN_ID_LOGIN_PENDING);

		if ((openIdLoginPending != null) && (openIdLoginPending.booleanValue()) && (Validator.isNotNull(openId))) {

			sendEmail = false;
			openIdPending = true;
		}

		if (PropsValues.CAPTCHA_CHECK_PORTAL_CREATE_ACCOUNT) {
			CaptchaUtil.check(actionRequest);
		}

		User user = UserServiceUtil.addUser(company.getCompanyId(), autoPassword, password1, password2, autoScreenName,
				screenName, emailAddress, openId, themeDisplay.getLocale(), firstName, middleName, lastName, prefixId, suffixId,
				male, birthdayMonth, birthdayDay, birthdayYear, jobTitle, groupIds, organizationIds, roleIds, userGroupIds,
				sendEmail, serviceContext);
		UserLocalServiceUtil.updateAgreedToTermsOfUse(user.getUserId(), true);

		// additional data
		if (accountType == AccountType.CONSULTANT_COMPANY || accountType == AccountType.EMITER) {
			long userOrganizationId = CounterLocalServiceUtil.increment();
			UserOrganization userOrganization = UserOrganizationLocalServiceUtil.createUserOrganization(userOrganizationId);
			userOrganization.setAddress(companyAddress);
			userOrganization.setCity(companyCity);
			userOrganization.setPostalCode(companyPostalCode);
			userOrganization.setEmail(companyMail);
			userOrganization.setFax(companyFax);
			userOrganization.setName(companyName);
			userOrganization.setPhone(companyPhone);
			UserOrganizationLocalServiceUtil.updateUserOrganization(userOrganization);

			UserAddon userAddon = UserAddonLocalServiceUtil.createUserAddon(user.getUserId());
			userAddon.setPhone(phone);
			userAddon.setPosition(position);
			userAddon.setOrganizationId(userOrganizationId);
			userAddon.setApiKey(getRandomApiKey());
			UserAddonLocalServiceUtil.updateUserAddon(userAddon);
		}

		if (openIdPending) {
			session.setAttribute(WebKeys.OPEN_ID_LOGIN, new Long(user.getUserId()));

			session.removeAttribute(WebKeys.OPEN_ID_LOGIN_PENDING);
		} else {
			// Session messages
			SessionMessages.add(request, "user_added", user.getEmailAddress());
			SessionMessages.add(request, "user_added_password", user.getPasswordUnencrypted());
		}

		logger.info("Creating account: firstName" + firstName + ", lastName:" + lastName + ", email:" + emailAddress
				+ ", accountType: " + accountType);
		
		// Send redirect

		String login = null;

		if (company.getAuthType().equals(CompanyConstants.AUTH_TYPE_ID)) {
			login = String.valueOf(user.getUserId());
		} else if (company.getAuthType().equals(CompanyConstants.AUTH_TYPE_SN)) {
			login = user.getScreenName();
		} else {
			login = user.getEmailAddress();
		}

		PortletURL loginURL = LoginUtil.getLoginURL(request, themeDisplay.getPlid());

		loginURL.setParameter("login", login);

		String redirect = loginURL.toString();

		actionResponse.sendRedirect(redirect);
	}

	private String getRandomApiKey() throws UnsupportedEncodingException, NoSuchAlgorithmException {
		SecureRandom random = new SecureRandom();
		byte[] bytesOfMessage = (new BigInteger(130, random).toString(32)).getBytes("UTF-8");

		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] thedigest = md.digest(bytesOfMessage);
		return new String(Hex.encodeHex(thedigest));
	}

	private long[] getUserRoles(AccountType accountType) throws SystemException, PortalException {
		Role roleToAssign = UserAddonLocalServiceUtil.getUserRole(MZConstants.roleNameConsultant);

		if (accountType == AccountType.EMITER) {
			roleToAssign = UserAddonLocalServiceUtil.getUserRole(MZConstants.roleNameEmiter);
		}

		return new long[] { roleToAssign.getRoleId() };
	}

	private void additionalValidate(String emailAddress, String phone, String position, String companyName,
			String companyAddress, String companyPostalCode, String companyCity, String companyPhone, String companyFax,
			String companyMail, AccountType accountType, String acceptRules) throws Exception {

		if (!acceptRules.equals("on"))
			throw new NotAcceptRulesException();

		if (emailAddress.endsWith("liferay.com"))
			throw new UserEmailAddressException();

		if (accountType.equals(AccountType.CONSULTANT_PERSON))
			return;

		if (Validator.isNull(phone))
			throw new PhoneNumberException();

		if (Validator.isNull(position))
			throw new PositionException();

		// company data
		if (Validator.isNull(companyName))
			throw new CompanyNameException();

		if (Validator.isNull(companyAddress))
			throw new CompanyAddressException();

		if (Validator.isNull(companyPostalCode))
			throw new CompanyPostalCodeException();

		if (Validator.isNull(companyCity))
			throw new CompanyCityException();

		if (Validator.isNull(companyPhone))
			throw new PhoneNumberException();

		if (!Validator.isEmailAddress(companyMail))
			throw new UserEmailAddressException();

	}

	protected boolean isCheckMethodOnProcessAction() {
		return _CHECK_METHOD_ON_PROCESS_ACTION;
	}

	private static final boolean _CHECK_METHOD_ON_PROCESS_ACTION = false;

}