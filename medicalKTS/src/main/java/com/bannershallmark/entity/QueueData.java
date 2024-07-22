package com.bannershallmark.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "queueData")
public class QueueData {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@OneToOne
	@JoinColumn(name = "patientId")
	private PatientData patientData;
	private Date eventDate;
	private Date startDate;
	private String status;
	private String assignedBy;
	private String assignedTo;
	private Date endDate;
	private Integer doctorId;
	private Integer departementId;
	private String isPaid;
	private Integer instituteId;
	
	public QueueData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QueueData(PatientData patientData, Date eventDate, Date startDate, String status, String assignedBy,
			String assignedTo, Date endDate, Integer doctorId, Integer departementId, String isPaid,
			Integer instituteId) {
		super();
		this.patientData = patientData;
		this.eventDate = eventDate;
		this.startDate = startDate;
		this.status = status;
		this.assignedBy = assignedBy;
		this.assignedTo = assignedTo;
		this.endDate = endDate;
		this.doctorId = doctorId;
		this.departementId = departementId;
		this.isPaid = isPaid;
		this.instituteId = instituteId;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public PatientData getPatientData() {
		return patientData;
	}

	public void setPatientData(PatientData patientData) {
		this.patientData = patientData;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAssignedBy() {
		return assignedBy;
	}

	public void setAssignedBy(String assignedBy) {
		this.assignedBy = assignedBy;
	}

	public String getAssignedTo() {
		return assignedTo;
	}

	public void setAssignedTo(String assignedTo) {
		this.assignedTo = assignedTo;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Integer getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}

	public Integer getDepartementId() {
		return departementId;
	}

	public void setDepartementId(Integer departementId) {
		this.departementId = departementId;
	}

	public String getIsPaid() {
		return isPaid;
	}

	public void setIsPaid(String isPaid) {
		this.isPaid = isPaid;
	}

	public Integer getInstituteId() {
		return instituteId;
	}

	public void setInstituteId(Integer instituteId) {
		this.instituteId = instituteId;
	}

	
	
	
	
}
