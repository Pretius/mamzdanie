package pl.mamzdanie.threaddetail.svc.service.persistence;

import com.liferay.portal.service.persistence.BasePersistence;


public interface ThreadDetailPersistence extends BasePersistence {
    public void cacheResult(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail);

    public void cacheResult(
        java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> threadDetails);

    public void clearCache();

    public pl.mamzdanie.threaddetail.svc.model.ThreadDetail create(
        long rootMessageId);

    public pl.mamzdanie.threaddetail.svc.model.ThreadDetail remove(
        long rootMessageId)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.threaddetail.svc.NoSuchThreadDetailException;

    public pl.mamzdanie.threaddetail.svc.model.ThreadDetail remove(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail)
        throws com.liferay.portal.SystemException;

    /**
     * @deprecated Use <code>update(ThreadDetail threadDetail, boolean merge)</code>.
     */
    public pl.mamzdanie.threaddetail.svc.model.ThreadDetail update(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail)
        throws com.liferay.portal.SystemException;

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
    public pl.mamzdanie.threaddetail.svc.model.ThreadDetail update(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail,
        boolean merge) throws com.liferay.portal.SystemException;

    public pl.mamzdanie.threaddetail.svc.model.ThreadDetail updateImpl(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail,
        boolean merge) throws com.liferay.portal.SystemException;

    public pl.mamzdanie.threaddetail.svc.model.ThreadDetail findByPrimaryKey(
        long rootMessageId)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.threaddetail.svc.NoSuchThreadDetailException;

    public pl.mamzdanie.threaddetail.svc.model.ThreadDetail fetchByPrimaryKey(
        long rootMessageId) throws com.liferay.portal.SystemException;

    public java.util.List<Object> findWithDynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
        throws com.liferay.portal.SystemException;

    public java.util.List<Object> findWithDynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
        int end) throws com.liferay.portal.SystemException;

    public java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> findAll()
        throws com.liferay.portal.SystemException;

    public java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> findAll(
        int start, int end) throws com.liferay.portal.SystemException;

    public java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> findAll(
        int start, int end, com.liferay.portal.kernel.util.OrderByComparator obc)
        throws com.liferay.portal.SystemException;

    public void removeAll() throws com.liferay.portal.SystemException;

    public int countAll() throws com.liferay.portal.SystemException;
}
