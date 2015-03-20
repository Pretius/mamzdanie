package pl.mamzdanie.threaddetail.svc.service.base;

import com.liferay.portal.PortalException;
import com.liferay.portal.SystemException;
import com.liferay.portal.kernel.annotation.BeanReference;
import com.liferay.portal.kernel.dao.orm.DynamicQuery;
import com.liferay.portal.util.PortalUtil;

import pl.mamzdanie.threaddetail.svc.model.ThreadDetail;
import pl.mamzdanie.threaddetail.svc.service.ThreadDetailLocalService;
import pl.mamzdanie.threaddetail.svc.service.persistence.ThreadDetailPersistence;

import java.util.List;


public abstract class ThreadDetailLocalServiceBaseImpl
    implements ThreadDetailLocalService {
    @BeanReference(name = "pl.mamzdanie.threaddetail.svc.service.ThreadDetailLocalService.impl")
    protected ThreadDetailLocalService threadDetailLocalService;
    @BeanReference(name = "pl.mamzdanie.threaddetail.svc.service.persistence.ThreadDetailPersistence.impl")
    protected ThreadDetailPersistence threadDetailPersistence;

    public ThreadDetail addThreadDetail(ThreadDetail threadDetail)
        throws SystemException {
        threadDetail.setNew(true);

        return threadDetailPersistence.update(threadDetail, false);
    }

    public ThreadDetail createThreadDetail(long rootMessageId) {
        return threadDetailPersistence.create(rootMessageId);
    }

    public void deleteThreadDetail(long rootMessageId)
        throws PortalException, SystemException {
        threadDetailPersistence.remove(rootMessageId);
    }

    public void deleteThreadDetail(ThreadDetail threadDetail)
        throws SystemException {
        threadDetailPersistence.remove(threadDetail);
    }

    public List<Object> dynamicQuery(DynamicQuery dynamicQuery)
        throws SystemException {
        return threadDetailPersistence.findWithDynamicQuery(dynamicQuery);
    }

    public List<Object> dynamicQuery(DynamicQuery dynamicQuery, int start,
        int end) throws SystemException {
        return threadDetailPersistence.findWithDynamicQuery(dynamicQuery,
            start, end);
    }

    public ThreadDetail getThreadDetail(long rootMessageId)
        throws PortalException, SystemException {
        return threadDetailPersistence.findByPrimaryKey(rootMessageId);
    }

    public List<ThreadDetail> getThreadDetails(int start, int end)
        throws SystemException {
        return threadDetailPersistence.findAll(start, end);
    }

    public int getThreadDetailsCount() throws SystemException {
        return threadDetailPersistence.countAll();
    }

    public ThreadDetail updateThreadDetail(ThreadDetail threadDetail)
        throws SystemException {
        threadDetail.setNew(false);

        return threadDetailPersistence.update(threadDetail, true);
    }

    public ThreadDetail updateThreadDetail(ThreadDetail threadDetail,
        boolean merge) throws SystemException {
        threadDetail.setNew(false);

        return threadDetailPersistence.update(threadDetail, merge);
    }

    public ThreadDetailLocalService getThreadDetailLocalService() {
        return threadDetailLocalService;
    }

    public void setThreadDetailLocalService(
        ThreadDetailLocalService threadDetailLocalService) {
        this.threadDetailLocalService = threadDetailLocalService;
    }

    public ThreadDetailPersistence getThreadDetailPersistence() {
        return threadDetailPersistence;
    }

    public void setThreadDetailPersistence(
        ThreadDetailPersistence threadDetailPersistence) {
        this.threadDetailPersistence = threadDetailPersistence;
    }

    protected void runSQL(String sql) throws SystemException {
        try {
            PortalUtil.runSQL(sql);
        } catch (Exception e) {
            throw new SystemException(e);
        }
    }
}
