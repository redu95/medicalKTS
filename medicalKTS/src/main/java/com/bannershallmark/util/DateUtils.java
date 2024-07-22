/**
 * 
 */
package com.bannershallmark.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author usharma
 *
 */
public class DateUtils {

	
	public static String convertIntoDDMMYYYY(Date date) {
		DateFormat sourceFormat = new SimpleDateFormat("dd-MM-yyyy");
		return sourceFormat.format(date);
	}
	
	public static String convertIntoMMDDYYYY(Date date) {
		DateFormat sourceFormat = new SimpleDateFormat("mm-dd-yyyy");
		return sourceFormat.format(date);
	}

	public static String showDateTime(Date date) {
		if(date == null) {
			return "";
		}
		DateFormat sourceFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		return sourceFormat.format(date);
	}

	public static String showFullDateTime(Date date) {
		if(date == null) {
			return "";
		}
		DateFormat sourceFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm a");
		return sourceFormat.format(date);
	}
	public static String showDate(Date date) {
		if(date == null) {
			return "";
		}
		DateFormat sourceFormat = new SimpleDateFormat("MM/dd/yyyy");
		return sourceFormat.format(date);
	}
}
