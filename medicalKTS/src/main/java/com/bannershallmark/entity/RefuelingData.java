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
@Table(name = "refuelingData")
public class RefuelingData {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@OneToOne
	@JoinColumn(name = "id")
	private Journey journey;
	@OneToOne
	@JoinColumn(name = "id")
	private Invoice invoice;
	private Date eventDate;
	private Double volume;
	private Double unitPrice;
	private Double totalValue;
	private String stationName;
	private Integer recietId;
	
	public RefuelingData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RefuelingData(Journey journey, Invoice invoice, Date eventDate, Double volume, Double unitPrice, Double totalValue,
			String stationName, Integer recietId) {
		super();
		this.journey = journey;
		this.invoice = invoice;
		this.eventDate = eventDate;
		this.volume = volume;
		this.unitPrice = unitPrice;
		this.totalValue = totalValue;
		this.stationName = stationName;
		this.recietId = recietId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Journey getJourney() {
		return journey;
	}

	public void setJourney(Journey journey) {
		this.journey = journey;
	}

	public Invoice getInvoice() {
		return invoice;
	}

	public void setInvoice(Invoice invoice) {
		this.invoice = invoice;
	}

	public Date getEventDate() {
		return eventDate;
	}

	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}

	public Double getVolume() {
		return volume;
	}

	public void setVolume(Double volume) {
		this.volume = volume;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Double getTotalValue() {
		return totalValue;
	}

	public void setTotalValue(Double totalValue) {
		this.totalValue = totalValue;
	}

	public String getStationName() {
		return stationName;
	}

	public void setStationName(String stationName) {
		this.stationName = stationName;
	}

	public Integer getRecietId() {
		return recietId;
	}

	public void setRecietId(Integer recietId) {
		this.recietId = recietId;
	}
	
	
}
