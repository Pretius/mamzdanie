package pl.mamzdanie.mbmessageaddon.svc;

import com.liferay.portal.PortalException;

public class NoSuchMBMessageAddonException extends PortalException {

	public NoSuchMBMessageAddonException() {
		super();
	}

	public NoSuchMBMessageAddonException(String msg) {
		super(msg);
	}

	public NoSuchMBMessageAddonException(String msg, Throwable cause) {
		super(msg, cause);
	}

	public NoSuchMBMessageAddonException(Throwable cause) {
		super(cause);
	}
}
