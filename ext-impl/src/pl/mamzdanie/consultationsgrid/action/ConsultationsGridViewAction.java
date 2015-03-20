package pl.mamzdanie.consultationsgrid.action;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.liferay.portal.struts.PortletAction;
import com.liferay.portal.util.PortalUtil;

public class ConsultationsGridViewAction extends PortletAction {

	private static final Logger logger = Logger.getLogger(ConsultationsGridViewAction.class);

	@Override
	public ActionForward render(ActionMapping mapping, ActionForm form, PortletConfig portletConfig,
			RenderRequest renderRequest, RenderResponse renderResponse) throws Exception {

		return new ActionForward("p.consultationsgrid.view");
	}

	@Override
	public void processAction(ActionMapping mapping, ActionForm form, PortletConfig portletConfig,
			ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {

		setForward(actionRequest, "success");
		if (!PortalUtil.isMethodPost(actionRequest)) {
			return;
		}
	}
}
