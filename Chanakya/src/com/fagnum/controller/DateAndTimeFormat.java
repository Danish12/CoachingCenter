package com.fagnum.controller;

import java.sql.Date;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DateAndTimeFormat {

	public static java.sql.Date sqlDate(String date) {
		DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = null;
		java.sql.Date sqlDate = null;
		try {
			utilDate = dateFormat.parse(date);
			date = dateFormat1.format(utilDate);
			sqlDate = java.sql.Date.valueOf(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return sqlDate;
	}
	
	public static java.sql.Time sqlTime(String time) {
		SimpleDateFormat tfFormat = new SimpleDateFormat("HH:mm:ss");
        SimpleDateFormat twFormat = new SimpleDateFormat("hh:mm a");
		java.sql.Time sqlTime = null;
		try {
			sqlTime = java.sql.Time.valueOf(tfFormat.format(twFormat.parse(time)));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return sqlTime;
	}
	
	public static String clientDate(Date sqlDate) {
		String date = sqlDate.toString();
		DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		String clientDate = null;
		try {
			clientDate = dateFormat.format(dateFormat1.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return clientDate;
	}
	
	public static String clientTime(Time sqlTime) {
		String time = sqlTime.toString();
		SimpleDateFormat tfFormat = new SimpleDateFormat("HH:mm:ss");
        SimpleDateFormat twFormat = new SimpleDateFormat("hh:mm a");
		String clientTime = null;
		try {
			clientTime = twFormat.format(tfFormat.parse(time));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return clientTime;
	}
	
}
