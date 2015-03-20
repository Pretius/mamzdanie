package pl.mamzdanie.useraddon.svc.service;

import com.liferay.portal.PortalException;
import com.liferay.portal.SystemException;
import com.liferay.portal.kernel.annotation.Isolation;
import com.liferay.portal.kernel.annotation.Propagation;
import com.liferay.portal.kernel.annotation.Transactional;


/**
 * <a href="UserAddonLocalService.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This interface defines the service. The default implementation is
 * <code>pl.mamzdanie.useraddon.svc.service.impl.UserAddonLocalServiceImpl</code>.
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
 * @see pl.mamzdanie.useraddon.svc.service.UserAddonLocalServiceUtil
 *
 */
@Transactional(isolation = Isolation.PORTAL, rollbackFor =  {
    PortalException.class, SystemException.class}
)
public interface UserAddonLocalService {
    public pl.mamzdanie.useraddon.svc.model.UserAddon addUserAddon(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon)
        throws com.liferay.portal.SystemException;

    public pl.mamzdanie.useraddon.svc.model.UserAddon createUserAddon(
        long userId);

    public void deleteUserAddon(long userId)
        throws com.liferay.portal.SystemException,
            com.liferay.portal.PortalException;

    public void deleteUserAddon(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon)
        throws com.liferay.portal.SystemException;

    public java.util.List<Object> dynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
        throws com.liferay.portal.SystemException;

    public java.util.List<Object> dynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
        int end) throws com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public pl.mamzdanie.useraddon.svc.model.UserAddon getUserAddon(long userId)
        throws com.liferay.portal.SystemException,
            com.liferay.portal.PortalException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public java.util.List<pl.mamzdanie.useraddon.svc.model.UserAddon> getUserAddons(
        int start, int end) throws com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public int getUserAddonsCount() throws com.liferay.portal.SystemException;

    public pl.mamzdanie.useraddon.svc.model.UserAddon updateUserAddon(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon)
        throws com.liferay.portal.SystemException;

    public pl.mamzdanie.useraddon.svc.model.UserAddon updateUserAddon(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon, boolean merge)
        throws com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public com.liferay.portal.model.Role getUserRole(java.lang.String roleName)
        throws com.liferay.portal.NoSuchRoleException,
            com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public pl.mamzdanie.useraddon.svc.model.UserAddon getUserDetails(int id)
        throws com.liferay.portal.PortalException,
            com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public java.lang.String getUserFirstName(int id);

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public java.lang.String getUserLastName(int id);

    public java.util.List<com.liferay.portal.model.User> findByNotifyFlag(
        java.lang.Boolean notify) throws com.liferay.portal.SystemException;

    public pl.mamzdanie.useraddon.svc.model.UserAddon findByApiKey(
        java.lang.String apiKey) throws com.liferay.portal.SystemException;
}
