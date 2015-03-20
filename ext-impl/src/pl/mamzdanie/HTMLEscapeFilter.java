package pl.mamzdanie;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.lang.StringEscapeUtils;

public class HTMLEscapeFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
			ServletException {
		chain.doFilter(new RequestWrapper((HttpServletRequest) request), response);
	}

	public void destroy() {
	}

	public void init(FilterConfig arg0) throws ServletException {
	}

	private final class RequestWrapper extends HttpServletRequestWrapper {
		public RequestWrapper(HttpServletRequest servletRequest) {
			super(servletRequest);
		}

		public String[] getParameterValues(String parameter) {
			String[] values = super.getParameterValues(parameter);
			if (values == null) {
				return null;
			}
			int count = values.length;
			String[] encodedValues = new String[count];
			for (int i = 0; i < count; i++) {
				encodedValues[i] = cleanXSS(values[i]);
			}
			return encodedValues;
		}

		public String getParameter(String parameter) {
			String value = super.getParameter(parameter);
			if (value == null) {
				return null;
			}
			return cleanXSS(value);
		}

		public String getHeader(String name) {
			String value = super.getHeader(name);
			if (value == null)
				return null;
			return cleanXSS(value);
		}

		private String cleanXSS(String value) {
			value = value.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
			value = value.replaceAll("\"", "&quot;");
			value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
			return value;
		}
	}
}
