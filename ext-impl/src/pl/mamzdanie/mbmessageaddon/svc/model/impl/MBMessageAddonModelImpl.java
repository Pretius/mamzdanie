package pl.mamzdanie.mbmessageaddon.svc.model.impl;

import com.liferay.portal.kernel.bean.ReadOnlyBeanHandler;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.HtmlUtil;
import com.liferay.portal.model.impl.BaseModelImpl;

import pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon;
import pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddonSoap;

import java.io.Serializable;

import java.lang.reflect.Proxy;

import java.sql.Types;

import java.util.ArrayList;
import java.util.List;


/**
 * <a href="MBMessageAddonModelImpl.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This class is a model that represents the <code>MBMessageAddon</code> table
 * in the database.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon
 * @see pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddonModel
 * @see pl.mamzdanie.mbmessageaddon.svc.model.impl.MBMessageAddonImpl
 *
 */
public class MBMessageAddonModelImpl extends BaseModelImpl<MBMessageAddon> {
    public static final String TABLE_NAME = "mz_mbmessage_addon";
    public static final Object[][] TABLE_COLUMNS = {
            { "message_id", new Integer(Types.BIGINT) },
            

            { "user_id", new Integer(Types.BIGINT) },
            

            { "issuer_id", new Integer(Types.BIGINT) },
            

            { "thread_id", new Integer(Types.BIGINT) },
            

            { "license_type", new Integer(Types.VARCHAR) },
            

            { "status", new Integer(Types.VARCHAR) },
            

            { "comments", new Integer(Types.VARCHAR) },
            

            { "old_message_id", new Integer(Types.BIGINT) },
            

            { "active", new Integer(Types.BOOLEAN) },
            

            { "visible", new Integer(Types.BOOLEAN) }
        };
    public static final String TABLE_SQL_CREATE = "create table mz_mbmessage_addon (message_id LONG not null primary key,user_id LONG,issuer_id LONG,thread_id LONG,license_type VARCHAR(75) null,status VARCHAR(75) null,comments VARCHAR(75) null,old_message_id LONG,active BOOLEAN,visible BOOLEAN)";
    public static final String TABLE_SQL_DROP = "drop table mz_mbmessage_addon";
    public static final String DATA_SOURCE = "liferayDataSource";
    public static final String SESSION_FACTORY = "liferaySessionFactory";
    public static final String TX_MANAGER = "liferayTransactionManager";
    public static final boolean ENTITY_CACHE_ENABLED = GetterUtil.getBoolean(com.liferay.portal.util.PropsUtil.get(
                "value.object.entity.cache.enabled.pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon"),
            true);
    public static final boolean FINDER_CACHE_ENABLED = GetterUtil.getBoolean(com.liferay.portal.util.PropsUtil.get(
                "value.object.finder.cache.enabled.pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon"),
            true);
    public static final long LOCK_EXPIRATION_TIME = GetterUtil.getLong(com.liferay.portal.util.PropsUtil.get(
                "lock.expiration.time.pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon"));
    private Long _messageId;
    private Long _userId;
    private Long _issuerId;
    private Long _threadId;
    private String _licenseType;
    private String _status;
    private String _comments;
    private Long _oldMessageId;
    private Boolean _active;
    private Boolean _visible;

    public MBMessageAddonModelImpl() {
    }

    public static MBMessageAddon toModel(MBMessageAddonSoap soapModel) {
        MBMessageAddon model = new MBMessageAddonImpl();

        model.setMessageId(soapModel.getMessageId());
        model.setUserId(soapModel.getUserId());
        model.setIssuerId(soapModel.getIssuerId());
        model.setThreadId(soapModel.getThreadId());
        model.setLicenseType(soapModel.getLicenseType());
        model.setStatus(soapModel.getStatus());
        model.setComments(soapModel.getComments());
        model.setOldMessageId(soapModel.getOldMessageId());
        model.setActive(soapModel.getActive());
        model.setVisible(soapModel.getVisible());

        return model;
    }

    public static List<MBMessageAddon> toModels(MBMessageAddonSoap[] soapModels) {
        List<MBMessageAddon> models = new ArrayList<MBMessageAddon>(soapModels.length);

        for (MBMessageAddonSoap soapModel : soapModels) {
            models.add(toModel(soapModel));
        }

        return models;
    }

    public Long getPrimaryKey() {
        return _messageId;
    }

    public void setPrimaryKey(Long pk) {
        setMessageId(pk);
    }

    public Serializable getPrimaryKeyObj() {
        return _messageId;
    }

    public Long getMessageId() {
        return _messageId;
    }

    public void setMessageId(Long messageId) {
        _messageId = messageId;
    }

    public Long getUserId() {
        return _userId;
    }

    public void setUserId(Long userId) {
        _userId = userId;
    }

    public Long getIssuerId() {
        return _issuerId;
    }

    public void setIssuerId(Long issuerId) {
        _issuerId = issuerId;
    }

    public Long getThreadId() {
        return _threadId;
    }

    public void setThreadId(Long threadId) {
        _threadId = threadId;
    }

    public String getLicenseType() {
        return GetterUtil.getString(_licenseType);
    }

    public void setLicenseType(String licenseType) {
        _licenseType = licenseType;
    }

    public String getStatus() {
        return GetterUtil.getString(_status);
    }

    public void setStatus(String status) {
        _status = status;
    }

    public String getComments() {
        return GetterUtil.getString(_comments);
    }

    public void setComments(String comments) {
        _comments = comments;
    }

    public Long getOldMessageId() {
        return _oldMessageId;
    }

    public void setOldMessageId(Long oldMessageId) {
        _oldMessageId = oldMessageId;
    }

    public Boolean getActive() {
        return _active;
    }

    public void setActive(Boolean active) {
        _active = active;
    }

    public Boolean getVisible() {
        return _visible;
    }

    public void setVisible(Boolean visible) {
        _visible = visible;
    }

    public MBMessageAddon toEscapedModel() {
        if (isEscapedModel()) {
            return (MBMessageAddon) this;
        } else {
            MBMessageAddon model = new MBMessageAddonImpl();

            model.setNew(isNew());
            model.setEscapedModel(true);

            model.setMessageId(getMessageId());
            model.setUserId(getUserId());
            model.setIssuerId(getIssuerId());
            model.setThreadId(getThreadId());
            model.setLicenseType(HtmlUtil.escape(getLicenseType()));
            model.setStatus(HtmlUtil.escape(getStatus()));
            model.setComments(HtmlUtil.escape(getComments()));
            model.setOldMessageId(getOldMessageId());
            model.setActive(getActive());
            model.setVisible(getVisible());

            model = (MBMessageAddon) Proxy.newProxyInstance(MBMessageAddon.class.getClassLoader(),
                    new Class[] { MBMessageAddon.class },
                    new ReadOnlyBeanHandler(model));

            return model;
        }
    }

    public Object clone() {
        MBMessageAddonImpl clone = new MBMessageAddonImpl();

        clone.setMessageId(getMessageId());
        clone.setUserId(getUserId());
        clone.setIssuerId(getIssuerId());
        clone.setThreadId(getThreadId());
        clone.setLicenseType(getLicenseType());
        clone.setStatus(getStatus());
        clone.setComments(getComments());
        clone.setOldMessageId(getOldMessageId());
        clone.setActive(getActive());
        clone.setVisible(getVisible());

        return clone;
    }

    public int compareTo(MBMessageAddon mbMessageAddon) {
        Long pk = mbMessageAddon.getPrimaryKey();

        return getPrimaryKey().compareTo(pk);
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }

        MBMessageAddon mbMessageAddon = null;

        try {
            mbMessageAddon = (MBMessageAddon) obj;
        } catch (ClassCastException cce) {
            return false;
        }

        Long pk = mbMessageAddon.getPrimaryKey();

        if (getPrimaryKey().equals(pk)) {
            return true;
        } else {
            return false;
        }
    }

    public int hashCode() {
        return getPrimaryKey().hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();

        sb.append("{messageId=");
        sb.append(getMessageId());
        sb.append(", userId=");
        sb.append(getUserId());
        sb.append(", issuerId=");
        sb.append(getIssuerId());
        sb.append(", threadId=");
        sb.append(getThreadId());
        sb.append(", licenseType=");
        sb.append(getLicenseType());
        sb.append(", status=");
        sb.append(getStatus());
        sb.append(", comments=");
        sb.append(getComments());
        sb.append(", oldMessageId=");
        sb.append(getOldMessageId());
        sb.append(", active=");
        sb.append(getActive());
        sb.append(", visible=");
        sb.append(getVisible());
        sb.append("}");

        return sb.toString();
    }

    public String toXmlString() {
        StringBuilder sb = new StringBuilder();

        sb.append("<model><model-name>");
        sb.append("pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon");
        sb.append("</model-name>");

        sb.append(
            "<column><column-name>messageId</column-name><column-value><![CDATA[");
        sb.append(getMessageId());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>userId</column-name><column-value><![CDATA[");
        sb.append(getUserId());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>issuerId</column-name><column-value><![CDATA[");
        sb.append(getIssuerId());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>threadId</column-name><column-value><![CDATA[");
        sb.append(getThreadId());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>licenseType</column-name><column-value><![CDATA[");
        sb.append(getLicenseType());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>status</column-name><column-value><![CDATA[");
        sb.append(getStatus());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>comments</column-name><column-value><![CDATA[");
        sb.append(getComments());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>oldMessageId</column-name><column-value><![CDATA[");
        sb.append(getOldMessageId());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>active</column-name><column-value><![CDATA[");
        sb.append(getActive());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>visible</column-name><column-value><![CDATA[");
        sb.append(getVisible());
        sb.append("]]></column-value></column>");

        sb.append("</model>");

        return sb.toString();
    }
}
