package pl.mamzdanie.mbthreadaddon.svc.service;

import com.liferay.portal.PortalException;
import com.liferay.portal.SystemException;
import com.liferay.portal.kernel.annotation.Isolation;
import com.liferay.portal.kernel.annotation.Propagation;
import com.liferay.portal.kernel.annotation.Transactional;


/**
 * <a href="MBAddonLocalService.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This interface defines the service. The default implementation is
 * <code>pl.mamzdanie.mbthreadaddon.svc.service.impl.MBAddonLocalServiceImpl</code>.
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
 * @see pl.mamzdanie.mbthreadaddon.svc.service.MBAddonLocalServiceUtil
 *
 */
@Transactional(isolation = Isolation.PORTAL, rollbackFor =  {
    PortalException.class, SystemException.class}
)
public interface MBAddonLocalService {
    public pl.mamzdanie.mbthreadaddon.svc.model.MBAddon addMBAddon(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon)
        throws com.liferay.portal.SystemException;

    public pl.mamzdanie.mbthreadaddon.svc.model.MBAddon createMBAddon(
        long threadId);

    public void deleteMBAddon(long threadId)
        throws com.liferay.portal.SystemException,
            com.liferay.portal.PortalException;

    public void deleteMBAddon(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon)
        throws com.liferay.portal.SystemException;

    public java.util.List<Object> dynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
        throws com.liferay.portal.SystemException;

    public java.util.List<Object> dynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
        int end) throws com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public pl.mamzdanie.mbthreadaddon.svc.model.MBAddon getMBAddon(
        long threadId)
        throws com.liferay.portal.SystemException,
            com.liferay.portal.PortalException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public java.util.List<pl.mamzdanie.mbthreadaddon.svc.model.MBAddon> getMBAddons(
        int start, int end) throws com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public int getMBAddonsCount() throws com.liferay.portal.SystemException;

    public pl.mamzdanie.mbthreadaddon.svc.model.MBAddon updateMBAddon(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon)
        throws com.liferay.portal.SystemException;

    public pl.mamzdanie.mbthreadaddon.svc.model.MBAddon updateMBAddon(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon, boolean merge)
        throws com.liferay.portal.SystemException;

    public com.liferay.portlet.messageboards.model.MBMessage addMailMessage(
        java.lang.String eMailAddress, long categoryId, long parentMessageId,
        java.lang.String body,
        java.util.List<com.liferay.portal.kernel.util.ObjectValuePair<String, byte[]>> files)
        throws com.liferay.portal.PortalException,
            com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public void reIndex(
        com.liferay.portlet.messageboards.model.MBMessage message)
        throws com.liferay.portal.SystemException;
}
