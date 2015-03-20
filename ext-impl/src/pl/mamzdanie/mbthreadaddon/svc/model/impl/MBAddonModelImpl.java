package pl.mamzdanie.mbthreadaddon.svc.model.impl;

import com.liferay.portal.kernel.bean.ReadOnlyBeanHandler;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.HtmlUtil;
import com.liferay.portal.model.impl.BaseModelImpl;

import com.liferay.portlet.expando.model.ExpandoBridge;
import com.liferay.portlet.expando.model.impl.ExpandoBridgeImpl;

import pl.mamzdanie.mbthreadaddon.svc.model.MBAddon;
import pl.mamzdanie.mbthreadaddon.svc.model.MBAddonSoap;

import java.io.Serializable;

import java.lang.reflect.Proxy;

import java.sql.Types;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * <a href="MBAddonModelImpl.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This class is a model that represents the <code>MBAddon</code> table
 * in the database.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.mbthreadaddon.svc.model.MBAddon
 * @see pl.mamzdanie.mbthreadaddon.svc.model.MBAddonModel
 * @see pl.mamzdanie.mbthreadaddon.svc.model.impl.MBAddonImpl
 *
 */
public class MBAddonModelImpl extends BaseModelImpl<MBAddon> {
    public static final String TABLE_NAME = "mz_mbthread_addon";
    public static final Object[][] TABLE_COLUMNS = {
            { "thread_id", new Integer(Types.BIGINT) },
            

            { "date_from", new Integer(Types.TIMESTAMP) },
            

            { "date_to", new Integer(Types.TIMESTAMP) },
            

            { "discussion_area", new Integer(Types.VARCHAR) },
            

            { "territory", new Integer(Types.VARCHAR) },
            

            { "signature", new Integer(Types.VARCHAR) },
            

            { "accepted", new Integer(Types.BOOLEAN) },
            

            { "summary_id", new Integer(Types.BIGINT) },
            

            { "main_attachment", new Integer(Types.VARCHAR) }
        };
    public static final String TABLE_SQL_CREATE = "create table mz_mbthread_addon (thread_id LONG not null primary key,date_from DATE null,date_to DATE null,discussion_area VARCHAR(75) null,territory VARCHAR(75) null,signature VARCHAR(75) null,accepted BOOLEAN,summary_id LONG,main_attachment VARCHAR(75) null)";
    public static final String TABLE_SQL_DROP = "drop table mz_mbthread_addon";
    public static final String DATA_SOURCE = "liferayDataSource";
    public static final String SESSION_FACTORY = "liferaySessionFactory";
    public static final String TX_MANAGER = "liferayTransactionManager";
    public static final boolean ENTITY_CACHE_ENABLED = GetterUtil.getBoolean(com.liferay.portal.util.PropsUtil.get(
                "value.object.entity.cache.enabled.pl.mamzdanie.mbthreadaddon.svc.model.MBAddon"),
            true);
    public static final boolean FINDER_CACHE_ENABLED = GetterUtil.getBoolean(com.liferay.portal.util.PropsUtil.get(
                "value.object.finder.cache.enabled.pl.mamzdanie.mbthreadaddon.svc.model.MBAddon"),
            true);
    public static final long LOCK_EXPIRATION_TIME = GetterUtil.getLong(com.liferay.portal.util.PropsUtil.get(
                "lock.expiration.time.pl.mamzdanie.mbthreadaddon.svc.model.MBAddon"));
    private long _threadId;
    private Date _dateFrom;
    private Date _dateTo;
    private String _discussionArea;
    private String _territory;
    private String _signature;
    private boolean _accepted;
    private Long _summaryId;
    private String _mainAttachment;
    private transient ExpandoBridge _expandoBridge;

    public MBAddonModelImpl() {
    }

    public static MBAddon toModel(MBAddonSoap soapModel) {
        MBAddon model = new MBAddonImpl();

        model.setThreadId(soapModel.getThreadId());
        model.setDateFrom(soapModel.getDateFrom());
        model.setDateTo(soapModel.getDateTo());
        model.setDiscussionArea(soapModel.getDiscussionArea());
        model.setTerritory(soapModel.getTerritory());
        model.setSignature(soapModel.getSignature());
        model.setAccepted(soapModel.getAccepted());
        model.setSummaryId(soapModel.getSummaryId());
        model.setMainAttachment(soapModel.getMainAttachment());

        return model;
    }

    public static List<MBAddon> toModels(MBAddonSoap[] soapModels) {
        List<MBAddon> models = new ArrayList<MBAddon>(soapModels.length);

        for (MBAddonSoap soapModel : soapModels) {
            models.add(toModel(soapModel));
        }

        return models;
    }

    public long getPrimaryKey() {
        return _threadId;
    }

    public void setPrimaryKey(long pk) {
        setThreadId(pk);
    }

    public Serializable getPrimaryKeyObj() {
        return new Long(_threadId);
    }

    public long getThreadId() {
        return _threadId;
    }

    public void setThreadId(long threadId) {
        _threadId = threadId;
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

    public String getDiscussionArea() {
        return GetterUtil.getString(_discussionArea);
    }

    public void setDiscussionArea(String discussionArea) {
        _discussionArea = discussionArea;
    }

    public String getTerritory() {
        return GetterUtil.getString(_territory);
    }

    public void setTerritory(String territory) {
        _territory = territory;
    }

    public String getSignature() {
        return GetterUtil.getString(_signature);
    }

    public void setSignature(String signature) {
        _signature = signature;
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

    public String getMainAttachment() {
        return GetterUtil.getString(_mainAttachment);
    }

    public void setMainAttachment(String mainAttachment) {
        _mainAttachment = mainAttachment;
    }

    public MBAddon toEscapedModel() {
        if (isEscapedModel()) {
            return (MBAddon) this;
        } else {
            MBAddon model = new MBAddonImpl();

            model.setNew(isNew());
            model.setEscapedModel(true);

            model.setThreadId(getThreadId());
            model.setDateFrom(getDateFrom());
            model.setDateTo(getDateTo());
            model.setDiscussionArea(HtmlUtil.escape(getDiscussionArea()));
            model.setTerritory(HtmlUtil.escape(getTerritory()));
            model.setSignature(HtmlUtil.escape(getSignature()));
            model.setAccepted(getAccepted());
            model.setSummaryId(getSummaryId());
            model.setMainAttachment(HtmlUtil.escape(getMainAttachment()));

            model = (MBAddon) Proxy.newProxyInstance(MBAddon.class.getClassLoader(),
                    new Class[] { MBAddon.class },
                    new ReadOnlyBeanHandler(model));

            return model;
        }
    }

    public ExpandoBridge getExpandoBridge() {
        if (_expandoBridge == null) {
            _expandoBridge = new ExpandoBridgeImpl(MBAddon.class.getName(),
                    getPrimaryKey());
        }

        return _expandoBridge;
    }

    public Object clone() {
        MBAddonImpl clone = new MBAddonImpl();

        clone.setThreadId(getThreadId());
        clone.setDateFrom(getDateFrom());
        clone.setDateTo(getDateTo());
        clone.setDiscussionArea(getDiscussionArea());
        clone.setTerritory(getTerritory());
        clone.setSignature(getSignature());
        clone.setAccepted(getAccepted());
        clone.setSummaryId(getSummaryId());
        clone.setMainAttachment(getMainAttachment());

        return clone;
    }

    public int compareTo(MBAddon mbAddon) {
        long pk = mbAddon.getPrimaryKey();

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

        MBAddon mbAddon = null;

        try {
            mbAddon = (MBAddon) obj;
        } catch (ClassCastException cce) {
            return false;
        }

        long pk = mbAddon.getPrimaryKey();

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

        sb.append("{threadId=");
        sb.append(getThreadId());
        sb.append(", dateFrom=");
        sb.append(getDateFrom());
        sb.append(", dateTo=");
        sb.append(getDateTo());
        sb.append(", discussionArea=");
        sb.append(getDiscussionArea());
        sb.append(", territory=");
        sb.append(getTerritory());
        sb.append(", signature=");
        sb.append(getSignature());
        sb.append(", accepted=");
        sb.append(getAccepted());
        sb.append(", summaryId=");
        sb.append(getSummaryId());
        sb.append(", mainAttachment=");
        sb.append(getMainAttachment());
        sb.append("}");

        return sb.toString();
    }

    public String toXmlString() {
        StringBuilder sb = new StringBuilder();

        sb.append("<model><model-name>");
        sb.append("pl.mamzdanie.mbthreadaddon.svc.model.MBAddon");
        sb.append("</model-name>");

        sb.append(
            "<column><column-name>threadId</column-name><column-value><![CDATA[");
        sb.append(getThreadId());
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
            "<column><column-name>discussionArea</column-name><column-value><![CDATA[");
        sb.append(getDiscussionArea());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>territory</column-name><column-value><![CDATA[");
        sb.append(getTerritory());
        sb.append("]]></column-value></column>");
        sb.append(
            "<column><column-name>signature</column-name><column-value><![CDATA[");
        sb.append(getSignature());
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
            "<column><column-name>mainAttachment</column-name><column-value><![CDATA[");
        sb.append(getMainAttachment());
        sb.append("]]></column-value></column>");

        sb.append("</model>");

        return sb.toString();
    }
}
