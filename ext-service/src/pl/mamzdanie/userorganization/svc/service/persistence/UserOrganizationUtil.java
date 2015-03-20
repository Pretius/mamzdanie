package pl.mamzdanie.userorganization.svc.service.persistence;

public class UserOrganizationUtil {
    private static UserOrganizationPersistence _persistence;

    public static void cacheResult(
        pl.mamzdanie.userorganization.svc.model.UserOrganization userOrganization) {
        getPersistence().cacheResult(userOrganization);
    }

    public static void cacheResult(
        java.util.List<pl.mamzdanie.userorganization.svc.model.UserOrganization> userOrganizations) {
        getPersistence().cacheResult(userOrganizations);
    }

    public static void clearCache() {
        getPersistence().clearCache();
    }

    public static pl.mamzdanie.userorganization.svc.model.UserOrganization create(
        long id) {
        return getPersistence().create(id);
    }

    public static pl.mamzdanie.userorganization.svc.model.UserOrganization remove(
        long id)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.userorganization.svc.NoSuchUserOrganizationException {
        return getPersistence().remove(id);
    }

    public static pl.mamzdanie.userorganization.svc.model.UserOrganization remove(
        pl.mamzdanie.userorganization.svc.model.UserOrganization userOrganization)
        throws com.liferay.portal.SystemException {
        return getPersistence().remove(userOrganization);
    }

    /**
     * @deprecated Use <code>update(UserOrganization userOrganization, boolean merge)</code>.
     */
    public static pl.mamzdanie.userorganization.svc.model.UserOrganization update(
        pl.mamzdanie.userorganization.svc.model.UserOrganization userOrganization)
        throws com.liferay.portal.SystemException {
        return getPersistence().update(userOrganization);
    }

    /**
     * Add, update, or merge, the entity. This method also calls the model
     * listeners to trigger the proper events associated with adding, deleting,
     * or updating an entity.
     *
     * @param                userOrganization the entity to add, update, or merge
     * @param                merge boolean value for whether to merge the entity. The
     *                                default value is false. Setting merge to true is more
     *                                expensive and should only be true when userOrganization is
     *                                transient. See LEP-5473 for a detailed discussion of this
     *                                method.
     * @return                true if the portlet can be displayed via Ajax
     */
    public static pl.mamzdanie.userorganization.svc.model.UserOrganization update(
        pl.mamzdanie.userorganization.svc.model.UserOrganization userOrganization,
        boolean merge) throws com.liferay.portal.SystemException {
        return getPersistence().update(userOrganization, merge);
    }

    public static pl.mamzdanie.userorganization.svc.model.UserOrganization updateImpl(
        pl.mamzdanie.userorganization.svc.model.UserOrganization userOrganization,
        boolean merge) throws com.liferay.portal.SystemException {
        return getPersistence().updateImpl(userOrganization, merge);
    }

    public static pl.mamzdanie.userorganization.svc.model.UserOrganization findByPrimaryKey(
        long id)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.userorganization.svc.NoSuchUserOrganizationException {
        return getPersistence().findByPrimaryKey(id);
    }

    public static pl.mamzdanie.userorganization.svc.model.UserOrganization fetchByPrimaryKey(
        long id) throws com.liferay.portal.SystemException {
        return getPersistence().fetchByPrimaryKey(id);
    }

    public static java.util.List<Object> findWithDynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
        throws com.liferay.portal.SystemException {
        return getPersistence().findWithDynamicQuery(dynamicQuery);
    }

    public static java.util.List<Object> findWithDynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
        int end) throws com.liferay.portal.SystemException {
        return getPersistence().findWithDynamicQuery(dynamicQuery, start, end);
    }

    public static java.util.List<pl.mamzdanie.userorganization.svc.model.UserOrganization> findAll()
        throws com.liferay.portal.SystemException {
        return getPersistence().findAll();
    }

    public static java.util.List<pl.mamzdanie.userorganization.svc.model.UserOrganization> findAll(
        int start, int end) throws com.liferay.portal.SystemException {
        return getPersistence().findAll(start, end);
    }

    public static java.util.List<pl.mamzdanie.userorganization.svc.model.UserOrganization> findAll(
        int start, int end, com.liferay.portal.kernel.util.OrderByComparator obc)
        throws com.liferay.portal.SystemException {
        return getPersistence().findAll(start, end, obc);
    }

    public static void removeAll() throws com.liferay.portal.SystemException {
        getPersistence().removeAll();
    }

    public static int countAll() throws com.liferay.portal.SystemException {
        return getPersistence().countAll();
    }

    public static UserOrganizationPersistence getPersistence() {
        return _persistence;
    }

    public void setPersistence(UserOrganizationPersistence persistence) {
        _persistence = persistence;
    }
}
