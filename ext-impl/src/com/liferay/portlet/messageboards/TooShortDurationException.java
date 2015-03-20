package com.liferay.portlet.messageboards;

public class TooShortDurationException extends MessageValidationException {

	public TooShortDurationException() {
		super();
	}

	public TooShortDurationException(String msg) {
		super(msg);
	}

	public TooShortDurationException(String msg, Throwable cause) {
		super(msg, cause);
	}

	public TooShortDurationException(Throwable cause) {
		super(cause);
	}

}