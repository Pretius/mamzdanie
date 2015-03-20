package pl.mamzdanie.mbthreadaddon.svc.model;

import com.liferay.portal.model.BaseModel;

import java.util.Date;


/**
 * <a href="MBAddonModel.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This interface is a model that represents the <code>MBAddon</code>
 * table in the database.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.mbthreadaddon.svc.model.MBAddon
 * @see pl.mamzdanie.mbthreadaddon.svc.model.impl.MBAddonImpl
 * @see pl.mamzdanie.mbthreadaddon.svc.model.impl.MBAddonModelImpl
 *
 */
public interface MBAddonModel extends BaseModel<MBAddon> {
    public long getPrimaryKey();

    public void setPrimaryKey(long pk);

    public long getThreadId();

    public void setThreadId(long threadId);

    public Date getDateFrom();

    public void setDateFrom(Date dateFrom);

    public Date getDateTo();

    public void setDateTo(Date dateTo);

    public String getDiscussionArea();

    public void setDiscussionArea(String discussionArea);

    public String getTerritory();

    public void setTerritory(String territory);

    public String getSignature();

    public void setSignature(String signature);

    public boolean getAccepted();

    public boolean isAccepted();

    public void setAccepted(boolean accepted);

    public Long getSummaryId();

    public void setSummaryId(Long summaryId);

    public String getMainAttachment();

    public void setMainAttachment(String mainAttachment);

    public MBAddon toEscapedModel();
}
