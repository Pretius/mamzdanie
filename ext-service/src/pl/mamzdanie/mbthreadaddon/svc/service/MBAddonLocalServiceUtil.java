package pl.mamzdanie.mbthreadaddon.svc.service;


/**
 * <a href="MBAddonLocalServiceUtil.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This class provides static methods for the
 * <code>pl.mamzdanie.mbthreadaddon.svc.service.MBAddonLocalService</code>
 * bean. The static methods of this class calls the same methods of the bean
 * instance. It's convenient to be able to just write one line to call a method
 * on a bean instead of writing a lookup call and a method call.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.mbthreadaddon.svc.service.MBAddonLocalService
 *
 */
public class MBAddonLocalServiceUtil {
    private static MBAddonLocalService _service;

    public static pl.mamzdanie.mbthreadaddon.svc.model.MBAddon addMBAddon(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon)
        throws com.liferay.portal.SystemException {
        return getService().addMBAddon(mbAddon);
    }

    public static pl.mamzdanie.mbthreadaddon.svc.model.MBAddon createMBAddon(
        long threadId) {
        return getService().createMBAddon(threadId);
    }

    public static void deleteMBAddon(long threadId)
        throws com.liferay.portal.PortalException,
            com.liferay.portal.SystemException {
        getService().deleteMBAddon(threadId);
    }

    public static void deleteMBAddon(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon)
        throws com.liferay.portal.SystemException {
        getService().deleteMBAddon(mbAddon);
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

    public static pl.mamzdanie.mbthreadaddon.svc.model.MBAddon getMBAddon(
        long threadId)
        throws com.liferay.portal.PortalException,
            com.liferay.portal.SystemException {
        return getService().getMBAddon(threadId);
    }

    public static java.util.List<pl.mamzdanie.mbthreadaddon.svc.model.MBAddon> getMBAddons(
        int start, int end) throws com.liferay.portal.SystemException {
        return getService().getMBAddons(start, end);
    }

    public static int getMBAddonsCount()
        throws com.liferay.portal.SystemException {
        return getService().getMBAddonsCount();
    }

    public static pl.mamzdanie.mbthreadaddon.svc.model.MBAddon updateMBAddon(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon)
        throws com.liferay.portal.SystemException {
        return getService().updateMBAddon(mbAddon);
    }

    public static pl.mamzdanie.mbthreadaddon.svc.model.MBAddon updateMBAddon(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon, boolean merge)
        throws com.liferay.portal.SystemException {
        return getService().updateMBAddon(mbAddon, merge);
    }

    public static com.liferay.portlet.messageboards.model.MBMessage addMailMessage(
        java.lang.String eMailAddress, long categoryId, long parentMessageId,
        java.lang.String body,
        java.util.List<com.liferay.portal.kernel.util.ObjectValuePair<String, byte[]>> files)
        throws com.liferay.portal.PortalException,
            com.liferay.portal.SystemException {
        return getService()
                   .addMailMessage(eMailAddress, categoryId, parentMessageId,
            body, files);
    }

    public static void reIndex(
        com.liferay.portlet.messageboards.model.MBMessage message)
        throws com.liferay.portal.SystemException {
        getService().reIndex(message);
    }

    public static MBAddonLocalService getService() {
        if (_service == null) {
            throw new RuntimeException("MBAddonLocalService is not set");
        }

        return _service;
    }

    public void setService(MBAddonLocalService service) {
        _service = service;
    }
}
