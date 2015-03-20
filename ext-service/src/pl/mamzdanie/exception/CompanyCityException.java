package pl.mamzdanie.exception;

import com.liferay.portal.PortalException;

public class CompanyCityException extends PortalException {

	public CompanyCityException() {
		super();
	}

	public CompanyCityException(String msg) {
		super(msg);
	}

	public CompanyCityException(String msg, Throwable cause) {
		super(msg, cause);
	}

	public CompanyCityException(Throwable cause) {
		super(cause);
	}

}
