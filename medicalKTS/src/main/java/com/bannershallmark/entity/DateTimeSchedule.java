package com.bannershallmark.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "dateTimeSchedule")
public class DateTimeSchedule {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Date eventDate;
	private Date startDate;
	private Date endDate;
	private Integer isFreeSlot;
	private Integer isAssigned;
	private Integer doctorId;
	private String doctorName;
	
	public DateTimeSchedule() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DateTimeSchedule(Date eventDate, Date startDate, Date endDate, Integer isFreeSlot, Integer isAssigned,
			Integer doctorId, String doctorName) {
		super();
		this.eventDate = eventDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.isFreeSlot = isFreeSlot;
		this.isAssigned = isAssigned;
		this.doctorId = doctorId;
		this.doctorName = doctorName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getEventDate() {
		return eventDate;
	}

	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Integer getIsFreeSlot() {
		return isFreeSlot;
	}

	public void setIsFreeSlot(Integer isFreeSlot) {
		this.isFreeSlot = isFreeSlot;
	}

	public Integer getIsAssigned() {
		return isAssigned;
	}

	public void setIsAssigned(Integer isAssigned) {
		this.isAssigned = isAssigned;
	}

	public Integer getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	
	
	
	
	
}
