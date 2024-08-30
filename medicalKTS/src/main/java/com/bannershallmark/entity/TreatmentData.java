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
@Table(name = "treatmentData")
public class TreatmentData {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@OneToOne
	@JoinColumn(name = "patientMedicalHistoryId")
	private PatientMedicalHistory patientMedicalHistory;
	@OneToOne
	@JoinColumn(name = "medicItemId")
	private MedicItem medicItem;
	private Date eventDate;
	private Integer quantity;
	

	
	public TreatmentData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TreatmentData(PatientMedicalHistory patientMedicalHistory, MedicItem medicItem, Date eventDate, Integer quantity) {
		super();
		this.patientMedicalHistory = patientMedicalHistory;
		this.medicItem = medicItem;
		this.eventDate = eventDate;
		this.quantity = quantity;
		
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

	public MedicItem getMedicItem() {
		return medicItem;
	}

	public void setMedicItem(MedicItem medicItem) {
		this.medicItem = medicItem;
	}

	public Date getEventDate() {
		return eventDate;
	}

	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	

	
}
