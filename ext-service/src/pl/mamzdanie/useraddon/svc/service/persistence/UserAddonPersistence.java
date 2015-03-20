package pl.mamzdanie.useraddon.svc.service.persistence;

import com.liferay.portal.service.persistence.BasePersistence;


public interface UserAddonPersistence extends BasePersistence {
    public void cacheResult(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon);

    public void cacheResult(
        java.util.List<pl.mamzdanie.useraddon.svc.model.UserAddon> userAddons);

    public void clearCache();

    public pl.mamzdanie.useraddon.svc.model.UserAddon create(long userId);

    public pl.mamzdanie.useraddon.svc.model.UserAddon remove(long userId)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.useraddon.svc.NoSuchUserAddonException;

    public pl.mamzdanie.useraddon.svc.model.UserAddon remove(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon)
        throws com.liferay.portal.SystemException;

    /**
     * @deprecated Use <code>update(UserAddon userAddon, boolean merge)</code>.
     */
    public pl.mamzdanie.useraddon.svc.model.UserAddon update(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon)
        throws com.liferay.portal.SystemException;

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
    public pl.mamzdanie.useraddon.svc.model.UserAddon update(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon, boolean merge)
        throws com.liferay.portal.SystemException;

    public pl.mamzdanie.useraddon.svc.model.UserAddon updateImpl(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon, boolean merge)
        throws com.liferay.portal.SystemException;

    public pl.mamzdanie.useraddon.svc.model.UserAddon findByPrimaryKey(
        long userId)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.useraddon.svc.NoSuchUserAddonException;

    public pl.mamzdanie.useraddon.svc.model.UserAddon fetchByPrimaryKey(
        long userId) throws com.liferay.portal.SystemException;

    public java.util.List<Object> findWithDynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
        throws com.liferay.portal.SystemException;

    public java.util.List<Object> findWithDynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
        int end) throws com.liferay.portal.SystemException;

    public java.util.List<pl.mamzdanie.useraddon.svc.model.UserAddon> findAll()
        throws com.liferay.portal.SystemException;

    public java.util.List<pl.mamzdanie.useraddon.svc.model.UserAddon> findAll(
        int start, int end) throws com.liferay.portal.SystemException;

    public java.util.List<pl.mamzdanie.useraddon.svc.model.UserAddon> findAll(
        int start, int end, com.liferay.portal.kernel.util.OrderByComparator obc)
        throws com.liferay.portal.SystemException;

    public void removeAll() throws com.liferay.portal.SystemException;

    public int countAll() throws com.liferay.portal.SystemException;
}
