package pl.mamzdanie.exception;

import com.liferay.portal.PortalException;

public class NotAcceptRulesException extends PortalException {

	public NotAcceptRulesException() {
		super();
	}

	public NotAcceptRulesException(String msg) {
		super(msg);
	}

	public NotAcceptRulesException(String msg, Throwable cause) {
		super(msg, cause);
	}

	public NotAcceptRulesException(Throwable cause) {
		super(cause);
	}

}
