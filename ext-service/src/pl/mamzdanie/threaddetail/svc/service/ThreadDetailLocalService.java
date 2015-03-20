package pl.mamzdanie.threaddetail.svc.service;

import com.liferay.portal.PortalException;
import com.liferay.portal.SystemException;
import com.liferay.portal.kernel.annotation.Isolation;
import com.liferay.portal.kernel.annotation.Propagation;
import com.liferay.portal.kernel.annotation.Transactional;


/**
 * <a href="ThreadDetailLocalService.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This interface defines the service. The default implementation is
 * <code>pl.mamzdanie.threaddetail.svc.service.impl.ThreadDetailLocalServiceImpl</code>.
 * Modify methods in that class and rerun ServiceBuilder to populate this class
 * and all other generated classes.
 * </p>
 *
 * <p>
 * This is a local service. Methods of this service will not have security checks based on the propagated JAAS credentials because this service can only be accessed from within the same VM.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.threaddetail.svc.service.ThreadDetailLocalServiceUtil
 *
 */
@Transactional(isolation = Isolation.PORTAL, rollbackFor =  {
    PortalException.class, SystemException.class}
)
public interface ThreadDetailLocalService {
    public pl.mamzdanie.threaddetail.svc.model.ThreadDetail addThreadDetail(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail)
        throws com.liferay.portal.SystemException;

    public pl.mamzdanie.threaddetail.svc.model.ThreadDetail createThreadDetail(
        long rootMessageId);

    public void deleteThreadDetail(long rootMessageId)
        throws com.liferay.portal.SystemException,
            com.liferay.portal.PortalException;

    public void deleteThreadDetail(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail)
        throws com.liferay.portal.SystemException;

    public java.util.List<Object> dynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
        throws com.liferay.portal.SystemException;

    public java.util.List<Object> dynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
        int end) throws com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public pl.mamzdanie.threaddetail.svc.model.ThreadDetail getThreadDetail(
        long rootMessageId)
        throws com.liferay.portal.SystemException,
            com.liferay.portal.PortalException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> getThreadDetails(
        int start, int end) throws com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public int getThreadDetailsCount()
        throws com.liferay.portal.SystemException;

    public pl.mamzdanie.threaddetail.svc.model.ThreadDetail updateThreadDetail(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail)
        throws com.liferay.portal.SystemException;

    public pl.mamzdanie.threaddetail.svc.model.ThreadDetail updateThreadDetail(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail,
        boolean merge) throws com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public pl.mamzdanie.threaddetail.svc.model.ThreadDetail getThreadDetailByThreadId(
        long threadId) throws com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> getThreadDetails(
        boolean active, int start, int end, java.lang.String orderByParam,
        boolean asc, com.liferay.portal.model.User user, boolean userFilter)
        throws com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public int getThreadDetailsCount(boolean active,
        com.liferay.portal.model.User user)
        throws com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> getLastClosedThreadDetails(
        int start, int end, com.liferay.portal.model.User user)
        throws com.liferay.portal.SystemException;
    
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> getPendingThreadDetails(
        int start, int end, com.liferay.portal.model.User user)
        throws com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public int getLastClosedThreadDetailsCount(
        com.liferay.portal.model.User user)
        throws com.liferay.portal.SystemException;
    
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public int getPendingThreadDetailsCount(
        com.liferay.portal.model.User user)
        throws com.liferay.portal.SystemException;

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> getSummaryRemindCandidates()
        throws com.liferay.portal.SystemException;
}
