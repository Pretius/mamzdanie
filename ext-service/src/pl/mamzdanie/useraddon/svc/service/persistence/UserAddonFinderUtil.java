package pl.mamzdanie.useraddon.svc.service.persistence;

public class UserAddonFinderUtil {
    private static UserAddonFinder _finder;

    public static java.lang.String getUserLastName(int id)
        throws com.liferay.portal.SystemException {
        return getFinder().getUserLastName(id);
    }

    public static java.lang.String getUserFirstName(int id)
        throws com.liferay.portal.SystemException {
        return getFinder().getUserFirstName(id);
    }

    public static UserAddonFinder getFinder() {
        return _finder;
    }

    public void setFinder(UserAddonFinder finder) {
        _finder = finder;
    }
}
