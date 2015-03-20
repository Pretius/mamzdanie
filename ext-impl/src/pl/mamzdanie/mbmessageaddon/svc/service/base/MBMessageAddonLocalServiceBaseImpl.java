package pl.mamzdanie.mbmessageaddon.svc.service.base;

import com.liferay.portal.PortalException;
import com.liferay.portal.SystemException;
import com.liferay.portal.kernel.annotation.BeanReference;
import com.liferay.portal.kernel.dao.orm.DynamicQuery;
import com.liferay.portal.util.PortalUtil;

import pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon;
import pl.mamzdanie.mbmessageaddon.svc.service.MBMessageAddonLocalService;
import pl.mamzdanie.mbmessageaddon.svc.service.persistence.MBMessageAddonPersistence;

import java.util.List;


public abstract class MBMessageAddonLocalServiceBaseImpl
    implements MBMessageAddonLocalService {
    @BeanReference(name = "pl.mamzdanie.mbmessageaddon.svc.service.MBMessageAddonLocalService.impl")
    protected MBMessageAddonLocalService mbMessageAddonLocalService;
    @BeanReference(name = "pl.mamzdanie.mbmessageaddon.svc.service.persistence.MBMessageAddonPersistence.impl")
    protected MBMessageAddonPersistence mbMessageAddonPersistence;

    public MBMessageAddon addMBMessageAddon(MBMessageAddon mbMessageAddon)
        throws SystemException {
        mbMessageAddon.setNew(true);

        return mbMessageAddonPersistence.update(mbMessageAddon, false);
    }

    public MBMessageAddon createMBMessageAddon(Long messageId) {
        return mbMessageAddonPersistence.create(messageId);
    }

    public void deleteMBMessageAddon(Long messageId)
        throws PortalException, SystemException {
        mbMessageAddonPersistence.remove(messageId);
    }

    public void deleteMBMessageAddon(MBMessageAddon mbMessageAddon)
        throws SystemException {
        mbMessageAddonPersistence.remove(mbMessageAddon);
    }

    public List<Object> dynamicQuery(DynamicQuery dynamicQuery)
        throws SystemException {
        return mbMessageAddonPersistence.findWithDynamicQuery(dynamicQuery);
    }

    public List<Object> dynamicQuery(DynamicQuery dynamicQuery, int start,
        int end) throws SystemException {
        return mbMessageAddonPersistence.findWithDynamicQuery(dynamicQuery,
            start, end);
    }

    public MBMessageAddon getMBMessageAddon(Long messageId)
        throws PortalException, SystemException {
        return mbMessageAddonPersistence.findByPrimaryKey(messageId);
    }

    public List<MBMessageAddon> getMBMessageAddons(int start, int end)
        throws SystemException {
        return mbMessageAddonPersistence.findAll(start, end);
    }

    public int getMBMessageAddonsCount() throws SystemException {
        return mbMessageAddonPersistence.countAll();
    }

    public MBMessageAddon updateMBMessageAddon(MBMessageAddon mbMessageAddon)
        throws SystemException {
        mbMessageAddon.setNew(false);

        return mbMessageAddonPersistence.update(mbMessageAddon, true);
    }

    public MBMessageAddon updateMBMessageAddon(MBMessageAddon mbMessageAddon,
        boolean merge) throws SystemException {
        mbMessageAddon.setNew(false);

        return mbMessageAddonPersistence.update(mbMessageAddon, merge);
    }

    public MBMessageAddonLocalService getMBMessageAddonLocalService() {
        return mbMessageAddonLocalService;
    }

    public void setMBMessageAddonLocalService(
        MBMessageAddonLocalService mbMessageAddonLocalService) {
        this.mbMessageAddonLocalService = mbMessageAddonLocalService;
    }

    public MBMessageAddonPersistence getMBMessageAddonPersistence() {
        return mbMessageAddonPersistence;
    }

    public void setMBMessageAddonPersistence(
        MBMessageAddonPersistence mbMessageAddonPersistence) {
        this.mbMessageAddonPersistence = mbMessageAddonPersistence;
    }

    protected void runSQL(String sql) throws SystemException {
        try {
            PortalUtil.runSQL(sql);
        } catch (Exception e) {
            throw new SystemException(e);
        }
    }
}
