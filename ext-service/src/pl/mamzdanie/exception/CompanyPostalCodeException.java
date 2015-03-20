package pl.mamzdanie.exception;

import com.liferay.portal.PortalException;

public class CompanyPostalCodeException extends PortalException {

	public CompanyPostalCodeException() {
		super();
	}

	public CompanyPostalCodeException(String msg) {
		super(msg);
	}

	public CompanyPostalCodeException(String msg, Throwable cause) {
		super(msg, cause);
	}

	public CompanyPostalCodeException(Throwable cause) {
		super(cause);
	}

}
