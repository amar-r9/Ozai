package com.ozai.util;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CustomDatePropertyEditor extends PropertyEditorSupport {
	@Override
	public String getAsText() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		return dateFormat.format(this.getValue());
	}

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = dateFormat.parse(text);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		super.setValue(date);
	}

}
