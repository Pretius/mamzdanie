package pl.mamzdanie.userorganization.svc.model;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.List;


/**
 * <a href="UserOrganizationSoap.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This class is used by
 * <code>pl.mamzdanie.userorganization.svc.service.http.UserOrganizationServiceSoap</code>.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.userorganization.svc.service.http.UserOrganizationServiceSoap
 *
 */
public class UserOrganizationSoap implements Serializable {
    private long _id;
    private String _name;
    private String _address;
    private String _postalCode;
    private String _city;
    private String _phone;
    private String _fax;
    private String _email;

    public UserOrganizationSoap() {
    }

    public static UserOrganizationSoap toSoapModel(UserOrganization model) {
        UserOrganizationSoap soapModel = new UserOrganizationSoap();

        soapModel.setId(model.getId());
        soapModel.setName(model.getName());
        soapModel.setAddress(model.getAddress());
        soapModel.setPostalCode(model.getPostalCode());
        soapModel.setCity(model.getCity());
        soapModel.setPhone(model.getPhone());
        soapModel.setFax(model.getFax());
        soapModel.setEmail(model.getEmail());

        return soapModel;
    }

    public static UserOrganizationSoap[] toSoapModels(UserOrganization[] models) {
        UserOrganizationSoap[] soapModels = new UserOrganizationSoap[models.length];

        for (int i = 0; i < models.length; i++) {
            soapModels[i] = toSoapModel(models[i]);
        }

        return soapModels;
    }

    public static UserOrganizationSoap[][] toSoapModels(
        UserOrganization[][] models) {
        UserOrganizationSoap[][] soapModels = null;

        if (models.length > 0) {
            soapModels = new UserOrganizationSoap[models.length][models[0].length];
        } else {
            soapModels = new UserOrganizationSoap[0][0];
        }

        for (int i = 0; i < models.length; i++) {
            soapModels[i] = toSoapModels(models[i]);
        }

        return soapModels;
    }

    public static UserOrganizationSoap[] toSoapModels(
        List<UserOrganization> models) {
        List<UserOrganizationSoap> soapModels = new ArrayList<UserOrganizationSoap>(models.size());

        for (UserOrganization model : models) {
            soapModels.add(toSoapModel(model));
        }

        return soapModels.toArray(new UserOrganizationSoap[soapModels.size()]);
    }

    public long getPrimaryKey() {
        return _id;
    }

    public void setPrimaryKey(long pk) {
        setId(pk);
    }

    public long getId() {
        return _id;
    }

    public void setId(long id) {
        _id = id;
    }

    public String getName() {
        return _name;
    }

    public void setName(String name) {
        _name = name;
    }

    public String getAddress() {
        return _address;
    }

    public void setAddress(String address) {
        _address = address;
    }

    public String getPostalCode() {
        return _postalCode;
    }

    public void setPostalCode(String postalCode) {
        _postalCode = postalCode;
    }

    public String getCity() {
        return _city;
    }

    public void setCity(String city) {
        _city = city;
    }

    public String getPhone() {
        return _phone;
    }

    public void setPhone(String phone) {
        _phone = phone;
    }

    public String getFax() {
        return _fax;
    }

    public void setFax(String fax) {
        _fax = fax;
    }

    public String getEmail() {
        return _email;
    }

    public void setEmail(String email) {
        _email = email;
    }
}
