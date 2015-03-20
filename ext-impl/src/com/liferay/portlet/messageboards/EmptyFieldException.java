package com.liferay.portlet.messageboards;

import com.liferay.portal.PortalException;

public class EmptyFieldException extends PortalException {

	public EmptyFieldException() {
		super();
	}

	public EmptyFieldException(String msg) {
		super(msg);
	}

	public EmptyFieldException(String msg, Throwable cause) {
		super(msg, cause);
	}

	public EmptyFieldException(Throwable cause) {
		super(cause);
	}

}