package com.bannershallmark.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "patientMedicalHistory")
public class PatientMedicalHistory {

	@Id
	@Column(name = "patientMedicalHistoryId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@OneToOne
	@JoinColumn(name = "patientId")
	private PatientData patientData;
	private Date eventDate;
	private Date eventStartDate;
	private String cheifCompliant;
	private String pastMedicalHistory;
	private Integer queueId;
	private String assignedBy;
	private String assignedTo;
	private String assignedToDepartment;
	private String presentStatus;
	private String treatement;
	private String prescription;
	private String extraNote;
	private Integer examinationCount;
	
	public PatientMedicalHistory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PatientMedicalHistory(PatientData patientData, Date eventDate, Date eventStartDate, String cheifCompliant,
			String pastMedicalHistory, Integer queueId,  String assignedBy,  String assignedTo, String assignedToDepartment, String presentStatus, String treatement, String prescription, String extraNote, Integer examinationCount) {
		super();
		this.patientData = patientData;
		this.eventDate = eventDate;
		this.eventStartDate = eventStartDate;
		this.cheifCompliant = cheifCompliant;
		this.pastMedicalHistory = pastMedicalHistory;
		this.queueId = queueId;
		this.assignedBy = assignedBy;
		this.assignedTo = assignedTo;
		this.assignedToDepartment = assignedToDepartment;
		this.presentStatus = presentStatus;
		this.treatement = treatement;
		this.prescription = prescription;
		this.extraNote = extraNote;
		this.examinationCount = examinationCount;
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

	public Date getEventStartDate() {
		return eventStartDate;
	}

	public void setEventStartDate(Date eventStartDate) {
		this.eventStartDate = eventStartDate;
	}

	public String getCheifCompliant() {
		return cheifCompliant;
	}

	public void setCheifCompliant(String cheifCompliant) {
		this.cheifCompliant = cheifCompliant;
	}

	public String getPastMedicalHistory() {
		return pastMedicalHistory;
	}

	public void setPastMedicalHistory(String pastMedicalHistory) {
		this.pastMedicalHistory = pastMedicalHistory;
	}

	public Integer getQueueId() {
		return queueId;
	}

	public void setQueueId(Integer queueId) {
		this.queueId = queueId;
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

	public String getAssignedToDepartment() {
		return assignedToDepartment;
	}

	public void setAssignedToDepartment(String assignedToDepartment) {
		this.assignedToDepartment = assignedToDepartment;
	}

	public String getPresentStatus() {
		return presentStatus;
	}

	public void setPresentStatus(String presentStatus) {
		this.presentStatus = presentStatus;
	}

	public String getTreatement() {
		return treatement;
	}

	public void setTreatement(String treatement) {
		this.treatement = treatement;
	}

	public String getPrescription() {
		return prescription;
	}

	public void setPrescription(String prescription) {
		this.prescription = prescription;
	}

	public String getExtraNote() {
		return extraNote;
	}

	public void setExtraNote(String extraNote) {
		this.extraNote = extraNote;
	}

	public Integer getExaminationCount() {
		return examinationCount;
	}

	public void setExaminationCount(Integer examinationCount) {
		this.examinationCount = examinationCount;
	}
	
	
}
