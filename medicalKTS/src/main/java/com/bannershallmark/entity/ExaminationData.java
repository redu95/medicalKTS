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
@Table(name = "examinationData")
public class ExaminationData {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@OneToOne
	@JoinColumn(name = "patientMedicalHistoryId")
	private PatientMedicalHistory patientMedicalHistory;
	@OneToOne
	@JoinColumn(name = "medicServiceId")
	private MedicService medicService;
	private Date eventDate;
	private String examination;
	private String result;
	private String extraNote;
	private Integer patientId;
	private Integer paymentStatus;
	
	public ExaminationData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ExaminationData(PatientMedicalHistory patientMedicalHistory, MedicService medicService, Date eventDate, String examination,
			String result, String extraNote, Integer patientId, Integer paymentStatus) {
		super();
		this.patientMedicalHistory = patientMedicalHistory;
		this.medicService = medicService;
		this.eventDate = eventDate;
		this.examination = examination;
		this.result = result;
		this.extraNote = extraNote;
		this.patientId = patientId;
		this.paymentStatus = paymentStatus;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public PatientMedicalHistory getPatientMedicalHistory() {
		return patientMedicalHistory;
	}

	public void setPatientMedicalHistory(PatientMedicalHistory patientMedicalHistory) {
		this.patientMedicalHistory = patientMedicalHistory;
	}

	public MedicService getMedicService() {
		return medicService;
	}

	public void setMedicService(MedicService medicService) {
		this.medicService = medicService;
	}

	public Date getEventDate() {
		return eventDate;
	}

	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}

	public String getExamination() {
		return examination;
	}

	public void setExamination(String examination) {
		this.examination = examination;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getExtraNote() {
		return extraNote;
	}

	public void setExtraNote(String extraNote) {
		this.extraNote = extraNote;
	}

	public Integer getPatientId() {
		return patientId;
	}

	public void setPatientId(Integer patientId) {
		this.patientId = patientId;
	}

	public Integer getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(Integer paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	
	
	
}
