package pl.mamzdanie.api.wrapper;

public class UserAddonWrapper {
	private Long userId;
	private String userName;
	private Long organizationId;
	private String organizationName;
	private String organizationPosition;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getOrganizationPosition() {
		return organizationPosition;
	}

	public void setOrganizationPosition(String organizationPosition) {
		this.organizationPosition = organizationPosition;
	}
}
