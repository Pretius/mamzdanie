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

package com.liferay.portal.velocity;

import java.util.List;
import java.util.Map;

import javax.portlet.PortletRequest;
import javax.portlet.PortletResponse;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.taglib.tiles.ComponentConstants;
import org.apache.struts.tiles.ComponentContext;
import org.apache.velocity.tools.generic.DateTool;
import org.apache.velocity.tools.generic.EscapeTool;
import org.apache.velocity.tools.generic.IteratorTool;
import org.apache.velocity.tools.generic.ListTool;
import org.apache.velocity.tools.generic.MathTool;
import org.apache.velocity.tools.generic.NumberTool;
import org.apache.velocity.tools.generic.SortTool;

import pl.mamzdanie.CommonUtils;

import com.liferay.portal.kernel.bean.PortalBeanLocatorUtil;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.language.UnicodeLanguageUtil;
import com.liferay.portal.kernel.servlet.BrowserSnifferUtil;
import com.liferay.portal.kernel.servlet.ImageServletTokenUtil;
import com.liferay.portal.kernel.util.ArrayUtil;
import com.liferay.portal.kernel.util.ArrayUtil_IW;
import com.liferay.portal.kernel.util.DateFormats_IW;
import com.liferay.portal.kernel.util.DateUtil_IW;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.GetterUtil_IW;
import com.liferay.portal.kernel.util.HtmlUtil;
import com.liferay.portal.kernel.util.HttpUtil;
import com.liferay.portal.kernel.util.JavaConstants;
import com.liferay.portal.kernel.util.LocaleUtil;
import com.liferay.portal.kernel.util.ParamUtil_IW;
import com.liferay.portal.kernel.util.Randomizer_IW;
import com.liferay.portal.kernel.util.StaticFieldGetter;
import com.liferay.portal.kernel.util.StringUtil_IW;
import com.liferay.portal.kernel.util.TimeZoneUtil_IW;
import com.liferay.portal.kernel.util.UnicodeFormatter_IW;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.kernel.util.Validator_IW;
import com.liferay.portal.kernel.velocity.VelocityContext;
import com.liferay.portal.kernel.xml.SAXReaderUtil;
import com.liferay.portal.model.Layout;
import com.liferay.portal.model.Theme;
import com.liferay.portal.service.permission.AccountPermissionUtil;
import com.liferay.portal.service.permission.CommonPermissionUtil;
import com.liferay.portal.service.permission.GroupPermissionUtil;
import com.liferay.portal.service.permission.LayoutPermissionUtil;
import com.liferay.portal.service.permission.OrganizationPermissionUtil;
import com.liferay.portal.service.permission.PasswordPolicyPermissionUtil;
import com.liferay.portal.service.permission.PortalPermissionUtil;
import com.liferay.portal.service.permission.PortletPermissionUtil;
import com.liferay.portal.service.permission.RolePermissionUtil;
import com.liferay.portal.service.permission.UserGroupPermissionUtil;
import com.liferay.portal.service.permission.UserPermissionUtil;
import com.liferay.portal.theme.NavItem;
import com.liferay.portal.theme.RequestVars;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portal.util.PrefsPropsUtil_IW;
import com.liferay.portal.util.PropsUtil_IW;
import com.liferay.portal.util.SessionClicks_IW;
import com.liferay.portal.util.WebKeys;
import com.liferay.portlet.PortletConfigImpl;
import com.liferay.portlet.PortletURLFactoryUtil;
import com.liferay.portlet.expando.service.ExpandoColumnLocalService;
import com.liferay.portlet.expando.service.ExpandoRowLocalService;
import com.liferay.portlet.expando.service.ExpandoTableLocalService;
import com.liferay.portlet.expando.service.ExpandoValueLocalService;
import com.liferay.portlet.journalcontent.util.JournalContentUtil;
import com.liferay.util.portlet.PortletRequestUtil;

/**
 * <a href="VelocityVariables.java.html"><b><i>View Source</i></b></a>
 *
 * @author Brian Wing Shun Chan
 * @author Raymond Augé
 *
 */
public class VelocityVariables {

	public static void insertHelperUtilities(
		VelocityContext velocityContext, String[] restrictedVariables) {
		
		velocityContext.put("mzVersion", (String)PortalBeanLocatorUtil.locate("applicationVersion"));

		velocityContext.put(
				"commonUtils", new CommonUtils());
		// Array util

		velocityContext.put("arrayUtil", ArrayUtil_IW.getInstance());

		// Browser sniffer

		velocityContext.put(
			"browserSniffer", BrowserSnifferUtil.getBrowserSniffer());

		// Date formats

		velocityContext.put("dateFormats", DateFormats_IW.getInstance());

		// Date tool

		velocityContext.put("dateTool", new DateTool());

		// Date util

		velocityContext.put("dateUtil", DateUtil_IW.getInstance());

		// Escape tool

		velocityContext.put("escapeTool", new EscapeTool());

		// Expando column service

		ServiceLocator serviceLocator = ServiceLocator.getInstance();

		velocityContext.put(
			"expandoColumnLocalService",
			serviceLocator.findService(
				ExpandoColumnLocalService.class.getName()));

		// Expando row service

		velocityContext.put(
			"expandoRowLocalService",
			serviceLocator.findService(ExpandoRowLocalService.class.getName()));

		// Expando table service

		velocityContext.put(
			"expandoTableLocalService",
			serviceLocator.findService(
				ExpandoTableLocalService.class.getName()));

		// Expando value service

		velocityContext.put(
			"expandoValueLocalService",
			serviceLocator.findService(
				ExpandoValueLocalService.class.getName()));

		// Getter util

		velocityContext.put("getterUtil", GetterUtil_IW.getInstance());

		// Html util

		velocityContext.put("htmlUtil", HtmlUtil.getHtml());

		// Http util

		velocityContext.put("httpUtil", HttpUtil.getHttp());

		// Image servlet token

		velocityContext.put(
			"imageToken", ImageServletTokenUtil.getImageServletToken());

		// Iterator tool

		velocityContext.put("iteratorTool", new IteratorTool());

		// Journal content util

		velocityContext.put(
			"journalContentUtil", JournalContentUtil.getJournalContent());

		// Language util

		velocityContext.put("languageUtil", LanguageUtil.getLanguage());
		velocityContext.put(
			"unicodeLanguageUtil", UnicodeLanguageUtil.getUnicodeLanguage());

		// List tool

		velocityContext.put("listTool", new ListTool());

		// Locale util

		velocityContext.put("localeUtil", LocaleUtil.getInstance());

		// Math tool

		velocityContext.put("mathTool", new MathTool());

		// Number tool

		velocityContext.put("numberTool", new NumberTool());

		// Param util

		velocityContext.put("paramUtil", ParamUtil_IW.getInstance());

		// Portal util

		_insertHelperUtility(
			velocityContext, restrictedVariables, "portalUtil",
			PortalUtil.getPortal());
		_insertHelperUtility(
			velocityContext, restrictedVariables, "portal",
			PortalUtil.getPortal());

		// Prefs props util

		_insertHelperUtility(
			velocityContext, restrictedVariables, "prefsPropsUtil",
			PrefsPropsUtil_IW.getInstance());

		// Props util

		_insertHelperUtility(
			velocityContext, restrictedVariables, "propsUtil",
			PropsUtil_IW.getInstance());

		// Portlet URL factory

		velocityContext.put(
			"portletURLFactory", PortletURLFactoryUtil.getPortletURLFactory());

		// Portlet preferences

		_insertHelperUtility(
			velocityContext, restrictedVariables, "velocityPortletPreferences",
			new VelocityPortletPreferences());

		// Randomizer

		velocityContext.put(
			"randomizer", Randomizer_IW.getInstance().getWrappedInstance());

		// SAX reader util

		UtilLocator utilLocator = UtilLocator.getInstance();

		velocityContext.put(
			"saxReaderUtil",
			utilLocator.findUtil(SAXReaderUtil.class.getName()));

		// Service locator

		_insertHelperUtility(
			velocityContext, restrictedVariables, "serviceLocator",
			serviceLocator);

		// Session clicks

		_insertHelperUtility(
			velocityContext, restrictedVariables, "sessionClicks",
			SessionClicks_IW.getInstance());

		// Sort tool

		velocityContext.put("sortTool", new SortTool());

		// Static field getter

		velocityContext.put(
			"staticFieldGetter", StaticFieldGetter.getInstance());

		// String util

		velocityContext.put("stringUtil", StringUtil_IW.getInstance());

		// Time zone util

		velocityContext.put("timeZoneUtil", TimeZoneUtil_IW.getInstance());

		// Util locator

		_insertHelperUtility(
			velocityContext, restrictedVariables, "utilLocator", utilLocator);

		// Unicode formatter

		velocityContext.put(
			"unicodeFormatter", UnicodeFormatter_IW.getInstance());

		// Validator

		velocityContext.put("validator", Validator_IW.getInstance());

		// Permissions

		velocityContext.put(
			"accountPermission", AccountPermissionUtil.getAccountPermission());
		velocityContext.put(
			"commonPermission", CommonPermissionUtil.getCommonPermission());
		velocityContext.put(
			"groupPermission", GroupPermissionUtil.getGroupPermission());
		velocityContext.put(
			"layoutPermission", LayoutPermissionUtil.getLayoutPermission());
		velocityContext.put(
			"organizationPermission",
			OrganizationPermissionUtil.getOrganizationPermission());
		velocityContext.put(
			"passwordPolicyPermission",
			PasswordPolicyPermissionUtil.getPasswordPolicyPermission());
		velocityContext.put(
			"portalPermission", PortalPermissionUtil.getPortalPermission());
		velocityContext.put(
			"portletPermission", PortletPermissionUtil.getPortletPermission());
		velocityContext.put(
			"rolePermission", RolePermissionUtil.getRolePermission());
		velocityContext.put(
			"userGroupPermission",
			UserGroupPermissionUtil.getUserGroupPermission());
		velocityContext.put(
			"userPermission", UserPermissionUtil.getUserPermission());

		// Deprecated

		velocityContext.put(
			"locationPermission",
			OrganizationPermissionUtil.getOrganizationPermission());
	}

	public static void insertVariables(
		VelocityContext velocityContext, HttpServletRequest request) {

		// Request

		velocityContext.put("request", request);

		// Portlet config

		PortletConfigImpl portletConfigImpl =
			(PortletConfigImpl)request.getAttribute(
				JavaConstants.JAVAX_PORTLET_CONFIG);

		if (portletConfigImpl != null) {
			velocityContext.put("portletConfig", portletConfigImpl);
		}

		// Render request

		PortletRequest portletRequest = (PortletRequest)request.getAttribute(
			JavaConstants.JAVAX_PORTLET_REQUEST);

		if (portletRequest != null) {
			if (portletRequest instanceof RenderRequest) {
				velocityContext.put("renderRequest", portletRequest);
			}
		}

		// Render response

		PortletResponse portletResponse = (PortletResponse)request.getAttribute(
			JavaConstants.JAVAX_PORTLET_RESPONSE);

		if (portletResponse != null) {
			if (portletResponse instanceof RenderResponse) {
				velocityContext.put("renderResponse", portletResponse);
			}
		}

		// XML request

		if ((portletRequest != null) && (portletResponse != null)) {
			String xmlRequest = PortletRequestUtil.toXML(
				portletRequest, portletResponse);

			velocityContext.put("xmlRequest", xmlRequest);
		}

		// Theme display

		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(
			WebKeys.THEME_DISPLAY);

		if (themeDisplay != null) {
			Theme theme = themeDisplay.getTheme();

			Layout layout = themeDisplay.getLayout();
			List<Layout> layouts = themeDisplay.getLayouts();

			velocityContext.put("themeDisplay", themeDisplay);
			velocityContext.put("company", themeDisplay.getCompany());
			velocityContext.put("user", themeDisplay.getUser());
			velocityContext.put("realUser", themeDisplay.getRealUser());
			velocityContext.put("layout", layout);
			velocityContext.put("layouts", layouts);
			velocityContext.put("plid", String.valueOf(themeDisplay.getPlid()));
			velocityContext.put(
				"layoutTypePortlet", themeDisplay.getLayoutTypePortlet());
			velocityContext.put(
				"scopeGroupId", new Long(themeDisplay.getScopeGroupId()));
			velocityContext.put(
				"permissionChecker", themeDisplay.getPermissionChecker());
			velocityContext.put("locale", themeDisplay.getLocale());
			velocityContext.put("timeZone", themeDisplay.getTimeZone());
			velocityContext.put("theme", theme);
			velocityContext.put("colorScheme", themeDisplay.getColorScheme());
			velocityContext.put(
				"portletDisplay", themeDisplay.getPortletDisplay());

			// Navigation items

			if (layout != null) {
				RequestVars requestVars = new RequestVars(
					request, themeDisplay, layout.getAncestorPlid(),
					layout.getAncestorLayoutId());

				List<NavItem> navItems = NavItem.fromLayouts(
					requestVars, layouts);

				velocityContext.put("navItems", navItems);
			}

			// Full css and templates path

			String servletContextName = GetterUtil.getString(
				theme.getServletContextName());

			velocityContext.put(
				"fullCssPath",
				servletContextName + theme.getVelocityResourceListener() +
					theme.getCssPath());

			velocityContext.put(
				"fullTemplatesPath",
				servletContextName + theme.getVelocityResourceListener() +
					theme.getTemplatesPath());

			// Init

			velocityContext.put(
				"init",
				themeDisplay.getPathContext() +
					VelocityResourceListener.SERVLET_SEPARATOR +
						"/html/themes/_unstyled/templates/init.vm");

			// Deprecated

			velocityContext.put(
				"portletGroupId", new Long(themeDisplay.getScopeGroupId()));
		}

		// Tiles attributes

		String tilesTitle = _insertTilesVariables(
			velocityContext, request, "tilesTitle", "title");
		String tilesContent = _insertTilesVariables(
			velocityContext, request, "tilesContent", "content");
		boolean tilesSelectable = GetterUtil.getBoolean(_insertTilesVariables(
			velocityContext, request, "tilesSelectable", "selectable"));

		if (themeDisplay != null) {
			themeDisplay.setTilesTitle(tilesTitle);
			themeDisplay.setTilesContent(tilesContent);
			themeDisplay.setTilesSelectable(tilesSelectable);
		}

		// Page title and subtitle

		velocityContext.put(
			"pageTitle", request.getAttribute(WebKeys.PAGE_TITLE));
		velocityContext.put(
			"pageSubtitle", request.getAttribute(WebKeys.PAGE_SUBTITLE));

		// Insert custom vm variables

		Map<String, Object> vmVariables =
			(Map<String, Object>)request.getAttribute(WebKeys.VM_VARIABLES);

		if (vmVariables != null) {
			for (Map.Entry<String, Object> entry : vmVariables.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();

				if (Validator.isNotNull(key)) {
					velocityContext.put(key, value);
				}
			}
		}
	}

	private static void _insertHelperUtility(
		VelocityContext velocityContext, String[] restrictedVariables,
		String key, Object value) {

		if (!ArrayUtil.contains(restrictedVariables, key)) {
			velocityContext.put(key, value);
		}
	}

	private static String _insertTilesVariables(
		VelocityContext velocityContext, HttpServletRequest request,
		String attributeId, String attributeName) {

		ComponentContext componentContext =
			(ComponentContext)request.getAttribute(
				ComponentConstants.COMPONENT_CONTEXT);

		String value = null;

		if (componentContext != null) {
			value = (String)componentContext.getAttribute(attributeName);

			if (value != null) {
				velocityContext.put(attributeId, value);
			}
		}

		return value;
	}

}