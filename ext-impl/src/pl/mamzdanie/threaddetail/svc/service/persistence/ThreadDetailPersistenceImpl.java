package pl.mamzdanie.threaddetail.svc.service.persistence;

import com.liferay.portal.SystemException;
import com.liferay.portal.kernel.annotation.BeanReference;
import com.liferay.portal.kernel.cache.CacheRegistry;
import com.liferay.portal.kernel.dao.orm.DynamicQuery;
import com.liferay.portal.kernel.dao.orm.EntityCacheUtil;
import com.liferay.portal.kernel.dao.orm.FinderCacheUtil;
import com.liferay.portal.kernel.dao.orm.FinderPath;
import com.liferay.portal.kernel.dao.orm.Query;
import com.liferay.portal.kernel.dao.orm.QueryUtil;
import com.liferay.portal.kernel.dao.orm.Session;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.OrderByComparator;
import com.liferay.portal.kernel.util.StringUtil;
import com.liferay.portal.model.ModelListener;
import com.liferay.portal.service.persistence.BatchSessionUtil;
import com.liferay.portal.service.persistence.impl.BasePersistenceImpl;

import pl.mamzdanie.threaddetail.svc.NoSuchThreadDetailException;
import pl.mamzdanie.threaddetail.svc.model.ThreadDetail;
import pl.mamzdanie.threaddetail.svc.model.impl.ThreadDetailImpl;
import pl.mamzdanie.threaddetail.svc.model.impl.ThreadDetailModelImpl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class ThreadDetailPersistenceImpl extends BasePersistenceImpl
    implements ThreadDetailPersistence {
    public static final String FINDER_CLASS_NAME_ENTITY = ThreadDetailImpl.class.getName();
    public static final String FINDER_CLASS_NAME_LIST = FINDER_CLASS_NAME_ENTITY +
        ".List";
    public static final FinderPath FINDER_PATH_FIND_ALL = new FinderPath(ThreadDetailModelImpl.ENTITY_CACHE_ENABLED,
            ThreadDetailModelImpl.FINDER_CACHE_ENABLED, FINDER_CLASS_NAME_LIST,
            "findAll", new String[0]);
    public static final FinderPath FINDER_PATH_COUNT_ALL = new FinderPath(ThreadDetailModelImpl.ENTITY_CACHE_ENABLED,
            ThreadDetailModelImpl.FINDER_CACHE_ENABLED, FINDER_CLASS_NAME_LIST,
            "countAll", new String[0]);
    private static Log _log = LogFactoryUtil.getLog(ThreadDetailPersistenceImpl.class);
    @BeanReference(name = "pl.mamzdanie.threaddetail.svc.service.persistence.ThreadDetailPersistence.impl")
    protected pl.mamzdanie.threaddetail.svc.service.persistence.ThreadDetailPersistence threadDetailPersistence;

    public void cacheResult(ThreadDetail threadDetail) {
        EntityCacheUtil.putResult(ThreadDetailModelImpl.ENTITY_CACHE_ENABLED,
            ThreadDetailImpl.class, threadDetail.getPrimaryKey(), threadDetail);
    }

    public void cacheResult(List<ThreadDetail> threadDetails) {
        for (ThreadDetail threadDetail : threadDetails) {
            if (EntityCacheUtil.getResult(
                        ThreadDetailModelImpl.ENTITY_CACHE_ENABLED,
                        ThreadDetailImpl.class, threadDetail.getPrimaryKey(),
                        this) == null) {
                cacheResult(threadDetail);
            }
        }
    }

    public void clearCache() {
        CacheRegistry.clear(ThreadDetailImpl.class.getName());
        EntityCacheUtil.clearCache(ThreadDetailImpl.class.getName());
        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_ENTITY);
        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST);
    }

    public ThreadDetail create(long rootMessageId) {
        ThreadDetail threadDetail = new ThreadDetailImpl();

        threadDetail.setNew(true);
        threadDetail.setPrimaryKey(rootMessageId);

        return threadDetail;
    }

    public ThreadDetail remove(long rootMessageId)
        throws NoSuchThreadDetailException, SystemException {
        Session session = null;

        try {
            session = openSession();

            ThreadDetail threadDetail = (ThreadDetail) session.get(ThreadDetailImpl.class,
                    new Long(rootMessageId));

            if (threadDetail == null) {
                if (_log.isWarnEnabled()) {
                    _log.warn("No ThreadDetail exists with the primary key " +
                        rootMessageId);
                }

                throw new NoSuchThreadDetailException(
                    "No ThreadDetail exists with the primary key " +
                    rootMessageId);
            }

            return remove(threadDetail);
        } catch (NoSuchThreadDetailException nsee) {
            throw nsee;
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }
    }

    public ThreadDetail remove(ThreadDetail threadDetail)
        throws SystemException {
        for (ModelListener<ThreadDetail> listener : listeners) {
            listener.onBeforeRemove(threadDetail);
        }

        threadDetail = removeImpl(threadDetail);

        for (ModelListener<ThreadDetail> listener : listeners) {
            listener.onAfterRemove(threadDetail);
        }

        return threadDetail;
    }

    protected ThreadDetail removeImpl(ThreadDetail threadDetail)
        throws SystemException {
        Session session = null;

        try {
            session = openSession();

            if (threadDetail.isCachedModel() || BatchSessionUtil.isEnabled()) {
                Object staleObject = session.get(ThreadDetailImpl.class,
                        threadDetail.getPrimaryKeyObj());

                if (staleObject != null) {
                    session.evict(staleObject);
                }
            }

            session.delete(threadDetail);

            session.flush();
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }

        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST);

        EntityCacheUtil.removeResult(ThreadDetailModelImpl.ENTITY_CACHE_ENABLED,
            ThreadDetailImpl.class, threadDetail.getPrimaryKey());

        return threadDetail;
    }

    /**
     * @deprecated Use <code>update(ThreadDetail threadDetail, boolean merge)</code>.
     */
    public ThreadDetail update(ThreadDetail threadDetail)
        throws SystemException {
        if (_log.isWarnEnabled()) {
            _log.warn(
                "Using the deprecated update(ThreadDetail threadDetail) method. Use update(ThreadDetail threadDetail, boolean merge) instead.");
        }

        return update(threadDetail, false);
    }

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
    public ThreadDetail update(ThreadDetail threadDetail, boolean merge)
        throws SystemException {
        boolean isNew = threadDetail.isNew();

        for (ModelListener<ThreadDetail> listener : listeners) {
            if (isNew) {
                listener.onBeforeCreate(threadDetail);
            } else {
                listener.onBeforeUpdate(threadDetail);
            }
        }

        threadDetail = updateImpl(threadDetail, merge);

        for (ModelListener<ThreadDetail> listener : listeners) {
            if (isNew) {
                listener.onAfterCreate(threadDetail);
            } else {
                listener.onAfterUpdate(threadDetail);
            }
        }

        return threadDetail;
    }

    public ThreadDetail updateImpl(
        pl.mamzdanie.threaddetail.svc.model.ThreadDetail threadDetail,
        boolean merge) throws SystemException {
        Session session = null;

        try {
            session = openSession();

            BatchSessionUtil.update(session, threadDetail, merge);

            threadDetail.setNew(false);
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }

        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST);

        EntityCacheUtil.putResult(ThreadDetailModelImpl.ENTITY_CACHE_ENABLED,
            ThreadDetailImpl.class, threadDetail.getPrimaryKey(), threadDetail);

        return threadDetail;
    }

    public ThreadDetail findByPrimaryKey(long rootMessageId)
        throws NoSuchThreadDetailException, SystemException {
        ThreadDetail threadDetail = fetchByPrimaryKey(rootMessageId);

        if (threadDetail == null) {
            if (_log.isWarnEnabled()) {
                _log.warn("No ThreadDetail exists with the primary key " +
                    rootMessageId);
            }

            throw new NoSuchThreadDetailException(
                "No ThreadDetail exists with the primary key " + rootMessageId);
        }

        return threadDetail;
    }

    public ThreadDetail fetchByPrimaryKey(long rootMessageId)
        throws SystemException {
        ThreadDetail threadDetail = (ThreadDetail) EntityCacheUtil.getResult(ThreadDetailModelImpl.ENTITY_CACHE_ENABLED,
                ThreadDetailImpl.class, rootMessageId, this);

        if (threadDetail == null) {
            Session session = null;

            try {
                session = openSession();

                threadDetail = (ThreadDetail) session.get(ThreadDetailImpl.class,
                        new Long(rootMessageId));
            } catch (Exception e) {
                throw processException(e);
            } finally {
                if (threadDetail != null) {
                    cacheResult(threadDetail);
                }

                closeSession(session);
            }
        }

        return threadDetail;
    }

    public List<Object> findWithDynamicQuery(DynamicQuery dynamicQuery)
        throws SystemException {
        Session session = null;

        try {
            session = openSession();

            dynamicQuery.compile(session);

            return dynamicQuery.list();
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }
    }

    public List<Object> findWithDynamicQuery(DynamicQuery dynamicQuery,
        int start, int end) throws SystemException {
        Session session = null;

        try {
            session = openSession();

            dynamicQuery.setLimit(start, end);

            dynamicQuery.compile(session);

            return dynamicQuery.list();
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }
    }

    public List<ThreadDetail> findAll() throws SystemException {
        return findAll(QueryUtil.ALL_POS, QueryUtil.ALL_POS, null);
    }

    public List<ThreadDetail> findAll(int start, int end)
        throws SystemException {
        return findAll(start, end, null);
    }

    public List<ThreadDetail> findAll(int start, int end, OrderByComparator obc)
        throws SystemException {
        Object[] finderArgs = new Object[] {
                String.valueOf(start), String.valueOf(end), String.valueOf(obc)
            };

        List<ThreadDetail> list = (List<ThreadDetail>) FinderCacheUtil.getResult(FINDER_PATH_FIND_ALL,
                finderArgs, this);

        if (list == null) {
            Session session = null;

            try {
                session = openSession();

                StringBuilder query = new StringBuilder();

                query.append(
                    "FROM pl.mamzdanie.threaddetail.svc.model.ThreadDetail ");

                if (obc != null) {
                    query.append("ORDER BY ");
                    query.append(obc.getOrderBy());
                }

                Query q = session.createQuery(query.toString());

                if (obc == null) {
                    list = (List<ThreadDetail>) QueryUtil.list(q, getDialect(),
                            start, end, false);

                    Collections.sort(list);
                } else {
                    list = (List<ThreadDetail>) QueryUtil.list(q, getDialect(),
                            start, end);
                }
            } catch (Exception e) {
                throw processException(e);
            } finally {
                if (list == null) {
                    list = new ArrayList<ThreadDetail>();
                }

                cacheResult(list);

                FinderCacheUtil.putResult(FINDER_PATH_FIND_ALL, finderArgs, list);

                closeSession(session);
            }
        }

        return list;
    }

    public void removeAll() throws SystemException {
        for (ThreadDetail threadDetail : findAll()) {
            remove(threadDetail);
        }
    }

    public int countAll() throws SystemException {
        Object[] finderArgs = new Object[0];

        Long count = (Long) FinderCacheUtil.getResult(FINDER_PATH_COUNT_ALL,
                finderArgs, this);

        if (count == null) {
            Session session = null;

            try {
                session = openSession();

                Query q = session.createQuery(
                        "SELECT COUNT(*) FROM pl.mamzdanie.threaddetail.svc.model.ThreadDetail");

                count = (Long) q.uniqueResult();
            } catch (Exception e) {
                throw processException(e);
            } finally {
                if (count == null) {
                    count = Long.valueOf(0);
                }

                FinderCacheUtil.putResult(FINDER_PATH_COUNT_ALL, finderArgs,
                    count);

                closeSession(session);
            }
        }

        return count.intValue();
    }

    public void afterPropertiesSet() {
        String[] listenerClassNames = StringUtil.split(GetterUtil.getString(
                    com.liferay.portal.util.PropsUtil.get(
                        "value.object.listener.pl.mamzdanie.threaddetail.svc.model.ThreadDetail")));

        if (listenerClassNames.length > 0) {
            try {
                List<ModelListener<ThreadDetail>> listenersList = new ArrayList<ModelListener<ThreadDetail>>();

                for (String listenerClassName : listenerClassNames) {
                    listenersList.add((ModelListener<ThreadDetail>) Class.forName(
                            listenerClassName).newInstance());
                }

                listeners = listenersList.toArray(new ModelListener[listenersList.size()]);
            } catch (Exception e) {
                _log.error(e);
            }
        }
    }
}
