package pl.mamzdanie.mbthreadaddon.svc.model;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * <a href="MBAddonSoap.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This class is used by
 * <code>pl.mamzdanie.mbthreadaddon.svc.service.http.MBAddonServiceSoap</code>.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.mbthreadaddon.svc.service.http.MBAddonServiceSoap
 *
 */
public class MBAddonSoap implements Serializable {
    private long _threadId;
    private Date _dateFrom;
    private Date _dateTo;
    private String _discussionArea;
    private String _territory;
    private String _signature;
    private boolean _accepted;
    private Long _summaryId;
    private String _mainAttachment;

    public MBAddonSoap() {
    }

    public static MBAddonSoap toSoapModel(MBAddon model) {
        MBAddonSoap soapModel = new MBAddonSoap();

        soapModel.setThreadId(model.getThreadId());
        soapModel.setDateFrom(model.getDateFrom());
        soapModel.setDateTo(model.getDateTo());
        soapModel.setDiscussionArea(model.getDiscussionArea());
        soapModel.setTerritory(model.getTerritory());
        soapModel.setSignature(model.getSignature());
        soapModel.setAccepted(model.getAccepted());
        soapModel.setSummaryId(model.getSummaryId());
        soapModel.setMainAttachment(model.getMainAttachment());

        return soapModel;
    }

    public static MBAddonSoap[] toSoapModels(MBAddon[] models) {
        MBAddonSoap[] soapModels = new MBAddonSoap[models.length];

        for (int i = 0; i < models.length; i++) {
            soapModels[i] = toSoapModel(models[i]);
        }

        return soapModels;
    }

    public static MBAddonSoap[][] toSoapModels(MBAddon[][] models) {
        MBAddonSoap[][] soapModels = null;

        if (models.length > 0) {
            soapModels = new MBAddonSoap[models.length][models[0].length];
        } else {
            soapModels = new MBAddonSoap[0][0];
        }

        for (int i = 0; i < models.length; i++) {
            soapModels[i] = toSoapModels(models[i]);
        }

        return soapModels;
    }

    public static MBAddonSoap[] toSoapModels(List<MBAddon> models) {
        List<MBAddonSoap> soapModels = new ArrayList<MBAddonSoap>(models.size());

        for (MBAddon model : models) {
            soapModels.add(toSoapModel(model));
        }

        return soapModels.toArray(new MBAddonSoap[soapModels.size()]);
    }

    public long getPrimaryKey() {
        return _threadId;
    }

    public void setPrimaryKey(long pk) {
        setThreadId(pk);
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
        return _discussionArea;
    }

    public void setDiscussionArea(String discussionArea) {
        _discussionArea = discussionArea;
    }

    public String getTerritory() {
        return _territory;
    }

    public void setTerritory(String territory) {
        _territory = territory;
    }

    public String getSignature() {
        return _signature;
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
        return _mainAttachment;
    }

    public void setMainAttachment(String mainAttachment) {
        _mainAttachment = mainAttachment;
    }
}
