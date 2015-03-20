package pl.mamzdanie.useraddon.svc.service.base;

import com.liferay.portal.PortalException;
import com.liferay.portal.SystemException;
import com.liferay.portal.kernel.annotation.BeanReference;
import com.liferay.portal.kernel.dao.orm.DynamicQuery;
import com.liferay.portal.util.PortalUtil;

import pl.mamzdanie.useraddon.svc.model.UserAddon;
import pl.mamzdanie.useraddon.svc.service.UserAddonLocalService;
import pl.mamzdanie.useraddon.svc.service.persistence.UserAddonFinder;
import pl.mamzdanie.useraddon.svc.service.persistence.UserAddonPersistence;

import java.util.List;


public abstract class UserAddonLocalServiceBaseImpl
    implements UserAddonLocalService {
    @BeanReference(name = "pl.mamzdanie.useraddon.svc.service.UserAddonLocalService.impl")
    protected UserAddonLocalService userAddonLocalService;
    @BeanReference(name = "pl.mamzdanie.useraddon.svc.service.persistence.UserAddonPersistence.impl")
    protected UserAddonPersistence userAddonPersistence;
    @BeanReference(name = "pl.mamzdanie.useraddon.svc.service.persistence.UserAddonFinder.impl")
    protected UserAddonFinder userAddonFinder;

    public UserAddon addUserAddon(UserAddon userAddon)
        throws SystemException {
        userAddon.setNew(true);

        return userAddonPersistence.update(userAddon, false);
    }

    public UserAddon createUserAddon(long userId) {
        return userAddonPersistence.create(userId);
    }

    public void deleteUserAddon(long userId)
        throws PortalException, SystemException {
        userAddonPersistence.remove(userId);
    }

    public void deleteUserAddon(UserAddon userAddon) throws SystemException {
        userAddonPersistence.remove(userAddon);
    }

    public List<Object> dynamicQuery(DynamicQuery dynamicQuery)
        throws SystemException {
        return userAddonPersistence.findWithDynamicQuery(dynamicQuery);
    }

    public List<Object> dynamicQuery(DynamicQuery dynamicQuery, int start,
        int end) throws SystemException {
        return userAddonPersistence.findWithDynamicQuery(dynamicQuery, start,
            end);
    }

    public UserAddon getUserAddon(long userId)
        throws PortalException, SystemException {
        return userAddonPersistence.findByPrimaryKey(userId);
    }

    public List<UserAddon> getUserAddons(int start, int end)
        throws SystemException {
        return userAddonPersistence.findAll(start, end);
    }

    public int getUserAddonsCount() throws SystemException {
        return userAddonPersistence.countAll();
    }

    public UserAddon updateUserAddon(UserAddon userAddon)
        throws SystemException {
        userAddon.setNew(false);

        return userAddonPersistence.update(userAddon, true);
    }

    public UserAddon updateUserAddon(UserAddon userAddon, boolean merge)
        throws SystemException {
        userAddon.setNew(false);

        return userAddonPersistence.update(userAddon, merge);
    }

    public UserAddonLocalService getUserAddonLocalService() {
        return userAddonLocalService;
    }

    public void setUserAddonLocalService(
        UserAddonLocalService userAddonLocalService) {
        this.userAddonLocalService = userAddonLocalService;
    }

    public UserAddonPersistence getUserAddonPersistence() {
        return userAddonPersistence;
    }

    public void setUserAddonPersistence(
        UserAddonPersistence userAddonPersistence) {
        this.userAddonPersistence = userAddonPersistence;
    }

    public UserAddonFinder getUserAddonFinder() {
        return userAddonFinder;
    }

    public void setUserAddonFinder(UserAddonFinder userAddonFinder) {
        this.userAddonFinder = userAddonFinder;
    }

    protected void runSQL(String sql) throws SystemException {
        try {
            PortalUtil.runSQL(sql);
        } catch (Exception e) {
            throw new SystemException(e);
        }
    }
}
