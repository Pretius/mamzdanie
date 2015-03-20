package pl.mamzdanie.mbthreadaddon.svc.service.persistence;

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

import pl.mamzdanie.mbthreadaddon.svc.NoSuchMBAddonException;
import pl.mamzdanie.mbthreadaddon.svc.model.MBAddon;
import pl.mamzdanie.mbthreadaddon.svc.model.impl.MBAddonImpl;
import pl.mamzdanie.mbthreadaddon.svc.model.impl.MBAddonModelImpl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class MBAddonPersistenceImpl extends BasePersistenceImpl
    implements MBAddonPersistence {
    public static final String FINDER_CLASS_NAME_ENTITY = MBAddonImpl.class.getName();
    public static final String FINDER_CLASS_NAME_LIST = FINDER_CLASS_NAME_ENTITY +
        ".List";
    public static final FinderPath FINDER_PATH_FIND_ALL = new FinderPath(MBAddonModelImpl.ENTITY_CACHE_ENABLED,
            MBAddonModelImpl.FINDER_CACHE_ENABLED, FINDER_CLASS_NAME_LIST,
            "findAll", new String[0]);
    public static final FinderPath FINDER_PATH_COUNT_ALL = new FinderPath(MBAddonModelImpl.ENTITY_CACHE_ENABLED,
            MBAddonModelImpl.FINDER_CACHE_ENABLED, FINDER_CLASS_NAME_LIST,
            "countAll", new String[0]);
    private static Log _log = LogFactoryUtil.getLog(MBAddonPersistenceImpl.class);
    @BeanReference(name = "pl.mamzdanie.mbthreadaddon.svc.service.persistence.MBAddonPersistence.impl")
    protected pl.mamzdanie.mbthreadaddon.svc.service.persistence.MBAddonPersistence mbAddonPersistence;

    public void cacheResult(MBAddon mbAddon) {
        EntityCacheUtil.putResult(MBAddonModelImpl.ENTITY_CACHE_ENABLED,
            MBAddonImpl.class, mbAddon.getPrimaryKey(), mbAddon);
    }

    public void cacheResult(List<MBAddon> mbAddons) {
        for (MBAddon mbAddon : mbAddons) {
            if (EntityCacheUtil.getResult(
                        MBAddonModelImpl.ENTITY_CACHE_ENABLED,
                        MBAddonImpl.class, mbAddon.getPrimaryKey(), this) == null) {
                cacheResult(mbAddon);
            }
        }
    }

    public void clearCache() {
        CacheRegistry.clear(MBAddonImpl.class.getName());
        EntityCacheUtil.clearCache(MBAddonImpl.class.getName());
        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_ENTITY);
        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST);
    }

    public MBAddon create(long threadId) {
        MBAddon mbAddon = new MBAddonImpl();

        mbAddon.setNew(true);
        mbAddon.setPrimaryKey(threadId);

        return mbAddon;
    }

    public MBAddon remove(long threadId)
        throws NoSuchMBAddonException, SystemException {
        Session session = null;

        try {
            session = openSession();

            MBAddon mbAddon = (MBAddon) session.get(MBAddonImpl.class,
                    new Long(threadId));

            if (mbAddon == null) {
                if (_log.isWarnEnabled()) {
                    _log.warn("No MBAddon exists with the primary key " +
                        threadId);
                }

                throw new NoSuchMBAddonException(
                    "No MBAddon exists with the primary key " + threadId);
            }

            return remove(mbAddon);
        } catch (NoSuchMBAddonException nsee) {
            throw nsee;
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }
    }

    public MBAddon remove(MBAddon mbAddon) throws SystemException {
        for (ModelListener<MBAddon> listener : listeners) {
            listener.onBeforeRemove(mbAddon);
        }

        mbAddon = removeImpl(mbAddon);

        for (ModelListener<MBAddon> listener : listeners) {
            listener.onAfterRemove(mbAddon);
        }

        return mbAddon;
    }

    protected MBAddon removeImpl(MBAddon mbAddon) throws SystemException {
        Session session = null;

        try {
            session = openSession();

            if (mbAddon.isCachedModel() || BatchSessionUtil.isEnabled()) {
                Object staleObject = session.get(MBAddonImpl.class,
                        mbAddon.getPrimaryKeyObj());

                if (staleObject != null) {
                    session.evict(staleObject);
                }
            }

            session.delete(mbAddon);

            session.flush();
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }

        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST);

        EntityCacheUtil.removeResult(MBAddonModelImpl.ENTITY_CACHE_ENABLED,
            MBAddonImpl.class, mbAddon.getPrimaryKey());

        return mbAddon;
    }

    /**
     * @deprecated Use <code>update(MBAddon mbAddon, boolean merge)</code>.
     */
    public MBAddon update(MBAddon mbAddon) throws SystemException {
        if (_log.isWarnEnabled()) {
            _log.warn(
                "Using the deprecated update(MBAddon mbAddon) method. Use update(MBAddon mbAddon, boolean merge) instead.");
        }

        return update(mbAddon, false);
    }

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
    public MBAddon update(MBAddon mbAddon, boolean merge)
        throws SystemException {
        boolean isNew = mbAddon.isNew();

        for (ModelListener<MBAddon> listener : listeners) {
            if (isNew) {
                listener.onBeforeCreate(mbAddon);
            } else {
                listener.onBeforeUpdate(mbAddon);
            }
        }

        mbAddon = updateImpl(mbAddon, merge);

        for (ModelListener<MBAddon> listener : listeners) {
            if (isNew) {
                listener.onAfterCreate(mbAddon);
            } else {
                listener.onAfterUpdate(mbAddon);
            }
        }

        return mbAddon;
    }

    public MBAddon updateImpl(
        pl.mamzdanie.mbthreadaddon.svc.model.MBAddon mbAddon, boolean merge)
        throws SystemException {
        Session session = null;

        try {
            session = openSession();

            BatchSessionUtil.update(session, mbAddon, merge);

            mbAddon.setNew(false);
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }

        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST);

        EntityCacheUtil.putResult(MBAddonModelImpl.ENTITY_CACHE_ENABLED,
            MBAddonImpl.class, mbAddon.getPrimaryKey(), mbAddon);

        return mbAddon;
    }

    public MBAddon findByPrimaryKey(long threadId)
        throws NoSuchMBAddonException, SystemException {
        MBAddon mbAddon = fetchByPrimaryKey(threadId);

        if (mbAddon == null) {
            if (_log.isWarnEnabled()) {
                _log.warn("No MBAddon exists with the primary key " + threadId);
            }

            throw new NoSuchMBAddonException(
                "No MBAddon exists with the primary key " + threadId);
        }

        return mbAddon;
    }

    public MBAddon fetchByPrimaryKey(long threadId) throws SystemException {
        MBAddon mbAddon = (MBAddon) EntityCacheUtil.getResult(MBAddonModelImpl.ENTITY_CACHE_ENABLED,
                MBAddonImpl.class, threadId, this);

        if (mbAddon == null) {
            Session session = null;

            try {
                session = openSession();

                mbAddon = (MBAddon) session.get(MBAddonImpl.class,
                        new Long(threadId));
            } catch (Exception e) {
                throw processException(e);
            } finally {
                if (mbAddon != null) {
                    cacheResult(mbAddon);
                }

                closeSession(session);
            }
        }

        return mbAddon;
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

    public List<MBAddon> findAll() throws SystemException {
        return findAll(QueryUtil.ALL_POS, QueryUtil.ALL_POS, null);
    }

    public List<MBAddon> findAll(int start, int end) throws SystemException {
        return findAll(start, end, null);
    }

    public List<MBAddon> findAll(int start, int end, OrderByComparator obc)
        throws SystemException {
        Object[] finderArgs = new Object[] {
                String.valueOf(start), String.valueOf(end), String.valueOf(obc)
            };

        List<MBAddon> list = (List<MBAddon>) FinderCacheUtil.getResult(FINDER_PATH_FIND_ALL,
                finderArgs, this);

        if (list == null) {
            Session session = null;

            try {
                session = openSession();

                StringBuilder query = new StringBuilder();

                query.append(
                    "FROM pl.mamzdanie.mbthreadaddon.svc.model.MBAddon ");

                if (obc != null) {
                    query.append("ORDER BY ");
                    query.append(obc.getOrderBy());
                }

                Query q = session.createQuery(query.toString());

                if (obc == null) {
                    list = (List<MBAddon>) QueryUtil.list(q, getDialect(),
                            start, end, false);

                    Collections.sort(list);
                } else {
                    list = (List<MBAddon>) QueryUtil.list(q, getDialect(),
                            start, end);
                }
            } catch (Exception e) {
                throw processException(e);
            } finally {
                if (list == null) {
                    list = new ArrayList<MBAddon>();
                }

                cacheResult(list);

                FinderCacheUtil.putResult(FINDER_PATH_FIND_ALL, finderArgs, list);

                closeSession(session);
            }
        }

        return list;
    }

    public void removeAll() throws SystemException {
        for (MBAddon mbAddon : findAll()) {
            remove(mbAddon);
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
                        "SELECT COUNT(*) FROM pl.mamzdanie.mbthreadaddon.svc.model.MBAddon");

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
                        "value.object.listener.pl.mamzdanie.mbthreadaddon.svc.model.MBAddon")));

        if (listenerClassNames.length > 0) {
            try {
                List<ModelListener<MBAddon>> listenersList = new ArrayList<ModelListener<MBAddon>>();

                for (String listenerClassName : listenerClassNames) {
                    listenersList.add((ModelListener<MBAddon>) Class.forName(
                            listenerClassName).newInstance());
                }

                listeners = listenersList.toArray(new ModelListener[listenersList.size()]);
            } catch (Exception e) {
                _log.error(e);
            }
        }
    }
}
