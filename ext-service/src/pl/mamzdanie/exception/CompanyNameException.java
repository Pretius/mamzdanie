package pl.mamzdanie.exception;

import com.liferay.portal.PortalException;

public class CompanyNameException extends PortalException {

	public CompanyNameException() {
		super();
	}

	public CompanyNameException(String msg) {
		super(msg);
	}

	public CompanyNameException(String msg, Throwable cause) {
		super(msg, cause);
	}

	public CompanyNameException(Throwable cause) {
		super(cause);
	}

}
