package pl.mamzdanie.exception;

import com.liferay.portal.PortalException;

public class PositionException extends PortalException {

	public PositionException() {
		super();
	}

	public PositionException(String msg) {
		super(msg);
	}

	public PositionException(String msg, Throwable cause) {
		super(msg, cause);
	}

	public PositionException(Throwable cause) {
		super(cause);
	}

}
