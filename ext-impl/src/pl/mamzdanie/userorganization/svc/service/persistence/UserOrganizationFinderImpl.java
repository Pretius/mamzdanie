package pl.mamzdanie.userorganization.svc.service.persistence;

import com.liferay.portal.SystemException;
import com.liferay.portal.kernel.dao.orm.QueryPos;
import com.liferay.portal.kernel.dao.orm.SQLQuery;
import com.liferay.portal.kernel.dao.orm.Session;
import com.liferay.portal.service.persistence.impl.BasePersistenceImpl;
import com.liferay.util.dao.orm.CustomSQLUtil;

import pl.mamzdanie.userorganization.svc.model.UserOrganization;
import pl.mamzdanie.userorganization.svc.model.impl.UserOrganizationImpl;

public class UserOrganizationFinderImpl extends BasePersistenceImpl implements
		UserOrganizationFinder {
	private static final String ORGANIZATION_DETAILS_QUERY = "getOrganizationDetails";

	public UserOrganization getUserOrganizationDetails(int id)
			throws SystemException {

		Session session = null;
		try {
			session = openSession();
			String customSql = CustomSQLUtil.get(ORGANIZATION_DETAILS_QUERY);

			SQLQuery q = session.createSQLQuery(customSql);
			q.addEntity("query", UserOrganizationImpl.class);
			QueryPos qPos = QueryPos.getInstance(q);
			qPos.add(id);
			if(q.list().isEmpty())
				return null;
			return (UserOrganizationImpl) q.list().get(0);

		} catch (Exception e) {
			throw new SystemException(e);
		} finally {
			closeSession(session);
		}
	}

}
