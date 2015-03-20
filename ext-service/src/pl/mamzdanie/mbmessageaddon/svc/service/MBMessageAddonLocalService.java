package pl.mamzdanie.mbmessageaddon.svc.service;

import com.liferay.portal.PortalException;
import com.liferay.portal.SystemException;
import com.liferay.portal.kernel.annotation.Isolation;
import com.liferay.portal.kernel.annotation.Propagation;
import com.liferay.portal.kernel.annotation.Transactional;


/**
 * <a href="MBMessageAddonLocalService.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This interface defines the service. The default implementation is
 * <code>pl.mamzdanie.mbmessageaddon.svc.service.impl.MBMessageAddonLocalServiceImpl</code>.
 * Modify methods in that class and rerun ServiceBuilder to populate this class
 * and all other generated classes.
 * </p>
 *
 * <p>
 * This is a local service. Methods of this service will not have security checks based on the propagated JAAS credentials because this service can only be accessed from within the same VM.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.mbmessageaddon.svc.service.MBMessageAddonLocalServiceUtil
 *
 */
@Transactional(isolation = Isolation.PORTAL, rollbackFor =  {
    PortalException.class, SystemException.class}
)
public interface MBMessageAddonLocalService {
    public pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon addMBMessageAddon(
        pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon mbMessageAddon)
        throws com.liferay.portal.SystemException;

    public pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon createMBMessageAddon(
        java.lang.Long messageId);

    public void deleteMBMessageAddon(java.lang.Long messageId)
        throws com.liferay.portal.SystemException,
            com.liferay.portal.PortalException;

    public void deleteMBMessageAddon(
        pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon mbMessageAddon)
        throws com.liferay.portal.SystemException;

    public java.util.List<Object> dynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
        throws com.liferay.portal.SystemException;

    public java.util.List<Object> dynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
        int end) throws com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon getMBMessageAddon(
        java.lang.Long messageId)
        throws com.liferay.portal.SystemException,
            com.liferay.portal.PortalException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public java.util.List<pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon> getMBMessageAddons(
        int start, int end) throws com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public int getMBMessageAddonsCount()
        throws com.liferay.portal.SystemException;

    public pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon updateMBMessageAddon(
        pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon mbMessageAddon)
        throws com.liferay.portal.SystemException;

    public pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon updateMBMessageAddon(
        pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon mbMessageAddon,
        boolean merge) throws com.liferay.portal.SystemException;
}
