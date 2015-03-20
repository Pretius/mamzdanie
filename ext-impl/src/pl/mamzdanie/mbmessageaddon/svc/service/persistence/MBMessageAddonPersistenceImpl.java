package pl.mamzdanie.mbmessageaddon.svc.service.persistence;

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

import pl.mamzdanie.mbmessageaddon.svc.NoSuchMBMessageAddonException;
import pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon;
import pl.mamzdanie.mbmessageaddon.svc.model.impl.MBMessageAddonImpl;
import pl.mamzdanie.mbmessageaddon.svc.model.impl.MBMessageAddonModelImpl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class MBMessageAddonPersistenceImpl extends BasePersistenceImpl
    implements MBMessageAddonPersistence {
    public static final String FINDER_CLASS_NAME_ENTITY = MBMessageAddonImpl.class.getName();
    public static final String FINDER_CLASS_NAME_LIST = FINDER_CLASS_NAME_ENTITY +
        ".List";
    public static final FinderPath FINDER_PATH_FIND_ALL = new FinderPath(MBMessageAddonModelImpl.ENTITY_CACHE_ENABLED,
            MBMessageAddonModelImpl.FINDER_CACHE_ENABLED,
            FINDER_CLASS_NAME_LIST, "findAll", new String[0]);
    public static final FinderPath FINDER_PATH_COUNT_ALL = new FinderPath(MBMessageAddonModelImpl.ENTITY_CACHE_ENABLED,
            MBMessageAddonModelImpl.FINDER_CACHE_ENABLED,
            FINDER_CLASS_NAME_LIST, "countAll", new String[0]);
    private static Log _log = LogFactoryUtil.getLog(MBMessageAddonPersistenceImpl.class);
    @BeanReference(name = "pl.mamzdanie.mbmessageaddon.svc.service.persistence.MBMessageAddonPersistence.impl")
    protected pl.mamzdanie.mbmessageaddon.svc.service.persistence.MBMessageAddonPersistence mbMessageAddonPersistence;

    public void cacheResult(MBMessageAddon mbMessageAddon) {
        EntityCacheUtil.putResult(MBMessageAddonModelImpl.ENTITY_CACHE_ENABLED,
            MBMessageAddonImpl.class, mbMessageAddon.getPrimaryKey(),
            mbMessageAddon);
    }

    public void cacheResult(List<MBMessageAddon> mbMessageAddons) {
        for (MBMessageAddon mbMessageAddon : mbMessageAddons) {
            if (EntityCacheUtil.getResult(
                        MBMessageAddonModelImpl.ENTITY_CACHE_ENABLED,
                        MBMessageAddonImpl.class,
                        mbMessageAddon.getPrimaryKey(), this) == null) {
                cacheResult(mbMessageAddon);
            }
        }
    }

    public void clearCache() {
        CacheRegistry.clear(MBMessageAddonImpl.class.getName());
        EntityCacheUtil.clearCache(MBMessageAddonImpl.class.getName());
        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_ENTITY);
        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST);
    }

    public MBMessageAddon create(Long messageId) {
        MBMessageAddon mbMessageAddon = new MBMessageAddonImpl();

        mbMessageAddon.setNew(true);
        mbMessageAddon.setPrimaryKey(messageId);

        return mbMessageAddon;
    }

    public MBMessageAddon remove(Long messageId)
        throws NoSuchMBMessageAddonException, SystemException {
        Session session = null;

        try {
            session = openSession();

            MBMessageAddon mbMessageAddon = (MBMessageAddon) session.get(MBMessageAddonImpl.class,
                    messageId);

            if (mbMessageAddon == null) {
                if (_log.isWarnEnabled()) {
                    _log.warn("No MBMessageAddon exists with the primary key " +
                        messageId);
                }

                throw new NoSuchMBMessageAddonException(
                    "No MBMessageAddon exists with the primary key " +
                    messageId);
            }

            return remove(mbMessageAddon);
        } catch (NoSuchMBMessageAddonException nsee) {
            throw nsee;
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }
    }

    public MBMessageAddon remove(MBMessageAddon mbMessageAddon)
        throws SystemException {
        for (ModelListener<MBMessageAddon> listener : listeners) {
            listener.onBeforeRemove(mbMessageAddon);
        }

        mbMessageAddon = removeImpl(mbMessageAddon);

        for (ModelListener<MBMessageAddon> listener : listeners) {
            listener.onAfterRemove(mbMessageAddon);
        }

        return mbMessageAddon;
    }

    protected MBMessageAddon removeImpl(MBMessageAddon mbMessageAddon)
        throws SystemException {
        Session session = null;

        try {
            session = openSession();

            if (mbMessageAddon.isCachedModel() || BatchSessionUtil.isEnabled()) {
                Object staleObject = session.get(MBMessageAddonImpl.class,
                        mbMessageAddon.getPrimaryKeyObj());

                if (staleObject != null) {
                    session.evict(staleObject);
                }
            }

            session.delete(mbMessageAddon);

            session.flush();
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }

        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST);

        EntityCacheUtil.removeResult(MBMessageAddonModelImpl.ENTITY_CACHE_ENABLED,
            MBMessageAddonImpl.class, mbMessageAddon.getPrimaryKey());

        return mbMessageAddon;
    }

    /**
     * @deprecated Use <code>update(MBMessageAddon mbMessageAddon, boolean merge)</code>.
     */
    public MBMessageAddon update(MBMessageAddon mbMessageAddon)
        throws SystemException {
        if (_log.isWarnEnabled()) {
            _log.warn(
                "Using the deprecated update(MBMessageAddon mbMessageAddon) method. Use update(MBMessageAddon mbMessageAddon, boolean merge) instead.");
        }

        return update(mbMessageAddon, false);
    }

    /**
     * Add, update, or merge, the entity. This method also calls the model
     * listeners to trigger the proper events associated with adding, deleting,
     * or updating an entity.
     *
     * @param                mbMessageAddon the entity to add, update, or merge
     * @param                merge boolean value for whether to merge the entity. The
     *                                default value is false. Setting merge to true is more
     *                                expensive and should only be true when mbMessageAddon is
     *                                transient. See LEP-5473 for a detailed discussion of this
     *                                method.
     * @return                true if the portlet can be displayed via Ajax
     */
    public MBMessageAddon update(MBMessageAddon mbMessageAddon, boolean merge)
        throws SystemException {
        boolean isNew = mbMessageAddon.isNew();

        for (ModelListener<MBMessageAddon> listener : listeners) {
            if (isNew) {
                listener.onBeforeCreate(mbMessageAddon);
            } else {
                listener.onBeforeUpdate(mbMessageAddon);
            }
        }

        mbMessageAddon = updateImpl(mbMessageAddon, merge);

        for (ModelListener<MBMessageAddon> listener : listeners) {
            if (isNew) {
                listener.onAfterCreate(mbMessageAddon);
            } else {
                listener.onAfterUpdate(mbMessageAddon);
            }
        }

        return mbMessageAddon;
    }

    public MBMessageAddon updateImpl(
        pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon mbMessageAddon,
        boolean merge) throws SystemException {
        Session session = null;

        try {
            session = openSession();

            BatchSessionUtil.update(session, mbMessageAddon, merge);

            mbMessageAddon.setNew(false);
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }

        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST);

        EntityCacheUtil.putResult(MBMessageAddonModelImpl.ENTITY_CACHE_ENABLED,
            MBMessageAddonImpl.class, mbMessageAddon.getPrimaryKey(),
            mbMessageAddon);

        return mbMessageAddon;
    }

    public MBMessageAddon findByPrimaryKey(Long messageId)
        throws NoSuchMBMessageAddonException, SystemException {
        MBMessageAddon mbMessageAddon = fetchByPrimaryKey(messageId);

        if (mbMessageAddon == null) {
            if (_log.isWarnEnabled()) {
                _log.warn("No MBMessageAddon exists with the primary key " +
                    messageId);
            }

            throw new NoSuchMBMessageAddonException(
                "No MBMessageAddon exists with the primary key " + messageId);
        }

        return mbMessageAddon;
    }

    public MBMessageAddon fetchByPrimaryKey(Long messageId)
        throws SystemException {
        MBMessageAddon mbMessageAddon = (MBMessageAddon) EntityCacheUtil.getResult(MBMessageAddonModelImpl.ENTITY_CACHE_ENABLED,
                MBMessageAddonImpl.class, messageId, this);

        if (mbMessageAddon == null) {
            Session session = null;

            try {
                session = openSession();

                mbMessageAddon = (MBMessageAddon) session.get(MBMessageAddonImpl.class,
                        messageId);
            } catch (Exception e) {
                throw processException(e);
            } finally {
                if (mbMessageAddon != null) {
                    cacheResult(mbMessageAddon);
                }

                closeSession(session);
            }
        }

        return mbMessageAddon;
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

    public List<MBMessageAddon> findAll() throws SystemException {
        return findAll(QueryUtil.ALL_POS, QueryUtil.ALL_POS, null);
    }

    public List<MBMessageAddon> findAll(int start, int end)
        throws SystemException {
        return findAll(start, end, null);
    }

    public List<MBMessageAddon> findAll(int start, int end,
        OrderByComparator obc) throws SystemException {
        Object[] finderArgs = new Object[] {
                String.valueOf(start), String.valueOf(end), String.valueOf(obc)
            };

        List<MBMessageAddon> list = (List<MBMessageAddon>) FinderCacheUtil.getResult(FINDER_PATH_FIND_ALL,
                finderArgs, this);

        if (list == null) {
            Session session = null;

            try {
                session = openSession();

                StringBuilder query = new StringBuilder();

                query.append(
                    "FROM pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon ");

                if (obc != null) {
                    query.append("ORDER BY ");
                    query.append(obc.getOrderBy());
                }

                Query q = session.createQuery(query.toString());

                if (obc == null) {
                    list = (List<MBMessageAddon>) QueryUtil.list(q,
                            getDialect(), start, end, false);

                    Collections.sort(list);
                } else {
                    list = (List<MBMessageAddon>) QueryUtil.list(q,
                            getDialect(), start, end);
                }
            } catch (Exception e) {
                throw processException(e);
            } finally {
                if (list == null) {
                    list = new ArrayList<MBMessageAddon>();
                }

                cacheResult(list);

                FinderCacheUtil.putResult(FINDER_PATH_FIND_ALL, finderArgs, list);

                closeSession(session);
            }
        }

        return list;
    }

    public void removeAll() throws SystemException {
        for (MBMessageAddon mbMessageAddon : findAll()) {
            remove(mbMessageAddon);
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
                        "SELECT COUNT(*) FROM pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon");

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
                        "value.object.listener.pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon")));

        if (listenerClassNames.length > 0) {
            try {
                List<ModelListener<MBMessageAddon>> listenersList = new ArrayList<ModelListener<MBMessageAddon>>();

                for (String listenerClassName : listenerClassNames) {
                    listenersList.add((ModelListener<MBMessageAddon>) Class.forName(
                            listenerClassName).newInstance());
                }

                listeners = listenersList.toArray(new ModelListener[listenersList.size()]);
            } catch (Exception e) {
                _log.error(e);
            }
        }
    }
}
