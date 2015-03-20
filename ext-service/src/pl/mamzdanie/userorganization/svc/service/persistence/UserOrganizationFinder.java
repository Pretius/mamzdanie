package pl.mamzdanie.userorganization.svc.service.persistence;

public interface UserOrganizationFinder {
    public pl.mamzdanie.userorganization.svc.model.UserOrganization getUserOrganizationDetails(
        int id) throws com.liferay.portal.SystemException;
}
