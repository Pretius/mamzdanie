package pl.mamzdanie.userorganization.svc.model;

import com.liferay.portal.model.BaseModel;


/**
 * <a href="UserOrganizationModel.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This interface is a model that represents the <code>UserOrganization</code>
 * table in the database.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.userorganization.svc.model.UserOrganization
 * @see pl.mamzdanie.userorganization.svc.model.impl.UserOrganizationImpl
 * @see pl.mamzdanie.userorganization.svc.model.impl.UserOrganizationModelImpl
 *
 */
public interface UserOrganizationModel extends BaseModel<UserOrganization> {
    public long getPrimaryKey();

    public void setPrimaryKey(long pk);

    public long getId();

    public void setId(long id);

    public String getName();

    public void setName(String name);

    public String getAddress();

    public void setAddress(String address);

    public String getPostalCode();

    public void setPostalCode(String postalCode);

    public String getCity();

    public void setCity(String city);

    public String getPhone();

    public void setPhone(String phone);

    public String getFax();

    public void setFax(String fax);

    public String getEmail();

    public void setEmail(String email);

    public UserOrganization toEscapedModel();
}
