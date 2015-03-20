package pl.mamzdanie.useraddon.svc.service.persistence;

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

import pl.mamzdanie.useraddon.svc.NoSuchUserAddonException;
import pl.mamzdanie.useraddon.svc.model.UserAddon;
import pl.mamzdanie.useraddon.svc.model.impl.UserAddonImpl;
import pl.mamzdanie.useraddon.svc.model.impl.UserAddonModelImpl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class UserAddonPersistenceImpl extends BasePersistenceImpl
    implements UserAddonPersistence {
    public static final String FINDER_CLASS_NAME_ENTITY = UserAddonImpl.class.getName();
    public static final String FINDER_CLASS_NAME_LIST = FINDER_CLASS_NAME_ENTITY +
        ".List";
    public static final FinderPath FINDER_PATH_FIND_ALL = new FinderPath(UserAddonModelImpl.ENTITY_CACHE_ENABLED,
            UserAddonModelImpl.FINDER_CACHE_ENABLED, FINDER_CLASS_NAME_LIST,
            "findAll", new String[0]);
    public static final FinderPath FINDER_PATH_COUNT_ALL = new FinderPath(UserAddonModelImpl.ENTITY_CACHE_ENABLED,
            UserAddonModelImpl.FINDER_CACHE_ENABLED, FINDER_CLASS_NAME_LIST,
            "countAll", new String[0]);
    private static Log _log = LogFactoryUtil.getLog(UserAddonPersistenceImpl.class);
    @BeanReference(name = "pl.mamzdanie.useraddon.svc.service.persistence.UserAddonPersistence.impl")
    protected pl.mamzdanie.useraddon.svc.service.persistence.UserAddonPersistence userAddonPersistence;

    public void cacheResult(UserAddon userAddon) {
        EntityCacheUtil.putResult(UserAddonModelImpl.ENTITY_CACHE_ENABLED,
            UserAddonImpl.class, userAddon.getPrimaryKey(), userAddon);
    }

    public void cacheResult(List<UserAddon> userAddons) {
        for (UserAddon userAddon : userAddons) {
            if (EntityCacheUtil.getResult(
                        UserAddonModelImpl.ENTITY_CACHE_ENABLED,
                        UserAddonImpl.class, userAddon.getPrimaryKey(), this) == null) {
                cacheResult(userAddon);
            }
        }
    }

    public void clearCache() {
        CacheRegistry.clear(UserAddonImpl.class.getName());
        EntityCacheUtil.clearCache(UserAddonImpl.class.getName());
        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_ENTITY);
        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST);
    }

    public UserAddon create(long userId) {
        UserAddon userAddon = new UserAddonImpl();

        userAddon.setNew(true);
        userAddon.setPrimaryKey(userId);

        return userAddon;
    }

    public UserAddon remove(long userId)
        throws NoSuchUserAddonException, SystemException {
        Session session = null;

        try {
            session = openSession();

            UserAddon userAddon = (UserAddon) session.get(UserAddonImpl.class,
                    new Long(userId));

            if (userAddon == null) {
                if (_log.isWarnEnabled()) {
                    _log.warn("No UserAddon exists with the primary key " +
                        userId);
                }

                throw new NoSuchUserAddonException(
                    "No UserAddon exists with the primary key " + userId);
            }

            return remove(userAddon);
        } catch (NoSuchUserAddonException nsee) {
            throw nsee;
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }
    }

    public UserAddon remove(UserAddon userAddon) throws SystemException {
        for (ModelListener<UserAddon> listener : listeners) {
            listener.onBeforeRemove(userAddon);
        }

        userAddon = removeImpl(userAddon);

        for (ModelListener<UserAddon> listener : listeners) {
            listener.onAfterRemove(userAddon);
        }

        return userAddon;
    }

    protected UserAddon removeImpl(UserAddon userAddon)
        throws SystemException {
        Session session = null;

        try {
            session = openSession();

            if (userAddon.isCachedModel() || BatchSessionUtil.isEnabled()) {
                Object staleObject = session.get(UserAddonImpl.class,
                        userAddon.getPrimaryKeyObj());

                if (staleObject != null) {
                    session.evict(staleObject);
                }
            }

            session.delete(userAddon);

            session.flush();
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }

        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST);

        EntityCacheUtil.removeResult(UserAddonModelImpl.ENTITY_CACHE_ENABLED,
            UserAddonImpl.class, userAddon.getPrimaryKey());

        return userAddon;
    }

    /**
     * @deprecated Use <code>update(UserAddon userAddon, boolean merge)</code>.
     */
    public UserAddon update(UserAddon userAddon) throws SystemException {
        if (_log.isWarnEnabled()) {
            _log.warn(
                "Using the deprecated update(UserAddon userAddon) method. Use update(UserAddon userAddon, boolean merge) instead.");
        }

        return update(userAddon, false);
    }

    /**
     * Add, update, or merge, the entity. This method also calls the model
     * listeners to trigger the proper events associated with adding, deleting,
     * or updating an entity.
     *
     * @param                userAddon the entity to add, update, or merge
     * @param                merge boolean value for whether to merge the entity. The
     *                                default value is false. Setting merge to true is more
     *                                expensive and should only be true when userAddon is
     *                                transient. See LEP-5473 for a detailed discussion of this
     *                                method.
     * @return                true if the portlet can be displayed via Ajax
     */
    public UserAddon update(UserAddon userAddon, boolean merge)
        throws SystemException {
        boolean isNew = userAddon.isNew();

        for (ModelListener<UserAddon> listener : listeners) {
            if (isNew) {
                listener.onBeforeCreate(userAddon);
            } else {
                listener.onBeforeUpdate(userAddon);
            }
        }

        userAddon = updateImpl(userAddon, merge);

        for (ModelListener<UserAddon> listener : listeners) {
            if (isNew) {
                listener.onAfterCreate(userAddon);
            } else {
                listener.onAfterUpdate(userAddon);
            }
        }

        return userAddon;
    }

    public UserAddon updateImpl(
        pl.mamzdanie.useraddon.svc.model.UserAddon userAddon, boolean merge)
        throws SystemException {
        Session session = null;

        try {
            session = openSession();

            BatchSessionUtil.update(session, userAddon, merge);

            userAddon.setNew(false);
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }

        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST);

        EntityCacheUtil.putResult(UserAddonModelImpl.ENTITY_CACHE_ENABLED,
            UserAddonImpl.class, userAddon.getPrimaryKey(), userAddon);

        return userAddon;
    }

    public UserAddon findByPrimaryKey(long userId)
        throws NoSuchUserAddonException, SystemException {
        UserAddon userAddon = fetchByPrimaryKey(userId);

        if (userAddon == null) {
            if (_log.isWarnEnabled()) {
                _log.warn("No UserAddon exists with the primary key " + userId);
            }

            throw new NoSuchUserAddonException(
                "No UserAddon exists with the primary key " + userId);
        }

        return userAddon;
    }

    public UserAddon fetchByPrimaryKey(long userId) throws SystemException {
        UserAddon userAddon = (UserAddon) EntityCacheUtil.getResult(UserAddonModelImpl.ENTITY_CACHE_ENABLED,
                UserAddonImpl.class, userId, this);

        if (userAddon == null) {
            Session session = null;

            try {
                session = openSession();

                userAddon = (UserAddon) session.get(UserAddonImpl.class,
                        new Long(userId));
            } catch (Exception e) {
                throw processException(e);
            } finally {
                if (userAddon != null) {
                    cacheResult(userAddon);
                }

                closeSession(session);
            }
        }

        return userAddon;
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

    public List<UserAddon> findAll() throws SystemException {
        return findAll(QueryUtil.ALL_POS, QueryUtil.ALL_POS, null);
    }

    public List<UserAddon> findAll(int start, int end)
        throws SystemException {
        return findAll(start, end, null);
    }

    public List<UserAddon> findAll(int start, int end, OrderByComparator obc)
        throws SystemException {
        Object[] finderArgs = new Object[] {
                String.valueOf(start), String.valueOf(end), String.valueOf(obc)
            };

        List<UserAddon> list = (List<UserAddon>) FinderCacheUtil.getResult(FINDER_PATH_FIND_ALL,
                finderArgs, this);

        if (list == null) {
            Session session = null;

            try {
                session = openSession();

                StringBuilder query = new StringBuilder();

                query.append("FROM pl.mamzdanie.useraddon.svc.model.UserAddon ");

                if (obc != null) {
                    query.append("ORDER BY ");
                    query.append(obc.getOrderBy());
                }

                Query q = session.createQuery(query.toString());

                if (obc == null) {
                    list = (List<UserAddon>) QueryUtil.list(q, getDialect(),
                            start, end, false);

                    Collections.sort(list);
                } else {
                    list = (List<UserAddon>) QueryUtil.list(q, getDialect(),
                            start, end);
                }
            } catch (Exception e) {
                throw processException(e);
            } finally {
                if (list == null) {
                    list = new ArrayList<UserAddon>();
                }

                cacheResult(list);

                FinderCacheUtil.putResult(FINDER_PATH_FIND_ALL, finderArgs, list);

                closeSession(session);
            }
        }

        return list;
    }

    public void removeAll() throws SystemException {
        for (UserAddon userAddon : findAll()) {
            remove(userAddon);
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
                        "SELECT COUNT(*) FROM pl.mamzdanie.useraddon.svc.model.UserAddon");

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
                        "value.object.listener.pl.mamzdanie.useraddon.svc.model.UserAddon")));

        if (listenerClassNames.length > 0) {
            try {
                List<ModelListener<UserAddon>> listenersList = new ArrayList<ModelListener<UserAddon>>();

                for (String listenerClassName : listenerClassNames) {
                    listenersList.add((ModelListener<UserAddon>) Class.forName(
                            listenerClassName).newInstance());
                }

                listeners = listenersList.toArray(new ModelListener[listenersList.size()]);
            } catch (Exception e) {
                _log.error(e);
            }
        }
    }
}
