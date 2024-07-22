package com.bannershallmark.vo;

import java.util.Date;

public class AttendanceModelAjax {

	Integer id;
	String date;
	String clockIn;
	String clockOut;
	String totalHour;
	String employeeName;
	
	public AttendanceModelAjax() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AttendanceModelAjax(String date, String clockIn, String clockOut, String totalHour, String employeeName) {
		super();
		this.date = date;
		this.clockIn = clockIn;
		this.clockOut = clockOut;
		this.totalHour = totalHour;
		this.employeeName = employeeName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getClockIn() {
		return clockIn;
	}

	public void setClockIn(String clockIn) {
		this.clockIn = clockIn;
	}

	public String getClockOut() {
		return clockOut;
	}

	public void setClockOut(String clockOut) {
		this.clockOut = clockOut;
	}

	public String getTotalHour() {
		return totalHour;
	}

	public void setTotalHour(String totalHour) {
		this.totalHour = totalHour;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	

	
}
