package pl.mamzdanie.mbthreadaddon.svc.service.base;

import com.liferay.portal.PortalException;
import com.liferay.portal.SystemException;
import com.liferay.portal.kernel.annotation.BeanReference;
import com.liferay.portal.kernel.dao.orm.DynamicQuery;
import com.liferay.portal.util.PortalUtil;

import pl.mamzdanie.mbthreadaddon.svc.model.MBAddon;
import pl.mamzdanie.mbthreadaddon.svc.service.MBAddonLocalService;
import pl.mamzdanie.mbthreadaddon.svc.service.persistence.MBAddonPersistence;

import java.util.List;


public abstract class MBAddonLocalServiceBaseImpl implements MBAddonLocalService {
    @BeanReference(name = "pl.mamzdanie.mbthreadaddon.svc.service.MBAddonLocalService.impl")
    protected MBAddonLocalService mbAddonLocalService;
    @BeanReference(name = "pl.mamzdanie.mbthreadaddon.svc.service.persistence.MBAddonPersistence.impl")
    protected MBAddonPersistence mbAddonPersistence;

    public MBAddon addMBAddon(MBAddon mbAddon) throws SystemException {
        mbAddon.setNew(true);

        return mbAddonPersistence.update(mbAddon, false);
    }

    public MBAddon createMBAddon(long threadId) {
        return mbAddonPersistence.create(threadId);
    }

    public void deleteMBAddon(long threadId)
        throws PortalException, SystemException {
        mbAddonPersistence.remove(threadId);
    }

    public void deleteMBAddon(MBAddon mbAddon) throws SystemException {
        mbAddonPersistence.remove(mbAddon);
    }

    public List<Object> dynamicQuery(DynamicQuery dynamicQuery)
        throws SystemException {
        return mbAddonPersistence.findWithDynamicQuery(dynamicQuery);
    }

    public List<Object> dynamicQuery(DynamicQuery dynamicQuery, int start,
        int end) throws SystemException {
        return mbAddonPersistence.findWithDynamicQuery(dynamicQuery, start, end);
    }

    public MBAddon getMBAddon(long threadId)
        throws PortalException, SystemException {
        return mbAddonPersistence.findByPrimaryKey(threadId);
    }

    public List<MBAddon> getMBAddons(int start, int end)
        throws SystemException {
        return mbAddonPersistence.findAll(start, end);
    }

    public int getMBAddonsCount() throws SystemException {
        return mbAddonPersistence.countAll();
    }

    public MBAddon updateMBAddon(MBAddon mbAddon) throws SystemException {
        mbAddon.setNew(false);

        return mbAddonPersistence.update(mbAddon, true);
    }

    public MBAddon updateMBAddon(MBAddon mbAddon, boolean merge)
        throws SystemException {
        mbAddon.setNew(false);

        return mbAddonPersistence.update(mbAddon, merge);
    }

    public MBAddonLocalService getMBAddonLocalService() {
        return mbAddonLocalService;
    }

    public void setMBAddonLocalService(MBAddonLocalService mbAddonLocalService) {
        this.mbAddonLocalService = mbAddonLocalService;
    }

    public MBAddonPersistence getMBAddonPersistence() {
        return mbAddonPersistence;
    }

    public void setMBAddonPersistence(MBAddonPersistence mbAddonPersistence) {
        this.mbAddonPersistence = mbAddonPersistence;
    }

    protected void runSQL(String sql) throws SystemException {
        try {
            PortalUtil.runSQL(sql);
        } catch (Exception e) {
            throw new SystemException(e);
        }
    }
}
