package pl.mamzdanie.useraddon.svc.service.persistence;

import pl.mamzdanie.useraddon.svc.model.UserAddon;
import pl.mamzdanie.useraddon.svc.model.impl.UserAddonImpl;

import com.liferay.portal.SystemException;
import com.liferay.portal.kernel.dao.orm.QueryPos;
import com.liferay.portal.kernel.dao.orm.SQLQuery;
import com.liferay.portal.kernel.dao.orm.Session;
import com.liferay.portal.service.persistence.impl.BasePersistenceImpl;
import com.liferay.util.dao.orm.CustomSQLUtil;

public class UserAddonFinderImpl extends BasePersistenceImpl implements UserAddonFinder {
	private static final String USER_FIRST_NAME_QUERY = "getUserFirstName";
	private static final String USER_LAST_NAME_QUERY = "getUserLastName";

	public String getUserLastName(int id) throws SystemException {

		Session session = null;
		try {
			session = openSession();
			String customSql = CustomSQLUtil.get(USER_LAST_NAME_QUERY);

			SQLQuery q = session.createSQLQuery(customSql);
			QueryPos qPos = QueryPos.getInstance(q);
			qPos.add(id);
			if (q.list().isEmpty())
				return null;
			return String.valueOf(q.list().get(0));

		} catch (Exception e) {
			throw new SystemException(e);
		} finally {
			closeSession(session);
		}
	}

	public String getUserFirstName(int id) throws SystemException {

		Session session = null;
		try {
			session = openSession();
			String customSql = CustomSQLUtil.get(USER_FIRST_NAME_QUERY);

			SQLQuery q = session.createSQLQuery(customSql);
			QueryPos qPos = QueryPos.getInstance(q);
			qPos.add(id);
			if (q.list().isEmpty())
				return null;
			return String.valueOf(q.list().get(0));
		} catch (Exception e) {
			throw new SystemException(e);
		} finally {
			closeSession(session);
		}
	}
}
