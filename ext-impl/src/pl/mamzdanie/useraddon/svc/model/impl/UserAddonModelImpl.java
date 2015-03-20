package pl.mamzdanie.useraddon.svc.model.impl;

import com.liferay.portal.kernel.bean.ReadOnlyBeanHandler;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.HtmlUtil;
import com.liferay.portal.model.impl.BaseModelImpl;

import com.liferay.portlet.expando.model.ExpandoBridge;
import com.liferay.portlet.expando.model.impl.ExpandoBridgeImpl;

import pl.mamzdanie.useraddon.svc.model.UserAddon;
import pl.mamzdanie.useraddon.svc.model.UserAddonSoap;

import java.io.Serializable;

import java.lang.reflect.Proxy;

import java.sql.Types;

import java.util.ArrayList;
import java.util.List;


/**
 * <a href="UserAddonModelImpl.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This class is a model that represents the <code>UserAddon</code> table
 * in the database.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.useraddon.svc.model.UserAddon
 * @see pl.mamzdanie.useraddon.svc.model.UserAddonModel
 * @see pl.mamzdanie.useraddon.svc.model.impl.UserAddonImpl
 *
 */
public class UserAddonModelImpl extends BaseModelImpl<UserAddon> {
    public static final String TABLE_NAME = "mz_user_addon";
    public static final Object[][] TABLE_COLUMNS = {
            { "userid", new Integer(Types.BIGINT) },
            

            { "phone", new Integer(Types.VARCHAR) },
            

            { "companyposition", new Integer(Types.VARCHAR) },
            

            { "organizationid", new Integer(Types.BIGINT) },
            

            { "notify", new Integer(Types.BOOLEAN) },
            

            { "apikey", new Integer(Types.VARCHAR) },
            

            { "description", new Integer(Types.VARCHAR) }
        };
    public static final String TABLE_SQL_CREATE = "create table mz_user_addon (userid LONG not null primary key,phone VARCHAR(75) null,companyposition VARCHAR(75) null,organizationid LONG,notify BOOLEAN,apikey VARCHAR(75) null,description VARCHAR(75) null)";
    public static final String TABLE_SQL_DROP = "drop table mz_user_addon";
    public static final String DATA_SOURCE = "liferayDataSource";
    public static final String SESSION_FACTORY = "liferaySessionFactory";
    public static final String TX_MANAGER = "liferayTransactionManager";
    public static final boolean ENTITY_CACHE_ENABLED = GetterUtil.getBoolean(com.liferay.portal.util.PropsUtil.get(
                "value.object.entity.cache.enabled.pl.mamzdanie.useraddon.svc.model.UserAddon"),
            true);
    public static final boolean FINDER_CACHE_ENABLED = GetterUtil.getBoolean(com.liferay.portal.util.PropsUtil.get(
                "value.object.finder.cache.enabled.pl.mamzdanie.useraddon.svc.model.UserAddon"),
            true);
    public static final long LOCK_EXPIRATION_TIME = GetterUtil.getLong(com.liferay.portal.util.PropsUtil.get(
                "lock.expiration.time.pl.mamzdanie.useraddon.svc.model.UserAddon"));
    private long _userId;
    private String _phone;
    private String _position;
    private Long _organizationId;
    private Boolean _notify;
    private String _apiKey;
    private String _description;
    private transient ExpandoBridge _expandoBridge;

    public UserAddonModelImpl() {
    }

    public static UserAddon toModel(UserAddonSoap soapModel) {
        UserAddon model = new UserAddonImpl();

        model.setUserId(soapModel.getUserId());
        model.setPhone(soapModel.getPhone());
        model.setPosition(soapModel.getPosition());
        model.setOrganizationId(soapModel.getOrganizationId());
        model.setNotify(soapModel.getNotify());
        model.setApiKey(soapModel.getApiKey());
        model.setDescription(soapModel.getDescription());

        return model;
    }

    public static List<UserAddon> toModels(UserAddonSoap[] soapModels) {
        List<UserAddon> models = new ArrayList<UserAddon>(soapModels.length);

        for (UserAddonSoap soapModel : soapModels) {
            models.add(toModel(soapModel));
        }

        return models;
    }

    public long getPrimaryKey() {
        return _userId;
    }

    public void setPrimaryKey(long pk) {
        setUserId(pk);
    }

    public Serializable getPrimaryKeyObj() {
        return new Long(_userId);
    }

    public long getUserId() {
        return _userId;
    }

    public void setUserId(long userId) {
        _userId = userId;
    }

    public String getPhone() {
        return GetterUtil.getString(_phone);
    }

    public void setPhone(String phone) {
        _phone = phone;
    }

    public String getPosition() {
        return GetterUtil.getString(_position);
    }

    public void setPosition(String position) {
        _position = position;
    }

    public Long getOrganizationId() {
        return _organizationId;
    }

    public void setOrganizationId(Long organizationId) {
        _organizationId = organizationId;
    }

    public Boolean getNotify() {
        return _notify;
    }

    public void setNotify(Boolean notify) {
        _notify = notify;
    }

    public String getApiKey() {
        return GetterUtil.getString(_apiKey);
    }

    public void setApiKey(String apiKey) {
        _apiKey = apiKey;
    }

    public String getDescription() {
        return GetterUtil.getString(_description);
    }

    public void setDescription(String description) {
        _description = description;
    }

    public UserAddon toEscapedModel() {
        if (isEscapedModel()) {
            return (UserAddon) this;
        } else {
            UserAddon model = new UserAddonImpl();

            model.setNew(isNew());
            model.setEscapedModel(true);

            model.setUserId(getUserId());
            model.setPhone(HtmlUtil.escape(getPhone()));
            model.setPosition(HtmlUtil.escape(getPosition()));
            model.setOrganizationId(getOrganizationId());
            model.setNotify(getNotify());
            model.setApiKey(HtmlUtil.escape(getApiKey()));
            model.setDescription(HtmlUtil.escape(getDescription()));

            model = (UserAddon) Proxy.newProxyInstance(UserAddon.class.getClassLoader(),
                    new Class[] { UserAddon.class },
                    new ReadOnlyBeanHandler(model));

            return model;
        }
    }

    public ExpandoBridge getExpandoBridge() {
        if (_expandoBridge == null) {
            _expandoBridge = new ExpandoBridgeImpl(UserAddon.class.getName(),
                    getPrimaryKey());
        }

        return _expandoBridge;
    }

    public Object clone() {
        UserAddonImpl clone = new UserAddonImpl();

        clone.setUserId(getUserId());
        clone.setPhone(getPhone());
        clone.setPosition(getPosition());
        clone.setOrganizationId(getOrganizationId());
        clone.setNotify(getNotify());
        clone.setApiKey(getApiKey());
        clone.setDescription(getDescription());

        return clone;
    }

    public int compareTo(UserAddon userAddon) {
        long pk = userAddon.getPrimaryKey();

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

        UserAddon userAddon = null;

        try {
            userAddon = (UserAddon) obj;
        } catch (ClassCastException cce) {
            return false;
        }

        long pk = userAddon.getPrimaryKey();

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

        sb.append("{userId=");
        sb.append(getUserId());
        sb.append(", phone=");
        sb.append(getPhone());
        sb.append(", position=");
        sb.append(getPosition());
        sb.append(", organizationId=");
        sb.append(getOrganizationId());
        sb.append(", notify=");
        sb.append(getNotify());
        sb.append(", apiKey=");
        sb.append(getApiKey());
        sb.append(", description=");
        sb.append(getDescription());
        sb.append("}");

        return sb.toString();
    }

    public String toXmlString() {
        StringBuilder sb = new StringBuilder();

        sb.append("<model><model-name>");
        sb.append("pl.mamzdanie.useraddon.svc.model.UserAddon");
        sb.append("</model-name>");

        sb.append(
            "<column><column-name>userId</column-name><column-value><![CDATA[");
        sb.append(getUserId());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>phone</column-name><column-value><![CDATA[");
        sb.append(getPhone());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>position</column-name><column-value><![CDATA[");
        sb.append(getPosition());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>organizationId</column-name><column-value><![CDATA[");
        sb.append(getOrganizationId());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>notify</column-name><column-value><![CDATA[");
        sb.append(getNotify());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>apiKey</column-name><column-value><![CDATA[");
        sb.append(getApiKey());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>description</column-name><column-value><![CDATA[");
        sb.append(getDescription());
        sb.append("]]></column-value></column>");

        sb.append("</model>");

        return sb.toString();
    }
}
