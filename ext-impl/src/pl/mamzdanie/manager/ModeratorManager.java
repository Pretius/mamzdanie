package pl.mamzdanie.manager;

import pl.mamzdanie.mbmessageaddon.svc.model.MBMessageAddon;

import com.liferay.portlet.messageboards.model.MBMessage;


public interface ModeratorManager {
	
	void sendNewMessageNotyfication(MBMessage messageAddon) throws Exception;
	
	void sendRejectedMessageNotyfication(MBMessage message, MBMessageAddon messageAddon) throws Exception;
	
	void sendInactivatedMessageNotyfication(MBMessage message, MBMessageAddon messageAddon) throws Exception;
}
