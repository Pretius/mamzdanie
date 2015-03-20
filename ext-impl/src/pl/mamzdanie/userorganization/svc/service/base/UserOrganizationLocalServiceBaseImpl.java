package pl.mamzdanie.userorganization.svc.service.base;

import com.liferay.portal.PortalException;
import com.liferay.portal.SystemException;
import com.liferay.portal.kernel.annotation.BeanReference;
import com.liferay.portal.kernel.dao.orm.DynamicQuery;
import com.liferay.portal.util.PortalUtil;

import pl.mamzdanie.userorganization.svc.model.UserOrganization;
import pl.mamzdanie.userorganization.svc.service.UserOrganizationLocalService;
import pl.mamzdanie.userorganization.svc.service.persistence.UserOrganizationFinder;
import pl.mamzdanie.userorganization.svc.service.persistence.UserOrganizationPersistence;

import java.util.List;


public abstract class UserOrganizationLocalServiceBaseImpl
    implements UserOrganizationLocalService {
    @BeanReference(name = "pl.mamzdanie.userorganization.svc.service.UserOrganizationLocalService.impl")
    protected UserOrganizationLocalService userOrganizationLocalService;
    @BeanReference(name = "pl.mamzdanie.userorganization.svc.service.persistence.UserOrganizationPersistence.impl")
    protected UserOrganizationPersistence userOrganizationPersistence;
    @BeanReference(name = "pl.mamzdanie.userorganization.svc.service.persistence.UserOrganizationFinder.impl")
    protected UserOrganizationFinder userOrganizationFinder;

    public UserOrganization addUserOrganization(
        UserOrganization userOrganization) throws SystemException {
        userOrganization.setNew(true);

        return userOrganizationPersistence.update(userOrganization, false);
    }

    public UserOrganization createUserOrganization(long id) {
        return userOrganizationPersistence.create(id);
    }

    public void deleteUserOrganization(long id)
        throws PortalException, SystemException {
        userOrganizationPersistence.remove(id);
    }

    public void deleteUserOrganization(UserOrganization userOrganization)
        throws SystemException {
        userOrganizationPersistence.remove(userOrganization);
    }

    public List<Object> dynamicQuery(DynamicQuery dynamicQuery)
        throws SystemException {
        return userOrganizationPersistence.findWithDynamicQuery(dynamicQuery);
    }

    public List<Object> dynamicQuery(DynamicQuery dynamicQuery, int start,
        int end) throws SystemException {
        return userOrganizationPersistence.findWithDynamicQuery(dynamicQuery,
            start, end);
    }

    public UserOrganization getUserOrganization(long id)
        throws PortalException, SystemException {
        return userOrganizationPersistence.findByPrimaryKey(id);
    }

    public List<UserOrganization> getUserOrganizations(int start, int end)
        throws SystemException {
        return userOrganizationPersistence.findAll(start, end);
    }

    public int getUserOrganizationsCount() throws SystemException {
        return userOrganizationPersistence.countAll();
    }

    public UserOrganization updateUserOrganization(
        UserOrganization userOrganization) throws SystemException {
        userOrganization.setNew(false);

        return userOrganizationPersistence.update(userOrganization, true);
    }

    public UserOrganization updateUserOrganization(
        UserOrganization userOrganization, boolean merge)
        throws SystemException {
        userOrganization.setNew(false);

        return userOrganizationPersistence.update(userOrganization, merge);
    }

    public UserOrganizationLocalService getUserOrganizationLocalService() {
        return userOrganizationLocalService;
    }

    public void setUserOrganizationLocalService(
        UserOrganizationLocalService userOrganizationLocalService) {
        this.userOrganizationLocalService = userOrganizationLocalService;
    }

    public UserOrganizationPersistence getUserOrganizationPersistence() {
        return userOrganizationPersistence;
    }

    public void setUserOrganizationPersistence(
        UserOrganizationPersistence userOrganizationPersistence) {
        this.userOrganizationPersistence = userOrganizationPersistence;
    }

    public UserOrganizationFinder getUserOrganizationFinder() {
        return userOrganizationFinder;
    }

    public void setUserOrganizationFinder(
        UserOrganizationFinder userOrganizationFinder) {
        this.userOrganizationFinder = userOrganizationFinder;
    }

    protected void runSQL(String sql) throws SystemException {
        try {
            PortalUtil.runSQL(sql);
        } catch (Exception e) {
            throw new SystemException(e);
        }
    }
}
