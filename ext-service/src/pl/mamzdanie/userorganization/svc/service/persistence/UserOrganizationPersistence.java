package pl.mamzdanie.userorganization.svc.service.persistence;

import com.liferay.portal.service.persistence.BasePersistence;


public interface UserOrganizationPersistence extends BasePersistence {
    public void cacheResult(
        pl.mamzdanie.userorganization.svc.model.UserOrganization userOrganization);

    public void cacheResult(
        java.util.List<pl.mamzdanie.userorganization.svc.model.UserOrganization> userOrganizations);

    public void clearCache();

    public pl.mamzdanie.userorganization.svc.model.UserOrganization create(
        long id);

    public pl.mamzdanie.userorganization.svc.model.UserOrganization remove(
        long id)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.userorganization.svc.NoSuchUserOrganizationException;

    public pl.mamzdanie.userorganization.svc.model.UserOrganization remove(
        pl.mamzdanie.userorganization.svc.model.UserOrganization userOrganization)
        throws com.liferay.portal.SystemException;

    /**
     * @deprecated Use <code>update(UserOrganization userOrganization, boolean merge)</code>.
     */
    public pl.mamzdanie.userorganization.svc.model.UserOrganization update(
        pl.mamzdanie.userorganization.svc.model.UserOrganization userOrganization)
        throws com.liferay.portal.SystemException;

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
    public pl.mamzdanie.userorganization.svc.model.UserOrganization update(
        pl.mamzdanie.userorganization.svc.model.UserOrganization userOrganization,
        boolean merge) throws com.liferay.portal.SystemException;

    public pl.mamzdanie.userorganization.svc.model.UserOrganization updateImpl(
        pl.mamzdanie.userorganization.svc.model.UserOrganization userOrganization,
        boolean merge) throws com.liferay.portal.SystemException;

    public pl.mamzdanie.userorganization.svc.model.UserOrganization findByPrimaryKey(
        long id)
        throws com.liferay.portal.SystemException,
            pl.mamzdanie.userorganization.svc.NoSuchUserOrganizationException;

    public pl.mamzdanie.userorganization.svc.model.UserOrganization fetchByPrimaryKey(
        long id) throws com.liferay.portal.SystemException;

    public java.util.List<Object> findWithDynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
        throws com.liferay.portal.SystemException;

    public java.util.List<Object> findWithDynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
        int end) throws com.liferay.portal.SystemException;

    public java.util.List<pl.mamzdanie.userorganization.svc.model.UserOrganization> findAll()
        throws com.liferay.portal.SystemException;

    public java.util.List<pl.mamzdanie.userorganization.svc.model.UserOrganization> findAll(
        int start, int end) throws com.liferay.portal.SystemException;

    public java.util.List<pl.mamzdanie.userorganization.svc.model.UserOrganization> findAll(
        int start, int end, com.liferay.portal.kernel.util.OrderByComparator obc)
        throws com.liferay.portal.SystemException;

    public void removeAll() throws com.liferay.portal.SystemException;

    public int countAll() throws com.liferay.portal.SystemException;
}
