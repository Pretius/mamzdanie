package pl.mamzdanie.mbmessageaddon.svc.model;

import com.liferay.portal.model.BaseModel;


/**
 * <a href="MBMessageAddonModel.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This interface is a model that represents the <code>MBMessageAddon</code>
 * table in the database.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon
 * @see pl.mamzdanie.mbmessageaddon.svc.model.impl.MBMessageAddonImpl
 * @see pl.mamzdanie.mbmessageaddon.svc.model.impl.MBMessageAddonModelImpl
 *
 */
public interface MBMessageAddonModel extends BaseModel<MBMessageAddon> {
    public Long getPrimaryKey();

    public void setPrimaryKey(Long pk);

    public Long getMessageId();

    public void setMessageId(Long messageId);

    public Long getUserId();

    public void setUserId(Long userId);

    public Long getIssuerId();

    public void setIssuerId(Long issuerId);

    public Long getThreadId();

    public void setThreadId(Long threadId);

    public String getLicenseType();

    public void setLicenseType(String licenseType);

    public String getStatus();

    public void setStatus(String status);

    public String getComments();

    public void setComments(String comments);

    public Long getOldMessageId();

    public void setOldMessageId(Long oldMessageId);

    public Boolean getActive();

    public void setActive(Boolean active);

    public Boolean getVisible();

    public void setVisible(Boolean visible);

    public MBMessageAddon toEscapedModel();
}
