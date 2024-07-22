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
@Table(name = "invoice")
public class Invoice {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String invoiceNumber;
	private String dispatchNumber;
	@OneToOne
	@JoinColumn(name = "id")
	private Journey journey;
	private Double netPay;
	private String invoiceStatus;
	private String invoiceGroup;
	private Date invoiceDate;
	private Integer recietId;
	
	public Invoice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Invoice(String invoiceNumber, String dispatchNumber, Journey journey, Double netPay, String invoiceStatus,
			String invoiceGroup, Date invoiceDate, Integer recietId) {
		super();
		this.invoiceNumber = invoiceNumber;
		this.dispatchNumber = dispatchNumber;
		this.journey = journey;
		this.netPay = netPay;
		this.invoiceStatus = invoiceStatus;
		this.invoiceGroup = invoiceGroup;
		this.invoiceDate = invoiceDate;
		this.recietId = recietId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	public String getDispatchNumber() {
		return dispatchNumber;
	}

	public void setDispatchNumber(String dispatchNumber) {
		this.dispatchNumber = dispatchNumber;
	}

	public Journey getJourney() {
		return journey;
	}

	public void setJourney(Journey journey) {
		this.journey = journey;
	}

	public Double getNetPay() {
		return netPay;
	}

	public void setNetPay(Double netPay) {
		this.netPay = netPay;
	}

	public String getInvoiceStatus() {
		return invoiceStatus;
	}

	public void setInvoiceStatus(String invoiceStatus) {
		this.invoiceStatus = invoiceStatus;
	}

	public String getInvoiceGroup() {
		return invoiceGroup;
	}

	public void setInvoiceGroup(String invoiceGroup) {
		this.invoiceGroup = invoiceGroup;
	}

	public Date getInvoiceDate() {
		return invoiceDate;
	}

	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}

	public Integer getRecietId() {
		return recietId;
	}

	public void setRecietId(Integer recietId) {
		this.recietId = recietId;
	}
	
	
	
}
