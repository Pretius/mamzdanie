package pl.mamzdanie.userorganization.svc.service.persistence;

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

import pl.mamzdanie.userorganization.svc.NoSuchUserOrganizationException;
import pl.mamzdanie.userorganization.svc.model.UserOrganization;
import pl.mamzdanie.userorganization.svc.model.impl.UserOrganizationImpl;
import pl.mamzdanie.userorganization.svc.model.impl.UserOrganizationModelImpl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class UserOrganizationPersistenceImpl extends BasePersistenceImpl
    implements UserOrganizationPersistence {
    public static final String FINDER_CLASS_NAME_ENTITY = UserOrganizationImpl.class.getName();
    public static final String FINDER_CLASS_NAME_LIST = FINDER_CLASS_NAME_ENTITY +
        ".List";
    public static final FinderPath FINDER_PATH_FIND_ALL = new FinderPath(UserOrganizationModelImpl.ENTITY_CACHE_ENABLED,
            UserOrganizationModelImpl.FINDER_CACHE_ENABLED,
            FINDER_CLASS_NAME_LIST, "findAll", new String[0]);
    public static final FinderPath FINDER_PATH_COUNT_ALL = new FinderPath(UserOrganizationModelImpl.ENTITY_CACHE_ENABLED,
            UserOrganizationModelImpl.FINDER_CACHE_ENABLED,
            FINDER_CLASS_NAME_LIST, "countAll", new String[0]);
    private static Log _log = LogFactoryUtil.getLog(UserOrganizationPersistenceImpl.class);
    @BeanReference(name = "pl.mamzdanie.userorganization.svc.service.persistence.UserOrganizationPersistence.impl")
    protected pl.mamzdanie.userorganization.svc.service.persistence.UserOrganizationPersistence userOrganizationPersistence;

    public void cacheResult(UserOrganization userOrganization) {
        EntityCacheUtil.putResult(UserOrganizationModelImpl.ENTITY_CACHE_ENABLED,
            UserOrganizationImpl.class, userOrganization.getPrimaryKey(),
            userOrganization);
    }

    public void cacheResult(List<UserOrganization> userOrganizations) {
        for (UserOrganization userOrganization : userOrganizations) {
            if (EntityCacheUtil.getResult(
                        UserOrganizationModelImpl.ENTITY_CACHE_ENABLED,
                        UserOrganizationImpl.class,
                        userOrganization.getPrimaryKey(), this) == null) {
                cacheResult(userOrganization);
            }
        }
    }

    public void clearCache() {
        CacheRegistry.clear(UserOrganizationImpl.class.getName());
        EntityCacheUtil.clearCache(UserOrganizationImpl.class.getName());
        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_ENTITY);
        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST);
    }

    public UserOrganization create(long id) {
        UserOrganization userOrganization = new UserOrganizationImpl();

        userOrganization.setNew(true);
        userOrganization.setPrimaryKey(id);

        return userOrganization;
    }

    public UserOrganization remove(long id)
        throws NoSuchUserOrganizationException, SystemException {
        Session session = null;

        try {
            session = openSession();

            UserOrganization userOrganization = (UserOrganization) session.get(UserOrganizationImpl.class,
                    new Long(id));

            if (userOrganization == null) {
                if (_log.isWarnEnabled()) {
                    _log.warn(
                        "No UserOrganization exists with the primary key " +
                        id);
                }

                throw new NoSuchUserOrganizationException(
                    "No UserOrganization exists with the primary key " + id);
            }

            return remove(userOrganization);
        } catch (NoSuchUserOrganizationException nsee) {
            throw nsee;
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }
    }

    public UserOrganization remove(UserOrganization userOrganization)
        throws SystemException {
        for (ModelListener<UserOrganization> listener : listeners) {
            listener.onBeforeRemove(userOrganization);
        }

        userOrganization = removeImpl(userOrganization);

        for (ModelListener<UserOrganization> listener : listeners) {
            listener.onAfterRemove(userOrganization);
        }

        return userOrganization;
    }

    protected UserOrganization removeImpl(UserOrganization userOrganization)
        throws SystemException {
        Session session = null;

        try {
            session = openSession();

            if (userOrganization.isCachedModel() ||
                    BatchSessionUtil.isEnabled()) {
                Object staleObject = session.get(UserOrganizationImpl.class,
                        userOrganization.getPrimaryKeyObj());

                if (staleObject != null) {
                    session.evict(staleObject);
                }
            }

            session.delete(userOrganization);

            session.flush();
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }

        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST);

        EntityCacheUtil.removeResult(UserOrganizationModelImpl.ENTITY_CACHE_ENABLED,
            UserOrganizationImpl.class, userOrganization.getPrimaryKey());

        return userOrganization;
    }

    /**
     * @deprecated Use <code>update(UserOrganization userOrganization, boolean merge)</code>.
     */
    public UserOrganization update(UserOrganization userOrganization)
        throws SystemException {
        if (_log.isWarnEnabled()) {
            _log.warn(
                "Using the deprecated update(UserOrganization userOrganization) method. Use update(UserOrganization userOrganization, boolean merge) instead.");
        }

        return update(userOrganization, false);
    }

    /**
     * Add, update, or merge, the entity. This method also calls the model
     * listeners to trigger the proper events associated with adding, deleting,
     * or updating an entity.
     *
     * @param                userOrganization the entity to add, update, or merge
     * @param                merge boolean value for whether to merge the entity. The
     *                                default value is false. Setting merge to true is more
     *                                expensive and should only be true when userOrganization is
     *                                transient. See LEP-5473 for a detailed discussion of this
     *                                method.
     * @return                true if the portlet can be displayed via Ajax
     */
    public UserOrganization update(UserOrganization userOrganization,
        boolean merge) throws SystemException {
        boolean isNew = userOrganization.isNew();

        for (ModelListener<UserOrganization> listener : listeners) {
            if (isNew) {
                listener.onBeforeCreate(userOrganization);
            } else {
                listener.onBeforeUpdate(userOrganization);
            }
        }

        userOrganization = updateImpl(userOrganization, merge);

        for (ModelListener<UserOrganization> listener : listeners) {
            if (isNew) {
                listener.onAfterCreate(userOrganization);
            } else {
                listener.onAfterUpdate(userOrganization);
            }
        }

        return userOrganization;
    }

    public UserOrganization updateImpl(
        pl.mamzdanie.userorganization.svc.model.UserOrganization userOrganization,
        boolean merge) throws SystemException {
        Session session = null;

        try {
            session = openSession();

            BatchSessionUtil.update(session, userOrganization, merge);

            userOrganization.setNew(false);
        } catch (Exception e) {
            throw processException(e);
        } finally {
            closeSession(session);
        }

        FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST);

        EntityCacheUtil.putResult(UserOrganizationModelImpl.ENTITY_CACHE_ENABLED,
            UserOrganizationImpl.class, userOrganization.getPrimaryKey(),
            userOrganization);

        return userOrganization;
    }

    public UserOrganization findByPrimaryKey(long id)
        throws NoSuchUserOrganizationException, SystemException {
        UserOrganization userOrganization = fetchByPrimaryKey(id);

        if (userOrganization == null) {
            if (_log.isWarnEnabled()) {
                _log.warn("No UserOrganization exists with the primary key " +
                    id);
            }

            throw new NoSuchUserOrganizationException(
                "No UserOrganization exists with the primary key " + id);
        }

        return userOrganization;
    }

    public UserOrganization fetchByPrimaryKey(long id)
        throws SystemException {
        UserOrganization userOrganization = (UserOrganization) EntityCacheUtil.getResult(UserOrganizationModelImpl.ENTITY_CACHE_ENABLED,
                UserOrganizationImpl.class, id, this);

        if (userOrganization == null) {
            Session session = null;

            try {
                session = openSession();

                userOrganization = (UserOrganization) session.get(UserOrganizationImpl.class,
                        new Long(id));
            } catch (Exception e) {
                throw processException(e);
            } finally {
                if (userOrganization != null) {
                    cacheResult(userOrganization);
                }

                closeSession(session);
            }
        }

        return userOrganization;
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

    public List<UserOrganization> findAll() throws SystemException {
        return findAll(QueryUtil.ALL_POS, QueryUtil.ALL_POS, null);
    }

    public List<UserOrganization> findAll(int start, int end)
        throws SystemException {
        return findAll(start, end, null);
    }

    public List<UserOrganization> findAll(int start, int end,
        OrderByComparator obc) throws SystemException {
        Object[] finderArgs = new Object[] {
                String.valueOf(start), String.valueOf(end), String.valueOf(obc)
            };

        List<UserOrganization> list = (List<UserOrganization>) FinderCacheUtil.getResult(FINDER_PATH_FIND_ALL,
                finderArgs, this);

        if (list == null) {
            Session session = null;

            try {
                session = openSession();

                StringBuilder query = new StringBuilder();

                query.append(
                    "FROM pl.mamzdanie.userorganization.svc.model.UserOrganization ");

                if (obc != null) {
                    query.append("ORDER BY ");
                    query.append(obc.getOrderBy());
                }

                Query q = session.createQuery(query.toString());

                if (obc == null) {
                    list = (List<UserOrganization>) QueryUtil.list(q,
                            getDialect(), start, end, false);

                    Collections.sort(list);
                } else {
                    list = (List<UserOrganization>) QueryUtil.list(q,
                            getDialect(), start, end);
                }
            } catch (Exception e) {
                throw processException(e);
            } finally {
                if (list == null) {
                    list = new ArrayList<UserOrganization>();
                }

                cacheResult(list);

                FinderCacheUtil.putResult(FINDER_PATH_FIND_ALL, finderArgs, list);

                closeSession(session);
            }
        }

        return list;
    }

    public void removeAll() throws SystemException {
        for (UserOrganization userOrganization : findAll()) {
            remove(userOrganization);
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
                        "SELECT COUNT(*) FROM pl.mamzdanie.userorganization.svc.model.UserOrganization");

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
                        "value.object.listener.pl.mamzdanie.userorganization.svc.model.UserOrganization")));

        if (listenerClassNames.length > 0) {
            try {
                List<ModelListener<UserOrganization>> listenersList = new ArrayList<ModelListener<UserOrganization>>();

                for (String listenerClassName : listenerClassNames) {
                    listenersList.add((ModelListener<UserOrganization>) Class.forName(
                            listenerClassName).newInstance());
                }

                listeners = listenersList.toArray(new ModelListener[listenersList.size()]);
            } catch (Exception e) {
                _log.error(e);
            }
        }
    }
}
