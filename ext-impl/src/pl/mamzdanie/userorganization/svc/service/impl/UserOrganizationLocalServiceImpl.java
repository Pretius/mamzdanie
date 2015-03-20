package pl.mamzdanie.userorganization.svc.service.impl;

import pl.mamzdanie.userorganization.svc.model.UserOrganization;
import pl.mamzdanie.userorganization.svc.service.base.UserOrganizationLocalServiceBaseImpl;

import com.liferay.portal.SystemException;


public class UserOrganizationLocalServiceImpl
    extends UserOrganizationLocalServiceBaseImpl {
	public UserOrganization getUserOrganizationDetails(int id) {
		try {
			return userOrganizationFinder.getUserOrganizationDetails(id);
		} catch (SystemException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
