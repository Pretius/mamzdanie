package pl.mamzdanie.mbthreadaddon.svc.service.persistence;

public class MBAddonUtil {
    private static MBAddonPersistence _persistence;

    public static void cacheResult(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon) {
        getPersistence().cacheResult(mbAddon);
    }

    public static void cacheResult(
        java.util.List<pl.mamzdanie.mbthreadaddon.svc.model.MBAddon> mbAddons) {
        getPersistence().cacheResult(mbAddons);
    }

    public static void clearCache() {
        getPersistence().clearCache();
    }

    public static pl.mamzdanie.mbthreadaddon.svc.model.MBAddon create(
        long threadId) {
        return getPersistence().create(threadId);
    }

    public static pl.mamzdanie.mbthreadaddon.svc.model.MBAddon remove(
        long threadId)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.mbthreadaddon.svc.NoSuchMBAddonException {
        return getPersistence().remove(threadId);
    }

    public static pl.mamzdanie.mbthreadaddon.svc.model.MBAddon remove(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon)
        throws com.liferay.portal.SystemException {
        return getPersistence().remove(mbAddon);
    }

    /**
     * @deprecated Use <code>update(MBAddon mbAddon, boolean merge)</code>.
     */
    public static pl.mamzdanie.mbthreadaddon.svc.model.MBAddon update(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon)
        throws com.liferay.portal.SystemException {
        return getPersistence().update(mbAddon);
    }

    /**
     * Add, update, or merge, the entity. This method also calls the model
     * listeners to trigger the proper events associated with adding, deleting,
     * or updating an entity.
     *
     * @param                mbAddon the entity to add, update, or merge
     * @param                merge boolean value for whether to merge the entity. The
     *                                default value is false. Setting merge to true is more
     *                                expensive and should only be true when mbAddon is
     *                                transient. See LEP-5473 for a detailed discussion of this
     *                                method.
     * @return                true if the portlet can be displayed via Ajax
     */
    public static pl.mamzdanie.mbthreadaddon.svc.model.MBAddon update(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon, boolean merge)
        throws com.liferay.portal.SystemException {
        return getPersistence().update(mbAddon, merge);
    }

    public static pl.mamzdanie.mbthreadaddon.svc.model.MBAddon updateImpl(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon, boolean merge)
        throws com.liferay.portal.SystemException {
        return getPersistence().updateImpl(mbAddon, merge);
    }

    public static pl.mamzdanie.mbthreadaddon.svc.model.MBAddon findByPrimaryKey(
        long threadId)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.mbthreadaddon.svc.NoSuchMBAddonException {
        return getPersistence().findByPrimaryKey(threadId);
    }

    public static pl.mamzdanie.mbthreadaddon.svc.model.MBAddon fetchByPrimaryKey(
        long threadId) throws com.liferay.portal.SystemException {
        return getPersistence().fetchByPrimaryKey(threadId);
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

    public static java.util.List<pl.mamzdanie.mbthreadaddon.svc.model.MBAddon> findAll()
        throws com.liferay.portal.SystemException {
        return getPersistence().findAll();
    }

    public static java.util.List<pl.mamzdanie.mbthreadaddon.svc.model.MBAddon> findAll(
        int start, int end) throws com.liferay.portal.SystemException {
        return getPersistence().findAll(start, end);
    }

    public static java.util.List<pl.mamzdanie.mbthreadaddon.svc.model.MBAddon> findAll(
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

    public static MBAddonPersistence getPersistence() {
        return _persistence;
    }

    public void setPersistence(MBAddonPersistence persistence) {
        _persistence = persistence;
    }
}
