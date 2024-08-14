package com.bannershallmark.entity;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "invoiceVo")
public class InvoiceVo {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String invoiceDate;
	private String service;
	private String measurmentUnit;
	private Double unitPrice;
	private Double discount;
	private Double subTotalPrice;
	private Double totalPrice;
	private String billedTo;
	private String address;
	private String issueDate;
	
	public InvoiceVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public InvoiceVo(String invoiceDate, String service, String measurmentUnit, Double unitPrice, Double discount,
			Double subTotalPrice, Double totalPrice, String billedTo, String address, String issueDate) {
		super();
		this.invoiceDate = invoiceDate;
		this.service = service;
		this.measurmentUnit = measurmentUnit;
		this.unitPrice = unitPrice;
		this.discount = discount;
		this.subTotalPrice = subTotalPrice;
		this.totalPrice = totalPrice;
		this.billedTo = billedTo;
		this.address = address;
		this.issueDate = issueDate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getInvoiceDate() {
		return invoiceDate;
	}

	public void setInvoiceDate(String invoiceDate) {
		this.invoiceDate = invoiceDate;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getMeasurmentUnit() {
		return measurmentUnit;
	}

	public void setMeasurmentUnit(String measurmentUnit) {
		this.measurmentUnit = measurmentUnit;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Double getSubTotalPrice() {
		return subTotalPrice;
	}

	public void setSubTotalPrice(Double subTotalPrice) {
		this.subTotalPrice = subTotalPrice;
	}

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getBilledTo() {
		return billedTo;
	}

	public void setBilledTo(String billedTo) {
		this.billedTo = billedTo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

	
	
}
