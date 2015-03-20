package pl.mamzdanie.api.wrapper;

import java.util.Date;
import java.util.List;

import pl.mamzdanie.api.Attachments;

public class ThreadWrapper {
	private Long id;
	private String signature;
	private String subject;
	private Date dateFrom;
	private Date dateTo;
	private String userName;
	private Long userId;
	private Long replies;
	private String url;
	private Boolean active;
	private Long organizationId;
	private String organizationName;
	private String description;
	private String[] tags;
	private String mainAttachment;
	private Attachments attachments;
	private String discussionArea;
	private String territoryScope;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Date getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(Date dateFrom) {
		this.dateFrom = dateFrom;
	}

	public Date getDateTo() {
		return dateTo;
	}

	public void setDateTo(Date dateTo) {
		this.dateTo = dateTo;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getReplies() {
		return replies;
	}

	public void setReplies(Long replies) {
		this.replies = replies;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public Long getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(Long organizationId) {
		this.organizationId = organizationId;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String[] getTags() {
		return tags;
	}

	public void setTags(String[] tags) {
		this.tags = tags;
	}

	public String getDiscussionArea() {
		return discussionArea;
	}

	public void setDiscussionArea(String discussionArea) {
		this.discussionArea = discussionArea;
	}

	public String getTerritoryScope() {
		return territoryScope;
	}

	public void setTerritoryScope(String territoryScope) {
		this.territoryScope = territoryScope;
	}

	public String getMainAttachment() {
		return mainAttachment;
	}

	public void setMainAttachment(String mainAttachment) {
		this.mainAttachment = mainAttachment;
	}

	public void setAttachments(Attachments attachments) {
		this.attachments = attachments;
	}
}
