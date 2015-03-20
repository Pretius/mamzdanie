package pl.mamzdanie.mbmessageaddon.svc;

public enum MBMessageStatusType {
	NEW_MESSAGE("NEW_MESSAGE"),
	
	APPROVED_MESSAGE("APPROVED_MESSAGE"),
	REJECTED_MESSAGE("REJECTED_MESSAGE"),	
	
	ARCHIVED_MESSAGE("ARCHIVED_MESSAGE"),;
	
	private String name;
	
	MBMessageStatusType(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	public String toString() {
		return name;
	}
}
