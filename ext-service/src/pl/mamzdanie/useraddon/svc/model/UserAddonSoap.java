package pl.mamzdanie.useraddon.svc.model;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.List;


/**
 * <a href="UserAddonSoap.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This class is used by
 * <code>pl.mamzdanie.useraddon.svc.service.http.UserAddonServiceSoap</code>.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.useraddon.svc.service.http.UserAddonServiceSoap
 *
 */
public class UserAddonSoap implements Serializable {
    private long _userId;
    private String _phone;
    private String _position;
    private Long _organizationId;
    private Boolean _notify;
    private String _apiKey;
    private String _description;

    public UserAddonSoap() {
    }

    public static UserAddonSoap toSoapModel(UserAddon model) {
        UserAddonSoap soapModel = new UserAddonSoap();

        soapModel.setUserId(model.getUserId());
        soapModel.setPhone(model.getPhone());
        soapModel.setPosition(model.getPosition());
        soapModel.setOrganizationId(model.getOrganizationId());
        soapModel.setNotify(model.getNotify());
        soapModel.setApiKey(model.getApiKey());
        soapModel.setDescription(model.getDescription());

        return soapModel;
    }

    public static UserAddonSoap[] toSoapModels(UserAddon[] models) {
        UserAddonSoap[] soapModels = new UserAddonSoap[models.length];

        for (int i = 0; i < models.length; i++) {
            soapModels[i] = toSoapModel(models[i]);
        }

        return soapModels;
    }

    public static UserAddonSoap[][] toSoapModels(UserAddon[][] models) {
        UserAddonSoap[][] soapModels = null;

        if (models.length > 0) {
            soapModels = new UserAddonSoap[models.length][models[0].length];
        } else {
            soapModels = new UserAddonSoap[0][0];
        }

        for (int i = 0; i < models.length; i++) {
            soapModels[i] = toSoapModels(models[i]);
        }

        return soapModels;
    }

    public static UserAddonSoap[] toSoapModels(List<UserAddon> models) {
        List<UserAddonSoap> soapModels = new ArrayList<UserAddonSoap>(models.size());

        for (UserAddon model : models) {
            soapModels.add(toSoapModel(model));
        }

        return soapModels.toArray(new UserAddonSoap[soapModels.size()]);
    }

    public long getPrimaryKey() {
        return _userId;
    }

    public void setPrimaryKey(long pk) {
        setUserId(pk);
    }

    public long getUserId() {
        return _userId;
    }

    public void setUserId(long userId) {
        _userId = userId;
    }

    public String getPhone() {
        return _phone;
    }

    public void setPhone(String phone) {
        _phone = phone;
    }

    public String getPosition() {
        return _position;
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
        return _apiKey;
    }

    public void setApiKey(String apiKey) {
        _apiKey = apiKey;
    }

    public String getDescription() {
        return _description;
    }

    public void setDescription(String description) {
        _description = description;
    }
}
