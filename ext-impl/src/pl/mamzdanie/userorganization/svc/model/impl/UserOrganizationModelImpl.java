package pl.mamzdanie.userorganization.svc.model.impl;

import com.liferay.portal.kernel.bean.ReadOnlyBeanHandler;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.HtmlUtil;
import com.liferay.portal.model.impl.BaseModelImpl;

import com.liferay.portlet.expando.model.ExpandoBridge;
import com.liferay.portlet.expando.model.impl.ExpandoBridgeImpl;

import pl.mamzdanie.userorganization.svc.model.UserOrganization;
import pl.mamzdanie.userorganization.svc.model.UserOrganizationSoap;

import java.io.Serializable;

import java.lang.reflect.Proxy;

import java.sql.Types;

import java.util.ArrayList;
import java.util.List;


/**
 * <a href="UserOrganizationModelImpl.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This class is a model that represents the <code>UserOrganization</code> table
 * in the database.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.userorganization.svc.model.UserOrganization
 * @see pl.mamzdanie.userorganization.svc.model.UserOrganizationModel
 * @see pl.mamzdanie.userorganization.svc.model.impl.UserOrganizationImpl
 *
 */
public class UserOrganizationModelImpl extends BaseModelImpl<UserOrganization> {
    public static final String TABLE_NAME = "mz_organization";
    public static final Object[][] TABLE_COLUMNS = {
            { "id", new Integer(Types.BIGINT) },
            

            { "name", new Integer(Types.VARCHAR) },
            

            { "address", new Integer(Types.VARCHAR) },
            

            { "postal_code", new Integer(Types.VARCHAR) },
            

            { "city", new Integer(Types.VARCHAR) },
            

            { "phone", new Integer(Types.VARCHAR) },
            

            { "fax", new Integer(Types.VARCHAR) },
            

            { "email", new Integer(Types.VARCHAR) }
        };
    public static final String TABLE_SQL_CREATE = "create table mz_organization (id LONG not null primary key,name VARCHAR(75) null,address VARCHAR(75) null,postal_code VARCHAR(75) null,city VARCHAR(75) null,phone VARCHAR(75) null,fax VARCHAR(75) null,email VARCHAR(75) null)";
    public static final String TABLE_SQL_DROP = "drop table mz_organization";
    public static final String DATA_SOURCE = "liferayDataSource";
    public static final String SESSION_FACTORY = "liferaySessionFactory";
    public static final String TX_MANAGER = "liferayTransactionManager";
    public static final boolean ENTITY_CACHE_ENABLED = GetterUtil.getBoolean(com.liferay.portal.util.PropsUtil.get(
                "value.object.entity.cache.enabled.pl.mamzdanie.userorganization.svc.model.UserOrganization"),
            true);
    public static final boolean FINDER_CACHE_ENABLED = GetterUtil.getBoolean(com.liferay.portal.util.PropsUtil.get(
                "value.object.finder.cache.enabled.pl.mamzdanie.userorganization.svc.model.UserOrganization"),
            true);
    public static final long LOCK_EXPIRATION_TIME = GetterUtil.getLong(com.liferay.portal.util.PropsUtil.get(
                "lock.expiration.time.pl.mamzdanie.userorganization.svc.model.UserOrganization"));
    private long _id;
    private String _name;
    private String _address;
    private String _postalCode;
    private String _city;
    private String _phone;
    private String _fax;
    private String _email;
    private transient ExpandoBridge _expandoBridge;

    public UserOrganizationModelImpl() {
    }

    public static UserOrganization toModel(UserOrganizationSoap soapModel) {
        UserOrganization model = new UserOrganizationImpl();

        model.setId(soapModel.getId());
        model.setName(soapModel.getName());
        model.setAddress(soapModel.getAddress());
        model.setPostalCode(soapModel.getPostalCode());
        model.setCity(soapModel.getCity());
        model.setPhone(soapModel.getPhone());
        model.setFax(soapModel.getFax());
        model.setEmail(soapModel.getEmail());

        return model;
    }

    public static List<UserOrganization> toModels(
        UserOrganizationSoap[] soapModels) {
        List<UserOrganization> models = new ArrayList<UserOrganization>(soapModels.length);

        for (UserOrganizationSoap soapModel : soapModels) {
            models.add(toModel(soapModel));
        }

        return models;
    }

    public long getPrimaryKey() {
        return _id;
    }

    public void setPrimaryKey(long pk) {
        setId(pk);
    }

    public Serializable getPrimaryKeyObj() {
        return new Long(_id);
    }

    public long getId() {
        return _id;
    }

    public void setId(long id) {
        _id = id;
    }

    public String getName() {
        return GetterUtil.getString(_name);
    }

    public void setName(String name) {
        _name = name;
    }

    public String getAddress() {
        return GetterUtil.getString(_address);
    }

    public void setAddress(String address) {
        _address = address;
    }

    public String getPostalCode() {
        return GetterUtil.getString(_postalCode);
    }

    public void setPostalCode(String postalCode) {
        _postalCode = postalCode;
    }

    public String getCity() {
        return GetterUtil.getString(_city);
    }

    public void setCity(String city) {
        _city = city;
    }

    public String getPhone() {
        return GetterUtil.getString(_phone);
    }

    public void setPhone(String phone) {
        _phone = phone;
    }

    public String getFax() {
        return GetterUtil.getString(_fax);
    }

    public void setFax(String fax) {
        _fax = fax;
    }

    public String getEmail() {
        return GetterUtil.getString(_email);
    }

    public void setEmail(String email) {
        _email = email;
    }

    public UserOrganization toEscapedModel() {
        if (isEscapedModel()) {
            return (UserOrganization) this;
        } else {
            UserOrganization model = new UserOrganizationImpl();

            model.setNew(isNew());
            model.setEscapedModel(true);

            model.setId(getId());
            model.setName(HtmlUtil.escape(getName()));
            model.setAddress(HtmlUtil.escape(getAddress()));
            model.setPostalCode(HtmlUtil.escape(getPostalCode()));
            model.setCity(HtmlUtil.escape(getCity()));
            model.setPhone(HtmlUtil.escape(getPhone()));
            model.setFax(HtmlUtil.escape(getFax()));
            model.setEmail(HtmlUtil.escape(getEmail()));

            model = (UserOrganization) Proxy.newProxyInstance(UserOrganization.class.getClassLoader(),
                    new Class[] { UserOrganization.class },
                    new ReadOnlyBeanHandler(model));

            return model;
        }
    }

    public ExpandoBridge getExpandoBridge() {
        if (_expandoBridge == null) {
            _expandoBridge = new ExpandoBridgeImpl(UserOrganization.class.getName(),
                    getPrimaryKey());
        }

        return _expandoBridge;
    }

    public Object clone() {
        UserOrganizationImpl clone = new UserOrganizationImpl();

        clone.setId(getId());
        clone.setName(getName());
        clone.setAddress(getAddress());
        clone.setPostalCode(getPostalCode());
        clone.setCity(getCity());
        clone.setPhone(getPhone());
        clone.setFax(getFax());
        clone.setEmail(getEmail());

        return clone;
    }

    public int compareTo(UserOrganization userOrganization) {
        long pk = userOrganization.getPrimaryKey();

        if (getPrimaryKey() < pk) {
            return -1;
        } else if (getPrimaryKey() > pk) {
            return 1;
        } else {
            return 0;
        }
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }

        UserOrganization userOrganization = null;

        try {
            userOrganization = (UserOrganization) obj;
        } catch (ClassCastException cce) {
            return false;
        }

        long pk = userOrganization.getPrimaryKey();

        if (getPrimaryKey() == pk) {
            return true;
        } else {
            return false;
        }
    }

    public int hashCode() {
        return (int) getPrimaryKey();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();

        sb.append("{id=");
        sb.append(getId());
        sb.append(", name=");
        sb.append(getName());
        sb.append(", address=");
        sb.append(getAddress());
        sb.append(", postalCode=");
        sb.append(getPostalCode());
        sb.append(", city=");
        sb.append(getCity());
        sb.append(", phone=");
        sb.append(getPhone());
        sb.append(", fax=");
        sb.append(getFax());
        sb.append(", email=");
        sb.append(getEmail());
        sb.append("}");

        return sb.toString();
    }

    public String toXmlString() {
        StringBuilder sb = new StringBuilder();

        sb.append("<model><model-name>");
        sb.append("pl.mamzdanie.userorganization.svc.model.UserOrganization");
        sb.append("</model-name>");

        sb.append(
            "<column><column-name>id</column-name><column-value><![CDATA[");
        sb.append(getId());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>name</column-name><column-value><![CDATA[");
        sb.append(getName());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>address</column-name><column-value><![CDATA[");
        sb.append(getAddress());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>postalCode</column-name><column-value><![CDATA[");
        sb.append(getPostalCode());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>city</column-name><column-value><![CDATA[");
        sb.append(getCity());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>phone</column-name><column-value><![CDATA[");
        sb.append(getPhone());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>fax</column-name><column-value><![CDATA[");
        sb.append(getFax());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>email</column-name><column-value><![CDATA[");
        sb.append(getEmail());
        sb.append("]]></column-value></column>");

        sb.append("</model>");

        return sb.toString();
    }
}
