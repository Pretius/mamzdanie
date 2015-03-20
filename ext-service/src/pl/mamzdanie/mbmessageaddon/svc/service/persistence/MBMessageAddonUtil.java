package pl.mamzdanie.mbmessageaddon.svc.service.persistence;

public class MBMessageAddonUtil {
    private static MBMessageAddonPersistence _persistence;

    public static void cacheResult(
        pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon mbMessageAddon) {
        getPersistence().cacheResult(mbMessageAddon);
    }

    public static void cacheResult(
        java.util.List<pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon> mbMessageAddons) {
        getPersistence().cacheResult(mbMessageAddons);
    }

    public static void clearCache() {
        getPersistence().clearCache();
    }

    public static pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon create(
        java.lang.Long messageId) {
        return getPersistence().create(messageId);
    }

    public static pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon remove(
        java.lang.Long messageId)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.mbmessageaddon.svc.NoSuchMBMessageAddonException {
        return getPersistence().remove(messageId);
    }

    public static pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon remove(
        pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon mbMessageAddon)
        throws com.liferay.portal.SystemException {
        return getPersistence().remove(mbMessageAddon);
    }

    /**
     * @deprecated Use <code>update(MBMessageAddon mbMessageAddon, boolean merge)</code>.
     */
    public static pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon update(
        pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon mbMessageAddon)
        throws com.liferay.portal.SystemException {
        return getPersistence().update(mbMessageAddon);
    }

    /**
     * Add, update, or merge, the entity. This method also calls the model
     * listeners to trigger the proper events associated with adding, deleting,
     * or updating an entity.
     *
     * @param                mbMessageAddon the entity to add, update, or merge
     * @param                merge boolean value for whether to merge the entity. The
     *                                default value is false. Setting merge to true is more
     *                                expensive and should only be true when mbMessageAddon is
     *                                transient. See LEP-5473 for a detailed discussion of this
     *                                method.
     * @return                true if the portlet can be displayed via Ajax
     */
    public static pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon update(
        pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon mbMessageAddon,
        boolean merge) throws com.liferay.portal.SystemException {
        return getPersistence().update(mbMessageAddon, merge);
    }

    public static pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon updateImpl(
        pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon mbMessageAddon,
        boolean merge) throws com.liferay.portal.SystemException {
        return getPersistence().updateImpl(mbMessageAddon, merge);
    }

    public static pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon findByPrimaryKey(
        java.lang.Long messageId)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.mbmessageaddon.svc.NoSuchMBMessageAddonException {
        return getPersistence().findByPrimaryKey(messageId);
    }

    public static pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon fetchByPrimaryKey(
        java.lang.Long messageId) throws com.liferay.portal.SystemException {
        return getPersistence().fetchByPrimaryKey(messageId);
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

    public static java.util.List<pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon> findAll()
        throws com.liferay.portal.SystemException {
        return getPersistence().findAll();
    }

    public static java.util.List<pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon> findAll(
        int start, int end) throws com.liferay.portal.SystemException {
        return getPersistence().findAll(start, end);
    }

    public static java.util.List<pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon> findAll(
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

    public static MBMessageAddonPersistence getPersistence() {
        return _persistence;
    }

    public void setPersistence(MBMessageAddonPersistence persistence) {
        _persistence = persistence;
    }
}
