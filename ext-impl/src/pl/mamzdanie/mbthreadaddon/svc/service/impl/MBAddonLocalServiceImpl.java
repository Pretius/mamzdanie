package pl.mamzdanie.mbthreadaddon.svc.service.impl;

import java.util.Date;
import java.util.List;

import javax.resource.spi.IllegalStateException;

import pl.mamzdanie.mbthreadaddon.svc.service.base.MBAddonLocalServiceBaseImpl;

import com.liferay.counter.service.CounterLocalService;
import com.liferay.documentlibrary.DuplicateFileException;
import com.liferay.documentlibrary.NoSuchDirectoryException;
import com.liferay.documentlibrary.service.DLService;
import com.liferay.portal.PortalException;
import com.liferay.portal.SystemException;
import com.liferay.portal.kernel.annotation.BeanReference;
import com.liferay.portal.kernel.search.SearchException;
import com.liferay.portal.kernel.util.ObjectValuePair;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.model.CompanyConstants;
import com.liferay.portal.model.GroupConstants;
import com.liferay.portal.model.ModelHintsUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portlet.expando.model.ExpandoBridge;
import com.liferay.portlet.messageboards.MessageBodyException;
import com.liferay.portlet.messageboards.MessageSubjectException;
import com.liferay.portlet.messageboards.model.MBCategory;
import com.liferay.portlet.messageboards.model.MBMessage;
import com.liferay.portlet.messageboards.model.MBThread;
import com.liferay.portlet.messageboards.service.persistence.MBCategoryPersistence;
import com.liferay.portlet.messageboards.service.persistence.MBMessagePersistence;
import com.liferay.portlet.messageboards.service.persistence.MBThreadPersistence;
import com.liferay.portlet.messageboards.util.Indexer;

public class MBAddonLocalServiceImpl extends MBAddonLocalServiceBaseImpl {

	@BeanReference(name = "com.liferay.portlet.messageboards.service.persistence.MBThreadPersistence.impl")
	protected MBThreadPersistence mbThreadPersistence;
	@BeanReference(name = "com.liferay.portlet.messageboards.service.persistence.MBCategoryPersistence.impl")
	protected MBCategoryPersistence mbCategoryPersistence;
	@BeanReference(name = "com.liferay.counter.service.CounterLocalService.impl")
	protected CounterLocalService counterLocalService;
	@BeanReference(name = "com.liferay.portlet.messageboards.service.persistence.MBMessagePersistence.impl")
	protected MBMessagePersistence mbMessagePersistence;
	@BeanReference(name = "com.liferay.documentlibrary.service.DLService.impl")
	protected DLService dlService;

	public MBMessage addMailMessage(String eMailAddress, long categoryId, long parentMessageId, String body,
			List<ObjectValuePair<String, byte[]>> files) throws PortalException, SystemException {

		// Message
		User user = UserLocalServiceUtil.getUserByEmailAddress(10113, eMailAddress);
		if (user == null)
			throw new PortalException("User with e-mail : " + eMailAddress + " not found.");
		String userName = user.getFullName();

		// Thread
		MBMessage parentMessage = mbMessagePersistence.fetchByPrimaryKey(parentMessageId);
		if (parentMessage == null)
			throw new PortalException("Message with id: " + parentMessageId + " not found.");
		MBThread thread = mbThreadPersistence.fetchByPrimaryKey(parentMessage.getThreadId());

		MBCategory category = mbCategoryPersistence.findByPrimaryKey(categoryId);
		String subject = parentMessage.getSubject();

		Date now = new Date();

		long messageId = counterLocalService.increment();
		MBMessage message = mbMessagePersistence.create(messageId);

		message.setUuid(null);
		message.setGroupId(category.getGroupId());
		message.setCompanyId(user.getCompanyId());
		message.setUserId(user.getUserId());
		message.setUserName(userName);
		message.setCreateDate(now);
		message.setModifiedDate(now);

		thread.setMessageCount(thread.getMessageCount() + 1);

		thread.setLastPostByUserId(user.getUserId());
		thread.setLastPostDate(now);

		// Message
		message.setCategoryId(categoryId);
		message.setThreadId(thread.getThreadId());
		message.setParentMessageId(parentMessageId);
		message.setSubject(subject);
		message.setBody(body);
		message.setAttachments(!files.isEmpty());
		message.setAnonymous(false);

		if (files.size() > 0) {
			long companyId = message.getCompanyId();
			String portletId = CompanyConstants.SYSTEM_STRING;
			long groupId = GroupConstants.DEFAULT_PARENT_GROUP_ID;
			long repositoryId = CompanyConstants.SYSTEM;
			String dirName = message.getAttachmentsDir();

			try {
				dlService.deleteDirectory(companyId, portletId, repositoryId, dirName);
			} catch (NoSuchDirectoryException nsde) {
				// ignore exception
			}

			dlService.addDirectory(companyId, repositoryId, dirName);

			for (int i = 0; i < files.size(); i++) {
				ObjectValuePair<String, byte[]> ovp = files.get(i);

				String fileName = ovp.getKey();
				byte[] bytes = ovp.getValue();

				try {
					dlService.addFile(companyId, portletId, groupId, repositoryId, dirName + "/" + fileName,
							0, StringPool.BLANK, message.getModifiedDate(), new String[0], new String[0],
							bytes);
				} catch (DuplicateFileException dfe) {
					throw new SystemException("Duplicate file.", dfe);
				}
			}
		}

		// Commit
		mbThreadPersistence.update(thread, false);
		mbMessagePersistence.update(message, false);

		// Statistics
		// if (!category.isDiscussion()) {
		// mbStatsUserLocalService.updateStatsUser(message.getGroupId(), userId,
		// now);
		// }

		// Category
		category.setMessageCount(category.getMessageCount() + 1);
		category.setLastPostDate(now);

		mbCategoryPersistence.update(category, false);

		// Indexer

		reIndex(message);

		return message;
	}

	protected void validate(String subject, String body) throws PortalException {

		if (Validator.isNull(subject)) {
			throw new MessageSubjectException();
		}

		if (Validator.isNull(body)) {
			throw new MessageBodyException();
		}
	}

	public void reIndex(MBMessage message) throws SystemException {
		if (message.isDiscussion()) {
			return;
		}

		long companyId = message.getCompanyId();
		long groupId = message.getGroupId();
		long userId = message.getUserId();
		String userName = message.getUserName();
		long categoryId = message.getCategoryId();
		long threadId = message.getThreadId();
		long messageId = message.getMessageId();
		String title = message.getSubject();
		String content = message.getBody();
		boolean anonymous = message.isAnonymous();
		Date modifiedDate = message.getModifiedDate();

		String[] tagsEntries = new String[] {};

		ExpandoBridge expandoBridge = message.getExpandoBridge();

		try {
			Indexer.updateMessage(companyId, groupId, userId, userName, categoryId, threadId, messageId,
					title, content, anonymous, modifiedDate, tagsEntries, expandoBridge);
		} catch (SearchException se) {
			se.printStackTrace();
		}
	}
}
