package pl.mamzdanie.exception;

import com.liferay.portal.PortalException;

public class CompanyAddressException extends PortalException {

	public CompanyAddressException() {
		super();
	}

	public CompanyAddressException(String msg) {
		super(msg);
	}

	public CompanyAddressException(String msg, Throwable cause) {
		super(msg, cause);
	}

	public CompanyAddressException(Throwable cause) {
		super(cause);
	}

}
