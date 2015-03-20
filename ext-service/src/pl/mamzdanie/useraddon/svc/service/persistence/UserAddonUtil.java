package pl.mamzdanie.useraddon.svc.service.persistence;

public class UserAddonUtil {
    private static UserAddonPersistence _persistence;

    public static void cacheResult(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon) {
        getPersistence().cacheResult(userAddon);
    }

    public static void cacheResult(
        java.util.List<pl.mamzdanie.useraddon.svc.model.UserAddon> userAddons) {
        getPersistence().cacheResult(userAddons);
    }

    public static void clearCache() {
        getPersistence().clearCache();
    }

    public static pl.mamzdanie.useraddon.svc.model.UserAddon create(long userId) {
        return getPersistence().create(userId);
    }

    public static pl.mamzdanie.useraddon.svc.model.UserAddon remove(long userId)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.useraddon.svc.NoSuchUserAddonException {
        return getPersistence().remove(userId);
    }

    public static pl.mamzdanie.useraddon.svc.model.UserAddon remove(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon)
        throws com.liferay.portal.SystemException {
        return getPersistence().remove(userAddon);
    }

    /**
     * @deprecated Use <code>update(UserAddon userAddon, boolean merge)</code>.
     */
    public static pl.mamzdanie.useraddon.svc.model.UserAddon update(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon)
        throws com.liferay.portal.SystemException {
        return getPersistence().update(userAddon);
    }

    /**
     * Add, update, or merge, the entity. This method also calls the model
     * listeners to trigger the proper events associated with adding, deleting,
     * or updating an entity.
     *
     * @param                userAddon the entity to add, update, or merge
     * @param                merge boolean value for whether to merge the entity. The
     *                                default value is false. Setting merge to true is more
     *                                expensive and should only be true when userAddon is
     *                                transient. See LEP-5473 for a detailed discussion of this
     *                                method.
     * @return                true if the portlet can be displayed via Ajax
     */
    public static pl.mamzdanie.useraddon.svc.model.UserAddon update(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon, boolean merge)
        throws com.liferay.portal.SystemException {
        return getPersistence().update(userAddon, merge);
    }

    public static pl.mamzdanie.useraddon.svc.model.UserAddon updateImpl(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon, boolean merge)
        throws com.liferay.portal.SystemException {
        return getPersistence().updateImpl(userAddon, merge);
    }

    public static pl.mamzdanie.useraddon.svc.model.UserAddon findByPrimaryKey(
        long userId)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.useraddon.svc.NoSuchUserAddonException {
        return getPersistence().findByPrimaryKey(userId);
    }

    public static pl.mamzdanie.useraddon.svc.model.UserAddon fetchByPrimaryKey(
        long userId) throws com.liferay.portal.SystemException {
        return getPersistence().fetchByPrimaryKey(userId);
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

    public static java.util.List<pl.mamzdanie.useraddon.svc.model.UserAddon> findAll()
        throws com.liferay.portal.SystemException {
        return getPersistence().findAll();
    }

    public static java.util.List<pl.mamzdanie.useraddon.svc.model.UserAddon> findAll(
        int start, int end) throws com.liferay.portal.SystemException {
        return getPersistence().findAll(start, end);
    }

    public static java.util.List<pl.mamzdanie.useraddon.svc.model.UserAddon> findAll(
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

    public static UserAddonPersistence getPersistence() {
        return _persistence;
    }

    public void setPersistence(UserAddonPersistence persistence) {
        _persistence = persistence;
    }
}
