package pl.mamzdanie.threaddetail.svc.service.persistence;

public class ThreadDetailUtil {
    private static ThreadDetailPersistence _persistence;

    public static void cacheResult(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail) {
        getPersistence().cacheResult(threadDetail);
    }

    public static void cacheResult(
        java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> threadDetails) {
        getPersistence().cacheResult(threadDetails);
    }

    public static void clearCache() {
        getPersistence().clearCache();
    }

    public static pl.mamzdanie.threaddetail.svc.model.ThreadDetail create(
        long rootMessageId) {
        return getPersistence().create(rootMessageId);
    }

    public static pl.mamzdanie.threaddetail.svc.model.ThreadDetail remove(
        long rootMessageId)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.threaddetail.svc.NoSuchThreadDetailException {
        return getPersistence().remove(rootMessageId);
    }

    public static pl.mamzdanie.threaddetail.svc.model.ThreadDetail remove(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail)
        throws com.liferay.portal.SystemException {
        return getPersistence().remove(threadDetail);
    }

    /**
     * @deprecated Use <code>update(ThreadDetail threadDetail, boolean merge)</code>.
     */
    public static pl.mamzdanie.threaddetail.svc.model.ThreadDetail update(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail)
        throws com.liferay.portal.SystemException {
        return getPersistence().update(threadDetail);
    }

    /**
     * Add, update, or merge, the entity. This method also calls the model
     * listeners to trigger the proper events associated with adding, deleting,
     * or updating an entity.
     *
     * @param                threadDetail the entity to add, update, or merge
     * @param                merge boolean value for whether to merge the entity. The
     *                                default value is false. Setting merge to true is more
     *                                expensive and should only be true when threadDetail is
     *                                transient. See LEP-5473 for a detailed discussion of this
     *                                method.
     * @return                true if the portlet can be displayed via Ajax
     */
    public static pl.mamzdanie.threaddetail.svc.model.ThreadDetail update(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail,
        boolean merge) throws com.liferay.portal.SystemException {
        return getPersistence().update(threadDetail, merge);
    }

    public static pl.mamzdanie.threaddetail.svc.model.ThreadDetail updateImpl(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail,
        boolean merge) throws com.liferay.portal.SystemException {
        return getPersistence().updateImpl(threadDetail, merge);
    }

    public static pl.mamzdanie.threaddetail.svc.model.ThreadDetail findByPrimaryKey(
        long rootMessageId)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.threaddetail.svc.NoSuchThreadDetailException {
        return getPersistence().findByPrimaryKey(rootMessageId);
    }

    public static pl.mamzdanie.threaddetail.svc.model.ThreadDetail fetchByPrimaryKey(
        long rootMessageId) throws com.liferay.portal.SystemException {
        return getPersistence().fetchByPrimaryKey(rootMessageId);
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

    public static java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> findAll()
        throws com.liferay.portal.SystemException {
        return getPersistence().findAll();
    }

    public static java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> findAll(
        int start, int end) throws com.liferay.portal.SystemException {
        return getPersistence().findAll(start, end);
    }

    public static java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> findAll(
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

    public static ThreadDetailPersistence getPersistence() {
        return _persistence;
    }

    public void setPersistence(ThreadDetailPersistence persistence) {
        _persistence = persistence;
    }
}
