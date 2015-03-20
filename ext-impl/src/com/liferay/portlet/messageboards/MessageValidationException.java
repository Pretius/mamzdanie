package com.liferay.portlet.messageboards;

import com.liferay.portal.PortalException;

public class MessageValidationException extends PortalException {

	public MessageValidationException() {
		super();
	}

	public MessageValidationException(String msg) {
		super(msg);
	}

	public MessageValidationException(String msg, Throwable cause) {
		super(msg, cause);
	}

	public MessageValidationException(Throwable cause) {
		super(cause);
	}

}