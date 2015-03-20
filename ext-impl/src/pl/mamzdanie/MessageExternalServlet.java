package pl.mamzdanie;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.liferay.portal.kernel.util.ObjectValuePair;
import com.liferay.portal.security.auth.PrincipalException;
import com.liferay.portlet.messageboards.model.MBMessage;
import com.liferay.portlet.messageboards.service.MBMessageLocalServiceUtil;

import pl.mamzdanie.mbthreadaddon.svc.service.MBAddonLocalServiceUtil;

public class MessageExternalServlet extends HttpServlet {
	private final Logger logger = Logger.getLogger(MessageExternalServlet.class);

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException,
			IOException {

		try {
			long categoryId = 10178;
			long messageId = Long.parseLong(req.getParameter("messageId"));
			String msgBody = req.getParameter("body");
			String eMailAddress = req.getParameter("email");
			String filePathsList = req.getParameter("files");

			List<ObjectValuePair<String, byte[]>> files = new ArrayList<ObjectValuePair<String, byte[]>>();
			if (filePathsList != null && filePathsList.length() > 0) {
				String[] filePaths = filePathsList.split(";");

				for (int i = 0; i < filePaths.length; i++) {

					File file = new File(filePaths[i]);

					byte[] fileData = getBytesFromFile(file);
					files.add(new ObjectValuePair<String, byte[]>(file.getName(), fileData));
				}
			}

			MBMessage message = MBMessageLocalServiceUtil.getMBMessage(messageId);
			if (!CommonUtils.isActiveThread(message.getParentMessageId()))
				throw new PrincipalException();

			MBAddonLocalServiceUtil.addMailMessage(eMailAddress, categoryId, messageId, msgBody, files);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			resp.getWriter().write(CommonUtils.getStackTraceAsString(e));
		}
	}

	public static byte[] getBytesFromFile(File file) throws IOException {
		InputStream is = new FileInputStream(file);

		long length = file.length();

		if (length > Integer.MAX_VALUE) {
			throw new IOException("File too big.");
		}

		byte[] bytes = new byte[(int) length];

		int offset = 0;
		int numRead = 0;
		while (offset < bytes.length && (numRead = is.read(bytes, offset, bytes.length - offset)) >= 0) {
			offset += numRead;
		}

		if (offset < bytes.length) {
			throw new IOException("Could not completely read file " + file.getName());
		}

		is.close();
		return bytes;
	}
}
