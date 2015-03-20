package pl.mamzdanie.useraddon.svc.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import pl.mamzdanie.CommonUtils;
import pl.mamzdanie.useraddon.svc.model.UserAddon;
import pl.mamzdanie.useraddon.svc.service.base.UserAddonLocalServiceBaseImpl;

import com.liferay.portal.NoSuchRoleException;
import com.liferay.portal.PortalException;
import com.liferay.portal.SystemException;
import com.liferay.portal.dao.orm.hibernate.DynamicQueryImpl;
import com.liferay.portal.kernel.dao.orm.DynamicQuery;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.User;
import com.liferay.portal.service.persistence.RoleFinderUtil;

public class UserAddonLocalServiceImpl extends UserAddonLocalServiceBaseImpl {

	public Role getUserRole(String roleName) throws NoSuchRoleException, SystemException {
		return RoleFinderUtil.findByC_N(10113, roleName);
	}

	public UserAddon getUserDetails(int id) throws PortalException, SystemException {
		return getUserAddon(id);
	}

	public String getUserFirstName(int id) {
		try {
			return userAddonFinder.getUserFirstName(id);
		} catch (SystemException e) {
			e.printStackTrace();
		}
		return null;

	}

	public String getUserLastName(int id) {
		try {
			return userAddonFinder.getUserLastName(id);
		} catch (SystemException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<User> findByNotifyFlag(Boolean notify) throws SystemException {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(User.class);
		detachedCriteria.add(Restrictions
				.sqlRestriction("(select notify from mz_user_addon mua where mua.userid={alias}.userid)='true'"));

		DynamicQuery dynamicQuery = new DynamicQueryImpl(detachedCriteria);
		return CommonUtils.filter(dynamicQuery(dynamicQuery), User.class);
	}

	public UserAddon findByApiKey(String apiKey) throws SystemException {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UserAddon.class);
		detachedCriteria.add(Restrictions.eq("apiKey", apiKey));

		DynamicQuery dynamicQuery = new DynamicQueryImpl(detachedCriteria);

		List<Object> userAddons = dynamicQuery(dynamicQuery);
		UserAddon userAddon = null;
		if (userAddons.size() > 0)
			userAddon = (UserAddon) userAddons.get(0);

		return userAddon;

	}
}
