package pl.mamzdanie.mbmessageaddon.svc.service;


/**
 * <a href="MBMessageAddonLocalServiceUtil.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This class provides static methods for the
 * <code>pl.mamzdanie.mbmessageaddon.svc.service.MBMessageAddonLocalService</code>
 * bean. The static methods of this class calls the same methods of the bean
 * instance. It's convenient to be able to just write one line to call a method
 * on a bean instead of writing a lookup call and a method call.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.mbmessageaddon.svc.service.MBMessageAddonLocalService
 *
 */
public class MBMessageAddonLocalServiceUtil {
    private static MBMessageAddonLocalService _service;

    public static pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon addMBMessageAddon(
        pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon mbMessageAddon)
        throws com.liferay.portal.SystemException {
        return getService().addMBMessageAddon(mbMessageAddon);
    }

    public static pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon createMBMessageAddon(
        java.lang.Long messageId) {
        return getService().createMBMessageAddon(messageId);
    }

    public static void deleteMBMessageAddon(java.lang.Long messageId)
        throws com.liferay.portal.PortalException,
            com.liferay.portal.SystemException {
        getService().deleteMBMessageAddon(messageId);
    }

    public static void deleteMBMessageAddon(
        pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon mbMessageAddon)
        throws com.liferay.portal.SystemException {
        getService().deleteMBMessageAddon(mbMessageAddon);
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

    public static pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon getMBMessageAddon(
        java.lang.Long messageId)
        throws com.liferay.portal.PortalException,
            com.liferay.portal.SystemException {
        return getService().getMBMessageAddon(messageId);
    }

    public static java.util.List<pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon> getMBMessageAddons(
        int start, int end) throws com.liferay.portal.SystemException {
        return getService().getMBMessageAddons(start, end);
    }

    public static int getMBMessageAddonsCount()
        throws com.liferay.portal.SystemException {
        return getService().getMBMessageAddonsCount();
    }

    public static pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon updateMBMessageAddon(
        pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon mbMessageAddon)
        throws com.liferay.portal.SystemException {
        return getService().updateMBMessageAddon(mbMessageAddon);
    }

    public static pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon updateMBMessageAddon(
        pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon mbMessageAddon,
        boolean merge) throws com.liferay.portal.SystemException {
        return getService().updateMBMessageAddon(mbMessageAddon, merge);
    }

    public static MBMessageAddonLocalService getService() {
        if (_service == null) {
            throw new RuntimeException("MBMessageAddonLocalService is not set");
        }

        return _service;
    }

    public void setService(MBMessageAddonLocalService service) {
        _service = service;
    }
}
