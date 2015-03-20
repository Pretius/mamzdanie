package pl.mamzdanie.threaddetail.svc.model;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * <a href="ThreadDetailSoap.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This class is used by
 * <code>pl.mamzdanie.threaddetail.svc.service.http.ThreadDetailServiceSoap</code>.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.threaddetail.svc.service.http.ThreadDetailServiceSoap
 *
 */
public class ThreadDetailSoap implements Serializable {
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

    public ThreadDetailSoap() {
    }

    public static ThreadDetailSoap toSoapModel(ThreadDetail model) {
        ThreadDetailSoap soapModel = new ThreadDetailSoap();

        soapModel.setRootMessageId(model.getRootMessageId());
        soapModel.setUsername(model.getUsername());
        soapModel.setSubject(model.getSubject());
        soapModel.setDateFrom(model.getDateFrom());
        soapModel.setDateTo(model.getDateTo());
        soapModel.setSignature(model.getSignature());
        soapModel.setQuantity(model.getQuantity());
        soapModel.setActive(model.getActive());
        soapModel.setAccepted(model.getAccepted());
        soapModel.setSummaryId(model.getSummaryId());
        soapModel.setUserId(model.getUserId());
        soapModel.setOrganizationId(model.getOrganizationId());
        soapModel.setOrganizationName(model.getOrganizationName());
        soapModel.setThreadId(model.getThreadId());

        return soapModel;
    }

    public static ThreadDetailSoap[] toSoapModels(ThreadDetail[] models) {
        ThreadDetailSoap[] soapModels = new ThreadDetailSoap[models.length];

        for (int i = 0; i < models.length; i++) {
            soapModels[i] = toSoapModel(models[i]);
        }

        return soapModels;
    }

    public static ThreadDetailSoap[][] toSoapModels(ThreadDetail[][] models) {
        ThreadDetailSoap[][] soapModels = null;

        if (models.length > 0) {
            soapModels = new ThreadDetailSoap[models.length][models[0].length];
        } else {
            soapModels = new ThreadDetailSoap[0][0];
        }

        for (int i = 0; i < models.length; i++) {
            soapModels[i] = toSoapModels(models[i]);
        }

        return soapModels;
    }

    public static ThreadDetailSoap[] toSoapModels(List<ThreadDetail> models) {
        List<ThreadDetailSoap> soapModels = new ArrayList<ThreadDetailSoap>(models.size());

        for (ThreadDetail model : models) {
            soapModels.add(toSoapModel(model));
        }

        return soapModels.toArray(new ThreadDetailSoap[soapModels.size()]);
    }

    public long getPrimaryKey() {
        return _rootMessageId;
    }

    public void setPrimaryKey(long pk) {
        setRootMessageId(pk);
    }

    public long getRootMessageId() {
        return _rootMessageId;
    }

    public void setRootMessageId(long rootMessageId) {
        _rootMessageId = rootMessageId;
    }

    public String getUsername() {
        return _username;
    }

    public void setUsername(String username) {
        _username = username;
    }

    public String getSubject() {
        return _subject;
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
        return _signature;
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
        return _organizationName;
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
}
