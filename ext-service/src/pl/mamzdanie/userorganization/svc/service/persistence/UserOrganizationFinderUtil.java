package pl.mamzdanie.userorganization.svc.service.persistence;

public class UserOrganizationFinderUtil {
    private static UserOrganizationFinder _finder;

    public static pl.mamzdanie.userorganization.svc.model.UserOrganization getUserOrganizationDetails(
        int id) throws com.liferay.portal.SystemException {
        return getFinder().getUserOrganizationDetails(id);
    }

    public static UserOrganizationFinder getFinder() {
        return _finder;
    }

    public void setFinder(UserOrganizationFinder finder) {
        _finder = finder;
    }
}
