package pl.mamzdanie.useraddon.svc.model;

import com.liferay.portal.model.BaseModel;


/**
 * <a href="UserAddonModel.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This interface is a model that represents the <code>UserAddon</code>
 * table in the database.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.useraddon.svc.model.UserAddon
 * @see pl.mamzdanie.useraddon.svc.model.impl.UserAddonImpl
 * @see pl.mamzdanie.useraddon.svc.model.impl.UserAddonModelImpl
 *
 */
public interface UserAddonModel extends BaseModel<UserAddon> {
    public long getPrimaryKey();

    public void setPrimaryKey(long pk);

    public long getUserId();

    public void setUserId(long userId);

    public String getPhone();

    public void setPhone(String phone);

    public String getPosition();

    public void setPosition(String position);

    public Long getOrganizationId();

    public void setOrganizationId(Long organizationId);

    public Boolean getNotify();

    public void setNotify(Boolean notify);

    public String getApiKey();

    public void setApiKey(String apiKey);

    public String getDescription();

    public void setDescription(String description);

    public UserAddon toEscapedModel();
}
