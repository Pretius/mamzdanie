package pl.mamzdanie.userorganization.svc.service;


/**
 * <a href="UserOrganizationLocalServiceUtil.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This class provides static methods for the
 * <code>pl.mamzdanie.userorganization.svc.service.UserOrganizationLocalService</code>
 * bean. The static methods of this class calls the same methods of the bean
 * instance. It's convenient to be able to just write one line to call a method
 * on a bean instead of writing a lookup call and a method call.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.userorganization.svc.service.UserOrganizationLocalService
 *
 */
public class UserOrganizationLocalServiceUtil {
    private static UserOrganizationLocalService _service;

    public static pl.mamzdanie.userorganization.svc.model.UserOrganization addUserOrganization(
        pl.mamzdanie.userorganization.svc.model.UserOrganization userOrganization)
        throws com.liferay.portal.SystemException {
        return getService().addUserOrganization(userOrganization);
    }

    public static pl.mamzdanie.userorganization.svc.model.UserOrganization createUserOrganization(
        long id) {
        return getService().createUserOrganization(id);
    }

    public static void deleteUserOrganization(long id)
        throws com.liferay.portal.PortalException,
            com.liferay.portal.SystemException {
        getService().deleteUserOrganization(id);
    }

    public static void deleteUserOrganization(
        pl.mamzdanie.userorganization.svc.model.UserOrganization userOrganization)
        throws com.liferay.portal.SystemException {
        getService().deleteUserOrganization(userOrganization);
    }

    public static java.util.List<Object> dynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
        throws com.liferay.portal.SystemException {
        return getService().dynamicQuery(dynamicQuery);
    }

    public static java.util.List<Object> dynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
        int end) throws com.liferay.portal.SystemException {
        return getService().dynamicQuery(dynamicQuery, start, end);
    }

    public static pl.mamzdanie.userorganization.svc.model.UserOrganization getUserOrganization(
        long id)
        throws com.liferay.portal.PortalException,
            com.liferay.portal.SystemException {
        return getService().getUserOrganization(id);
    }

    public static java.util.List<pl.mamzdanie.userorganization.svc.model.UserOrganization> getUserOrganizations(
        int start, int end) throws com.liferay.portal.SystemException {
        return getService().getUserOrganizations(start, end);
    }

    public static int getUserOrganizationsCount()
        throws com.liferay.portal.SystemException {
        return getService().getUserOrganizationsCount();
    }

    public static pl.mamzdanie.userorganization.svc.model.UserOrganization updateUserOrganization(
        pl.mamzdanie.userorganization.svc.model.UserOrganization userOrganization)
        throws com.liferay.portal.SystemException {
        return getService().updateUserOrganization(userOrganization);
    }

    public static pl.mamzdanie.userorganization.svc.model.UserOrganization updateUserOrganization(
        pl.mamzdanie.userorganization.svc.model.UserOrganization userOrganization,
        boolean merge) throws com.liferay.portal.SystemException {
        return getService().updateUserOrganization(userOrganization, merge);
    }

    public static pl.mamzdanie.userorganization.svc.model.UserOrganization getUserOrganizationDetails(
        int id) {
        return getService().getUserOrganizationDetails(id);
    }

    public static UserOrganizationLocalService getService() {
        if (_service == null) {
            throw new RuntimeException(
                "UserOrganizationLocalService is not set");
        }

        return _service;
    }

    public void setService(UserOrganizationLocalService service) {
        _service = service;
    }
}
