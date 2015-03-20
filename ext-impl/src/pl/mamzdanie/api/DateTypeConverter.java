package pl.mamzdanie.api;

import java.text.ParseException;
import java.util.Date;

import com.liferay.ibm.icu.text.SimpleDateFormat;
import com.thoughtworks.xstream.converters.Converter;
import com.thoughtworks.xstream.converters.MarshallingContext;
import com.thoughtworks.xstream.converters.UnmarshallingContext;
import com.thoughtworks.xstream.io.HierarchicalStreamReader;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;

public class DateTypeConverter implements Converter {

	private String pattern;

	public DateTypeConverter(String pattern) {
		this.pattern = pattern;
	}

	public boolean canConvert(Class type) {
		return Date.class.isAssignableFrom(type);
	}

	public void marshal(Object value, HierarchicalStreamWriter writer, MarshallingContext context) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		writer.setValue(sdf.format(value));
	}

	public Object unmarshal(HierarchicalStreamReader reader, UnmarshallingContext context) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		try {
			return sdf.parse(reader.getValue());
		} catch (ParseException e) {
		}
		return null;
	}
}
