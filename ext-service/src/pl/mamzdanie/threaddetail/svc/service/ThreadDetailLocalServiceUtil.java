package pl.mamzdanie.threaddetail.svc.service;


/**
 * <a href="ThreadDetailLocalServiceUtil.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This class provides static methods for the
 * <code>pl.mamzdanie.threaddetail.svc.service.ThreadDetailLocalService</code>
 * bean. The static methods of this class calls the same methods of the bean
 * instance. It's convenient to be able to just write one line to call a method
 * on a bean instead of writing a lookup call and a method call.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.threaddetail.svc.service.ThreadDetailLocalService
 *
 */
public class ThreadDetailLocalServiceUtil {
    private static ThreadDetailLocalService _service;

    public static pl.mamzdanie.threaddetail.svc.model.ThreadDetail addThreadDetail(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail)
        throws com.liferay.portal.SystemException {
        return getService().addThreadDetail(threadDetail);
    }

    public static pl.mamzdanie.threaddetail.svc.model.ThreadDetail createThreadDetail(
        long rootMessageId) {
        return getService().createThreadDetail(rootMessageId);
    }

    public static void deleteThreadDetail(long rootMessageId)
        throws com.liferay.portal.PortalException,
            com.liferay.portal.SystemException {
        getService().deleteThreadDetail(rootMessageId);
    }

    public static void deleteThreadDetail(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail)
        throws com.liferay.portal.SystemException {
        getService().deleteThreadDetail(threadDetail);
    }

    public static java.util.List<Object> dynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
        throws com.liferay.portal.SystemException {
        return getService().dynamicQuery(dynamicQuery);
    }

    public static java.util.List<Object> dynamicQuery(
        com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
        int end) throws com.liferay.portal.SystemException {
        return getService().dynamicQuery(dynamicQuery, start, end);
    }

    public static pl.mamzdanie.threaddetail.svc.model.ThreadDetail getThreadDetail(
        long rootMessageId)
        throws com.liferay.portal.PortalException,
            com.liferay.portal.SystemException {
        return getService().getThreadDetail(rootMessageId);
    }

    public static java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> getThreadDetails(
        int start, int end) throws com.liferay.portal.SystemException {
        return getService().getThreadDetails(start, end);
    }

    public static int getThreadDetailsCount()
        throws com.liferay.portal.SystemException {
        return getService().getThreadDetailsCount();
    }

    public static pl.mamzdanie.threaddetail.svc.model.ThreadDetail updateThreadDetail(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail)
        throws com.liferay.portal.SystemException {
        return getService().updateThreadDetail(threadDetail);
    }

    public static pl.mamzdanie.threaddetail.svc.model.ThreadDetail updateThreadDetail(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail,
        boolean merge) throws com.liferay.portal.SystemException {
        return getService().updateThreadDetail(threadDetail, merge);
    }

    public static pl.mamzdanie.threaddetail.svc.model.ThreadDetail getThreadDetailByThreadId(
        long threadId) throws com.liferay.portal.SystemException {
        return getService().getThreadDetailByThreadId(threadId);
    }

    public static java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> getThreadDetails(
        boolean active, int start, int end, java.lang.String orderByParam,
        boolean asc, com.liferay.portal.model.User user, boolean userFilter)
        throws com.liferay.portal.SystemException {
        return getService()
                   .getThreadDetails(active, start, end, orderByParam, asc,
            user, userFilter);
    }

    public static int getThreadDetailsCount(boolean active,
        com.liferay.portal.model.User user)
        throws com.liferay.portal.SystemException {
        return getService().getThreadDetailsCount(active, user);
    }

    public static java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> getLastClosedThreadDetails(
        int start, int end, com.liferay.portal.model.User user)
        throws com.liferay.portal.SystemException {
        return getService().getLastClosedThreadDetails(start, end, user);
    }
    
    public static java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> getPendingThreadDetails(
            int start, int end, com.liferay.portal.model.User user)
            throws com.liferay.portal.SystemException {
            return getService().getPendingThreadDetails(start, end, user);
        }

    public static int getLastClosedThreadDetailsCount(
        com.liferay.portal.model.User user)
        throws com.liferay.portal.SystemException {
        return getService().getLastClosedThreadDetailsCount(user);
    }
    
    public static int getPendingThreadDetailsCount(
            com.liferay.portal.model.User user)
            throws com.liferay.portal.SystemException {
            return getService().getPendingThreadDetailsCount(user);
        }

    public static java.util.List<pl.mamzdanie.threaddetail.svc.model.ThreadDetail> getSummaryRemindCandidates()
        throws com.liferay.portal.SystemException {
        return getService().getSummaryRemindCandidates();
    }

    public static ThreadDetailLocalService getService() {
        if (_service == null) {
            throw new RuntimeException("ThreadDetailLocalService is not set");
        }

        return _service;
    }

    public void setService(ThreadDetailLocalService service) {
        _service = service;
    }
}
