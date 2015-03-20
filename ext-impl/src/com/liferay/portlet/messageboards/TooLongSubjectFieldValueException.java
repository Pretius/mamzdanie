package com.liferay.portlet.messageboards;

public class TooLongSubjectFieldValueException extends MessageValidationException {

	public TooLongSubjectFieldValueException() {
		super();
	}

	public TooLongSubjectFieldValueException(String msg) {
		super(msg);
	}

	public TooLongSubjectFieldValueException(String msg, Throwable cause) {
		super(msg, cause);
	}

	public TooLongSubjectFieldValueException(Throwable cause) {
		super(cause);
	}

}