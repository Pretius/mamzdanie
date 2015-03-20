package pl.mamzdanie.threaddetail.svc.model;

import com.liferay.portal.model.BaseModel;

import java.util.Date;


/**
 * <a href="ThreadDetailModel.java.html"><b><i>View Source</i></b></a>
 *
 * <p>
 * ServiceBuilder generated this class. Modifications in this class will be
 * overwritten the next time is generated.
 * </p>
 *
 * <p>
 * This interface is a model that represents the <code>ThreadDetail</code>
 * table in the database.
 * </p>
 *
 * @author Brian Wing Shun Chan
 *
 * @see pl.mamzdanie.threaddetail.svc.model.ThreadDetail
 * @see pl.mamzdanie.threaddetail.svc.model.impl.ThreadDetailImpl
 * @see pl.mamzdanie.threaddetail.svc.model.impl.ThreadDetailModelImpl
 *
 */
public interface ThreadDetailModel extends BaseModel<ThreadDetail> {
    public long getPrimaryKey();

    public void setPrimaryKey(long pk);

    public long getRootMessageId();

    public void setRootMessageId(long rootMessageId);

    public String getUsername();

    public void setUsername(String username);

    public String getSubject();

    public void setSubject(String subject);

    public Date getDateFrom();

    public void setDateFrom(Date dateFrom);

    public Date getDateTo();

    public void setDateTo(Date dateTo);

    public String getSignature();

    public void setSignature(String signature);

    public long getQuantity();

    public void setQuantity(long quantity);

    public int getActive();

    public void setActive(int active);

    public boolean getAccepted();

    public boolean isAccepted();

    public void setAccepted(boolean accepted);

    public Long getSummaryId();

    public void setSummaryId(Long summaryId);

    public long getUserId();

    public void setUserId(long userId);

    public Long getOrganizationId();

    public void setOrganizationId(Long organizationId);

    public String getOrganizationName();

    public void setOrganizationName(String organizationName);

    public Long getThreadId();

    public void setThreadId(Long threadId);

    public ThreadDetail toEscapedModel();
}
