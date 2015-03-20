package pl.mamzdanie.mbthreadaddon.svc.service.persistence;

import com.liferay.portal.service.persistence.BasePersistence;


public interface MBAddonPersistence extends BasePersistence {
    public void cacheResult(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon);

    public void cacheResult(
        java.util.List<pl.mamzdanie.mbthreadaddon.svc.model.MBAddon> mbAddons);

    public void clearCache();

    public pl.mamzdanie.mbthreadaddon.svc.model.MBAddon create(long threadId);

    public pl.mamzdanie.mbthreadaddon.svc.model.MBAddon remove(long threadId)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.mbthreadaddon.svc.NoSuchMBAddonException;

    public pl.mamzdanie.mbthreadaddon.svc.model.MBAddon remove(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon)
        throws com.liferay.portal.SystemException;

    /**
     * @deprecated Use <code>update(MBAddon mbAddon, boolean merge)</code>.
     */
    public pl.mamzdanie.mbthreadaddon.svc.model.MBAddon update(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon)
        throws com.liferay.portal.SystemException;

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
    public pl.mamzdanie.mbthreadaddon.svc.model.MBAddon update(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon, boolean merge)
        throws com.liferay.portal.SystemException;

    public pl.mamzdanie.mbthreadaddon.svc.model.MBAddon updateImpl(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon, boolean merge)
        throws com.liferay.portal.SystemException;

    public pl.mamzdanie.mbthreadaddon.svc.model.MBAddon findByPrimaryKey(
        long threadId)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.mbthreadaddon.svc.NoSuchMBAddonException;

    public pl.mamzdanie.mbthreadaddon.svc.model.MBAddon fetchByPrimaryKey(
        long threadId) throws com.liferay.portal.SystemException;

    public java.util.List<Object> findWithDynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
        throws com.liferay.portal.SystemException;

    public java.util.List<Object> findWithDynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
        int end) throws com.liferay.portal.SystemException;

    public java.util.List<pl.mamzdanie.mbthreadaddon.svc.model.MBAddon> findAll()
        throws com.liferay.portal.SystemException;

    public java.util.List<pl.mamzdanie.mbthreadaddon.svc.model.MBAddon> findAll(
        int start, int end) throws com.liferay.portal.SystemException;

    public java.util.List<pl.mamzdanie.mbthreadaddon.svc.model.MBAddon> findAll(
        int start, int end, com.liferay.portal.kernel.util.OrderByComparator obc)
        throws com.liferay.portal.SystemException;

    public void removeAll() throws com.liferay.portal.SystemException;

    public int countAll() throws com.liferay.portal.SystemException;
}
