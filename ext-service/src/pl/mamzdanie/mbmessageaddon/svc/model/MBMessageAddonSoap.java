package pl.mamzdanie.mbmessageaddon.svc.model;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.List;


/**
 * <a href="MBMessageAddonSoap.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This class is used by
 * <code>pl.mamzdanie.mbmessageaddon.svc.service.http.MBMessageAddonServiceSoap</code>.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.mbmessageaddon.svc.service.http.MBMessageAddonServiceSoap
 *
 */
public class MBMessageAddonSoap implements Serializable {
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

    public MBMessageAddonSoap() {
    }

    public static MBMessageAddonSoap toSoapModel(MBMessageAddon model) {
        MBMessageAddonSoap soapModel = new MBMessageAddonSoap();

        soapModel.setMessageId(model.getMessageId());
        soapModel.setUserId(model.getUserId());
        soapModel.setIssuerId(model.getIssuerId());
        soapModel.setThreadId(model.getThreadId());
        soapModel.setLicenseType(model.getLicenseType());
        soapModel.setStatus(model.getStatus());
        soapModel.setComments(model.getComments());
        soapModel.setOldMessageId(model.getOldMessageId());
        soapModel.setActive(model.getActive());
        soapModel.setVisible(model.getVisible());

        return soapModel;
    }

    public static MBMessageAddonSoap[] toSoapModels(MBMessageAddon[] models) {
        MBMessageAddonSoap[] soapModels = new MBMessageAddonSoap[models.length];

        for (int i = 0; i < models.length; i++) {
            soapModels[i] = toSoapModel(models[i]);
        }

        return soapModels;
    }

    public static MBMessageAddonSoap[][] toSoapModels(MBMessageAddon[][] models) {
        MBMessageAddonSoap[][] soapModels = null;

        if (models.length > 0) {
            soapModels = new MBMessageAddonSoap[models.length][models[0].length];
        } else {
            soapModels = new MBMessageAddonSoap[0][0];
        }

        for (int i = 0; i < models.length; i++) {
            soapModels[i] = toSoapModels(models[i]);
        }

        return soapModels;
    }

    public static MBMessageAddonSoap[] toSoapModels(List<MBMessageAddon> models) {
        List<MBMessageAddonSoap> soapModels = new ArrayList<MBMessageAddonSoap>(models.size());

        for (MBMessageAddon model : models) {
            soapModels.add(toSoapModel(model));
        }

        return soapModels.toArray(new MBMessageAddonSoap[soapModels.size()]);
    }

    public Long getPrimaryKey() {
        return _messageId;
    }

    public void setPrimaryKey(Long pk) {
        setMessageId(pk);
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
        return _licenseType;
    }

    public void setLicenseType(String licenseType) {
        _licenseType = licenseType;
    }

    public String getStatus() {
        return _status;
    }

    public void setStatus(String status) {
        _status = status;
    }

    public String getComments() {
        return _comments;
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
}
