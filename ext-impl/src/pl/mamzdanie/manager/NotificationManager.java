package pl.mamzdanie.manager;

import com.liferay.portlet.messageboards.model.MBMessage;

public interface NotificationManager {

	void sendOnNewNotAcceptedThread(MBMessage message) throws Exception;
	
	void sendOnNewThread(MBMessage message) throws Exception;
}
