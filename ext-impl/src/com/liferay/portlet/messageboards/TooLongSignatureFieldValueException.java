package com.liferay.portlet.messageboards;

public class TooLongSignatureFieldValueException extends MessageValidationException {

	public TooLongSignatureFieldValueException() {
		super();
	}

	public TooLongSignatureFieldValueException(String msg) {
		super(msg);
	}

	public TooLongSignatureFieldValueException(String msg, Throwable cause) {
		super(msg, cause);
	}

	public TooLongSignatureFieldValueException(Throwable cause) {
		super(cause);
	}

}