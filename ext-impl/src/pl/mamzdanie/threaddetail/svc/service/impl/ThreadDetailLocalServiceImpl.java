package pl.mamzdanie.threaddetail.svc.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import pl.mamzdanie.CommonUtils;
import pl.mamzdanie.threaddetail.svc.model.ThreadDetail;
import pl.mamzdanie.threaddetail.svc.service.base.ThreadDetailLocalServiceBaseImpl;

import com.liferay.ibm.icu.util.Calendar;
import com.liferay.portal.SystemException;
import com.liferay.portal.dao.orm.hibernate.DynamicQueryImpl;
import com.liferay.portal.dao.orm.hibernate.ProjectionImpl;
import com.liferay.portal.kernel.dao.orm.DynamicQuery;
import com.liferay.portal.kernel.dao.orm.DynamicQueryFactoryUtil;
import com.liferay.portal.kernel.dao.orm.RestrictionsFactoryUtil;
import com.liferay.portal.model.User;

public class ThreadDetailLocalServiceImpl extends ThreadDetailLocalServiceBaseImpl {

	public ThreadDetail getThreadDetail(long rootId) throws SystemException {
		DynamicQuery dynamicQuery = DynamicQueryFactoryUtil.forClass(ThreadDetail.class);
		dynamicQuery.add(RestrictionsFactoryUtil.eq("rootMessageId", rootId));

		List<Object> threadDetails = dynamicQuery(dynamicQuery);
		if (threadDetails.size() == 0)
			return null;

		return (ThreadDetail) threadDetails.get(0);
	}

	public ThreadDetail getThreadDetailByThreadId(long threadId) throws SystemException {
		DynamicQuery dynamicQuery = DynamicQueryFactoryUtil.forClass(ThreadDetail.class);
		dynamicQuery.add(RestrictionsFactoryUtil.eq("threadId", threadId));

		List<Object> threadDetails = dynamicQuery(dynamicQuery);
		if (threadDetails.size() == 0)
			return null;

		return (ThreadDetail) threadDetails.get(0);
	}

	public List<ThreadDetail> getThreadDetails(boolean active, int start, int end, String orderByParam, boolean asc, User user,
			boolean userFilter) throws SystemException {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -30);

		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(ThreadDetail.class);
		detachedCriteria.add(Restrictions.eq("active", active ? 1 : 0));

		if (userFilter)
			if (!CommonUtils.isTechnicalAdmin(user))
				detachedCriteria.add(Restrictions.or(Restrictions.eq("accepted", true),
						Restrictions.eq("userId", user.getUserId())));
			else
				detachedCriteria.add(Restrictions.eq("accepted", true));

		if (asc)
			detachedCriteria.addOrder(Order.asc(orderByParam));
		else
			detachedCriteria.addOrder(Order.desc(orderByParam));

		if (!active) {
			detachedCriteria.add(Restrictions.lt("dateTo", cal.getTime()));
		}

		DynamicQuery dynamicQuery = new DynamicQueryImpl(detachedCriteria);
		return CommonUtils.filter(dynamicQuery(dynamicQuery, start, end), ThreadDetail.class);
	}

	public int getThreadDetailsCount(boolean active, User user) throws SystemException {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -30);

		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(ThreadDetail.class);
		detachedCriteria.add(Restrictions.eq("active", active ? 1 : 0));
		if (!CommonUtils.isTechnicalAdmin(user))
			detachedCriteria.add(Restrictions.or(Restrictions.eq("accepted", true), Restrictions.eq("userId", user.getUserId())));
		if (!active) {
			detachedCriteria.add(Restrictions.lt("dateTo", cal.getTime()));
		}

		DynamicQuery dynamicQuery = new DynamicQueryImpl(detachedCriteria);
		dynamicQuery.setProjection(new ProjectionImpl(Projections.rowCount()));
		return (Integer) dynamicQuery(dynamicQuery).get(0);
	}

	public List<ThreadDetail> getLastClosedThreadDetails(int start, int end, User user) throws SystemException {
		Calendar cal = Calendar.getInstance();
		Calendar current = Calendar.getInstance();
		cal.add(Calendar.DATE, -30);

		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(ThreadDetail.class);
		detachedCriteria.add(Restrictions.eq("active", 0));
		detachedCriteria.add(Restrictions.le("dateFrom", current.getTime()));
		detachedCriteria.add(Restrictions.gt("dateTo", cal.getTime()));
		if (!CommonUtils.isTechnicalAdmin(user))
			detachedCriteria.add(Restrictions.or(Restrictions.eq("accepted", true), Restrictions.eq("userId", user.getUserId())));

		detachedCriteria.addOrder(Order.desc("dateTo"));

		DynamicQuery dynamicQuery = new DynamicQueryImpl(detachedCriteria);
		return CommonUtils.filter(dynamicQuery(dynamicQuery, start, end), ThreadDetail.class);
	}
	
	public List<ThreadDetail> getPendingThreadDetails(int start, int end, User user) throws SystemException {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, +1);

		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(ThreadDetail.class);
		detachedCriteria.add(Restrictions.eq("active", 0));
		detachedCriteria.add(Restrictions.gt("dateFrom", cal.getTime()));		
		if (!CommonUtils.isTechnicalAdmin(user))
			detachedCriteria.add(Restrictions.or(Restrictions.eq("accepted", true), Restrictions.eq("userId", user.getUserId())));

		detachedCriteria.addOrder(Order.desc("dateFrom"));

		DynamicQuery dynamicQuery = new DynamicQueryImpl(detachedCriteria);
		return CommonUtils.filter(dynamicQuery(dynamicQuery, start, end), ThreadDetail.class);
	}

	public int getLastClosedThreadDetailsCount(User user) throws SystemException {
		Calendar cal = Calendar.getInstance();
		Calendar current = Calendar.getInstance();
		cal.add(Calendar.DATE, -30);

		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(ThreadDetail.class);
		detachedCriteria.add(Restrictions.eq("active", 0));
		detachedCriteria.add(Restrictions.le("dateFrom", current.getTime()));
		detachedCriteria.add(Restrictions.gt("dateTo", cal.getTime()));
		if (!CommonUtils.isTechnicalAdmin(user))
			detachedCriteria.add(Restrictions.or(Restrictions.eq("accepted", true), Restrictions.eq("userId", user.getUserId())));
		DynamicQuery dynamicQuery = new DynamicQueryImpl(detachedCriteria);
		dynamicQuery.setProjection(new ProjectionImpl(Projections.rowCount()));
		return (Integer) dynamicQuery(dynamicQuery).get(0);
	}
	
	public int getPendingThreadDetailsCount(User user) throws SystemException {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, +1);

		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(ThreadDetail.class);
		detachedCriteria.add(Restrictions.eq("active", 0));
		detachedCriteria.add(Restrictions.gt("dateFrom", cal.getTime()));
		if (!CommonUtils.isTechnicalAdmin(user))
			detachedCriteria.add(Restrictions.or(Restrictions.eq("accepted", true), Restrictions.eq("userId", user.getUserId())));
		DynamicQuery dynamicQuery = new DynamicQueryImpl(detachedCriteria);
		dynamicQuery.setProjection(new ProjectionImpl(Projections.rowCount()));
		return (Integer) dynamicQuery(dynamicQuery).get(0);
	}

	public List<ThreadDetail> getSummaryRemindCandidates() throws SystemException {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -15);

		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(ThreadDetail.class);
		detachedCriteria.add(Restrictions.eq("active", 0));
		detachedCriteria.add(Restrictions.eq("summary", false));
		detachedCriteria.add(Restrictions.gt("dateTo", cal.getTime()));
		detachedCriteria.add(Restrictions.eq("accepted", true));
		detachedCriteria.add(Restrictions.gt("quantity", 0L));

		DynamicQuery dynamicQuery = new DynamicQueryImpl(detachedCriteria);

		return CommonUtils.filter(dynamicQuery(dynamicQuery), ThreadDetail.class);
	}
}
