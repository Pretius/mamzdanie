package pl.mamzdanie.threaddetail.svc.model.impl;

import com.liferay.portal.kernel.bean.ReadOnlyBeanHandler;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.HtmlUtil;
import com.liferay.portal.model.impl.BaseModelImpl;

import com.liferay.portlet.expando.model.ExpandoBridge;
import com.liferay.portlet.expando.model.impl.ExpandoBridgeImpl;

import pl.mamzdanie.threaddetail.svc.model.ThreadDetail;
import pl.mamzdanie.threaddetail.svc.model.ThreadDetailSoap;

import java.io.Serializable;

import java.lang.reflect.Proxy;

import java.sql.Types;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * <a href="ThreadDetailModelImpl.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This class is a model that represents the <code>ThreadDetail</code> table
 * in the database.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.threaddetail.svc.model.ThreadDetail
 * @see pl.mamzdanie.threaddetail.svc.model.ThreadDetailModel
 * @see pl.mamzdanie.threaddetail.svc.model.impl.ThreadDetailImpl
 *
 */
public class ThreadDetailModelImpl extends BaseModelImpl<ThreadDetail> {
    public static final String TABLE_NAME = "mz_thread_detail";
    public static final Object[][] TABLE_COLUMNS = {
            { "rootmessageid", new Integer(Types.BIGINT) },
            

            { "username", new Integer(Types.VARCHAR) },
            

            { "subject", new Integer(Types.VARCHAR) },
            

            { "date_from", new Integer(Types.TIMESTAMP) },
            

            { "date_to", new Integer(Types.TIMESTAMP) },
            

            { "signature", new Integer(Types.VARCHAR) },
            

            { "quantity", new Integer(Types.BIGINT) },
            

            { "active", new Integer(Types.INTEGER) },
            

            { "accepted", new Integer(Types.BOOLEAN) },
            

            { "summary_id", new Integer(Types.BIGINT) },
            

            { "userid", new Integer(Types.BIGINT) },
            

            { "organizationId", new Integer(Types.BIGINT) },
            

            { "organizationName", new Integer(Types.VARCHAR) },
            

            { "threadId", new Integer(Types.BIGINT) }
        };
    public static final String TABLE_SQL_CREATE = "create table mz_thread_detail (rootmessageid LONG not null primary key,username VARCHAR(75) null,subject VARCHAR(75) null,date_from DATE null,date_to DATE null,signature VARCHAR(75) null,quantity LONG,active INTEGER,accepted BOOLEAN,summary_id LONG,userid LONG,organizationId LONG,organizationName VARCHAR(75) null,threadId LONG)";
    public static final String TABLE_SQL_DROP = "drop table mz_thread_detail";
    public static final String DATA_SOURCE = "liferayDataSource";
    public static final String SESSION_FACTORY = "liferaySessionFactory";
    public static final String TX_MANAGER = "liferayTransactionManager";
    public static final boolean ENTITY_CACHE_ENABLED = GetterUtil.getBoolean(com.liferay.portal.util.PropsUtil.get(
                "value.object.entity.cache.enabled.pl.mamzdanie.threaddetail.svc.model.ThreadDetail"),
            true);
    public static final boolean FINDER_CACHE_ENABLED = GetterUtil.getBoolean(com.liferay.portal.util.PropsUtil.get(
                "value.object.finder.cache.enabled.pl.mamzdanie.threaddetail.svc.model.ThreadDetail"),
            true);
    public static final long LOCK_EXPIRATION_TIME = GetterUtil.getLong(com.liferay.portal.util.PropsUtil.get(
                "lock.expiration.time.pl.mamzdanie.threaddetail.svc.model.ThreadDetail"));
    private long _rootMessageId;
    private String _username;
    private String _subject;
    private Date _dateFrom;
    private Date _dateTo;
    private String _signature;
    private long _quantity;
    private int _active;
    private boolean _accepted;
    private Long _summaryId;
    private long _userId;
    private Long _organizationId;
    private String _organizationName;
    private Long _threadId;
    private transient ExpandoBridge _expandoBridge;

    public ThreadDetailModelImpl() {
    }

    public static ThreadDetail toModel(ThreadDetailSoap soapModel) {
        ThreadDetail model = new ThreadDetailImpl();

        model.setRootMessageId(soapModel.getRootMessageId());
        model.setUsername(soapModel.getUsername());
        model.setSubject(soapModel.getSubject());
        model.setDateFrom(soapModel.getDateFrom());
        model.setDateTo(soapModel.getDateTo());
        model.setSignature(soapModel.getSignature());
        model.setQuantity(soapModel.getQuantity());
        model.setActive(soapModel.getActive());
        model.setAccepted(soapModel.getAccepted());
        model.setSummaryId(soapModel.getSummaryId());
        model.setUserId(soapModel.getUserId());
        model.setOrganizationId(soapModel.getOrganizationId());
        model.setOrganizationName(soapModel.getOrganizationName());
        model.setThreadId(soapModel.getThreadId());

        return model;
    }

    public static List<ThreadDetail> toModels(ThreadDetailSoap[] soapModels) {
        List<ThreadDetail> models = new ArrayList<ThreadDetail>(soapModels.length);

        for (ThreadDetailSoap soapModel : soapModels) {
            models.add(toModel(soapModel));
        }

        return models;
    }

    public long getPrimaryKey() {
        return _rootMessageId;
    }

    public void setPrimaryKey(long pk) {
        setRootMessageId(pk);
    }

    public Serializable getPrimaryKeyObj() {
        return new Long(_rootMessageId);
    }

    public long getRootMessageId() {
        return _rootMessageId;
    }

    public void setRootMessageId(long rootMessageId) {
        _rootMessageId = rootMessageId;
    }

    public String getUsername() {
        return GetterUtil.getString(_username);
    }

    public void setUsername(String username) {
        _username = username;
    }

    public String getSubject() {
        return GetterUtil.getString(_subject);
    }

    public void setSubject(String subject) {
        _subject = subject;
    }

    public Date getDateFrom() {
        return _dateFrom;
    }

    public void setDateFrom(Date dateFrom) {
        _dateFrom = dateFrom;
    }

    public Date getDateTo() {
        return _dateTo;
    }

    public void setDateTo(Date dateTo) {
        _dateTo = dateTo;
    }

    public String getSignature() {
        return GetterUtil.getString(_signature);
    }

    public void setSignature(String signature) {
        _signature = signature;
    }

    public long getQuantity() {
        return _quantity;
    }

    public void setQuantity(long quantity) {
        _quantity = quantity;
    }

    public int getActive() {
        return _active;
    }

    public void setActive(int active) {
        _active = active;
    }

    public boolean getAccepted() {
        return _accepted;
    }

    public boolean isAccepted() {
        return _accepted;
    }

    public void setAccepted(boolean accepted) {
        _accepted = accepted;
    }

    public Long getSummaryId() {
        return _summaryId;
    }

    public void setSummaryId(Long summaryId) {
        _summaryId = summaryId;
    }

    public long getUserId() {
        return _userId;
    }

    public void setUserId(long userId) {
        _userId = userId;
    }

    public Long getOrganizationId() {
        return _organizationId;
    }

    public void setOrganizationId(Long organizationId) {
        _organizationId = organizationId;
    }

    public String getOrganizationName() {
        return GetterUtil.getString(_organizationName);
    }

    public void setOrganizationName(String organizationName) {
        _organizationName = organizationName;
    }

    public Long getThreadId() {
        return _threadId;
    }

    public void setThreadId(Long threadId) {
        _threadId = threadId;
    }

    public ThreadDetail toEscapedModel() {
        if (isEscapedModel()) {
            return (ThreadDetail) this;
        } else {
            ThreadDetail model = new ThreadDetailImpl();

            model.setNew(isNew());
            model.setEscapedModel(true);

            model.setRootMessageId(getRootMessageId());
            model.setUsername(HtmlUtil.escape(getUsername()));
            model.setSubject(HtmlUtil.escape(getSubject()));
            model.setDateFrom(getDateFrom());
            model.setDateTo(getDateTo());
            model.setSignature(HtmlUtil.escape(getSignature()));
            model.setQuantity(getQuantity());
            model.setActive(getActive());
            model.setAccepted(getAccepted());
            model.setSummaryId(getSummaryId());
            model.setUserId(getUserId());
            model.setOrganizationId(getOrganizationId());
            model.setOrganizationName(HtmlUtil.escape(getOrganizationName()));
            model.setThreadId(getThreadId());

            model = (ThreadDetail) Proxy.newProxyInstance(ThreadDetail.class.getClassLoader(),
                    new Class[] { ThreadDetail.class },
                    new ReadOnlyBeanHandler(model));

            return model;
        }
    }

    public ExpandoBridge getExpandoBridge() {
        if (_expandoBridge == null) {
            _expandoBridge = new ExpandoBridgeImpl(ThreadDetail.class.getName(),
                    getPrimaryKey());
        }

        return _expandoBridge;
    }

    public Object clone() {
        ThreadDetailImpl clone = new ThreadDetailImpl();

        clone.setRootMessageId(getRootMessageId());
        clone.setUsername(getUsername());
        clone.setSubject(getSubject());
        clone.setDateFrom(getDateFrom());
        clone.setDateTo(getDateTo());
        clone.setSignature(getSignature());
        clone.setQuantity(getQuantity());
        clone.setActive(getActive());
        clone.setAccepted(getAccepted());
        clone.setSummaryId(getSummaryId());
        clone.setUserId(getUserId());
        clone.setOrganizationId(getOrganizationId());
        clone.setOrganizationName(getOrganizationName());
        clone.setThreadId(getThreadId());

        return clone;
    }

    public int compareTo(ThreadDetail threadDetail) {
        long pk = threadDetail.getPrimaryKey();

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

        ThreadDetail threadDetail = null;

        try {
            threadDetail = (ThreadDetail) obj;
        } catch (ClassCastException cce) {
            return false;
        }

        long pk = threadDetail.getPrimaryKey();

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

        sb.append("{rootMessageId=");
        sb.append(getRootMessageId());
        sb.append(", username=");
        sb.append(getUsername());
        sb.append(", subject=");
        sb.append(getSubject());
        sb.append(", dateFrom=");
        sb.append(getDateFrom());
        sb.append(", dateTo=");
        sb.append(getDateTo());
        sb.append(", signature=");
        sb.append(getSignature());
        sb.append(", quantity=");
        sb.append(getQuantity());
        sb.append(", active=");
        sb.append(getActive());
        sb.append(", accepted=");
        sb.append(getAccepted());
        sb.append(", summaryId=");
        sb.append(getSummaryId());
        sb.append(", userId=");
        sb.append(getUserId());
        sb.append(", organizationId=");
        sb.append(getOrganizationId());
        sb.append(", organizationName=");
        sb.append(getOrganizationName());
        sb.append(", threadId=");
        sb.append(getThreadId());
        sb.append("}");

        return sb.toString();
    }

    public String toXmlString() {
        StringBuilder sb = new StringBuilder();

        sb.append("<model><model-name>");
        sb.append("pl.mamzdanie.threaddetail.svc.model.ThreadDetail");
        sb.append("</model-name>");

        sb.append(
            "<column><column-name>rootMessageId</column-name><column-value><![CDATA[");
        sb.append(getRootMessageId());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>username</column-name><column-value><![CDATA[");
        sb.append(getUsername());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>subject</column-name><column-value><![CDATA[");
        sb.append(getSubject());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>dateFrom</column-name><column-value><![CDATA[");
        sb.append(getDateFrom());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>dateTo</column-name><column-value><![CDATA[");
        sb.append(getDateTo());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>signature</column-name><column-value><![CDATA[");
        sb.append(getSignature());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>quantity</column-name><column-value><![CDATA[");
        sb.append(getQuantity());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>active</column-name><column-value><![CDATA[");
        sb.append(getActive());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>accepted</column-name><column-value><![CDATA[");
        sb.append(getAccepted());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>summaryId</column-name><column-value><![CDATA[");
        sb.append(getSummaryId());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>userId</column-name><column-value><![CDATA[");
        sb.append(getUserId());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>organizationId</column-name><column-value><![CDATA[");
        sb.append(getOrganizationId());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>organizationName</column-name><column-value><![CDATA[");
        sb.append(getOrganizationName());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>threadId</column-name><column-value><![CDATA[");
        sb.append(getThreadId());
        sb.append("]]></column-value></column>");

        sb.append("</model>");

        return sb.toString();
    }
}
