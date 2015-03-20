package pl.mamzdanie.useraddon.svc.service;


/**
 * <a href="UserAddonLocalServiceUtil.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This class provides static methods for the
 * <code>pl.mamzdanie.useraddon.svc.service.UserAddonLocalService</code>
 * bean. The static methods of this class calls the same methods of the bean
 * instance. It's convenient to be able to just write one line to call a method
 * on a bean instead of writing a lookup call and a method call.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.useraddon.svc.service.UserAddonLocalService
 *
 */
public class UserAddonLocalServiceUtil {
    private static UserAddonLocalService _service;

    public static pl.mamzdanie.useraddon.svc.model.UserAddon addUserAddon(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon)
        throws com.liferay.portal.SystemException {
        return getService().addUserAddon(userAddon);
    }

    public static pl.mamzdanie.useraddon.svc.model.UserAddon createUserAddon(
        long userId) {
        return getService().createUserAddon(userId);
    }

    public static void deleteUserAddon(long userId)
        throws com.liferay.portal.PortalException,
            com.liferay.portal.SystemException {
        getService().deleteUserAddon(userId);
    }

    public static void deleteUserAddon(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon)
        throws com.liferay.portal.SystemException {
        getService().deleteUserAddon(userAddon);
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

    public static pl.mamzdanie.useraddon.svc.model.UserAddon getUserAddon(
        long userId)
        throws com.liferay.portal.PortalException,
            com.liferay.portal.SystemException {
        return getService().getUserAddon(userId);
    }

    public static java.util.List<pl.mamzdanie.useraddon.svc.model.UserAddon> getUserAddons(
        int start, int end) throws com.liferay.portal.SystemException {
        return getService().getUserAddons(start, end);
    }

    public static int getUserAddonsCount()
        throws com.liferay.portal.SystemException {
        return getService().getUserAddonsCount();
    }

    public static pl.mamzdanie.useraddon.svc.model.UserAddon updateUserAddon(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon)
        throws com.liferay.portal.SystemException {
        return getService().updateUserAddon(userAddon);
    }

    public static pl.mamzdanie.useraddon.svc.model.UserAddon updateUserAddon(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon, boolean merge)
        throws com.liferay.portal.SystemException {
        return getService().updateUserAddon(userAddon, merge);
    }

    public static com.liferay.portal.model.Role getUserRole(
        java.lang.String roleName)
        throws com.liferay.portal.NoSuchRoleException,
            com.liferay.portal.SystemException {
        return getService().getUserRole(roleName);
    }

    public static pl.mamzdanie.useraddon.svc.model.UserAddon getUserDetails(
        int id)
        throws com.liferay.portal.PortalException,
            com.liferay.portal.SystemException {
        return getService().getUserDetails(id);
    }

    public static java.lang.String getUserFirstName(int id) {
        return getService().getUserFirstName(id);
    }

    public static java.lang.String getUserLastName(int id) {
        return getService().getUserLastName(id);
    }

    public static java.util.List<com.liferay.portal.model.User> findByNotifyFlag(
        java.lang.Boolean notify) throws com.liferay.portal.SystemException {
        return getService().findByNotifyFlag(notify);
    }

    public static pl.mamzdanie.useraddon.svc.model.UserAddon findByApiKey(
        java.lang.String apiKey) throws com.liferay.portal.SystemException {
        return getService().findByApiKey(apiKey);
    }

    public static UserAddonLocalService getService() {
        if (_service == null) {
            throw new RuntimeException("UserAddonLocalService is not set");
        }

        return _service;
    }

    public void setService(UserAddonLocalService service) {
        _service = service;
    }
}
