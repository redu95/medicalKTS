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
@Table(name = "journey")
public class Journey {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@OneToOne
	@JoinColumn(name = "id")
	private Asset truck;
	@OneToOne
	@JoinColumn(name = "id")
	private RoadData road;
	private String journeyType;
	private Integer volume;
	private String productName;
	private Date startDate;
	private Date endDate;
	private Double transportationCost;
	private Double shortageAmount;
	
	public Journey() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Journey(Asset truck, RoadData road, String journeyType, Integer volume, String productName, Date startDate,
			Date endDate,  Double transportationCost, Double shortageAmount) {
		super();
		this.truck = truck;
		this.road = road;
		this.journeyType = journeyType;
		this.volume = volume;
		this.productName = productName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.transportationCost = transportationCost;
		this.shortageAmount = shortageAmount;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Asset getTruck() {
		return truck;
	}

	public void setTruck(Asset truck) {
		this.truck = truck;
	}

	public RoadData getRoad() {
		return road;
	}

	public void setRoad(RoadData road) {
		this.road = road;
	}

	public String getJourneyType() {
		return journeyType;
	}

	public void setJourneyType(String journeyType) {
		this.journeyType = journeyType;
	}

	public Integer getVolume() {
		return volume;
	}

	public void setVolume(Integer volume) {
		this.volume = volume;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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

	public Double getTransportationCost() {
		return transportationCost;
	}

	public void setTransportationCost(Double transportationCost) {
		this.transportationCost = transportationCost;
	}

	public Double getShortageAmount() {
		return shortageAmount;
	}

	public void setShortageAmount(Double shortageAmount) {
		this.shortageAmount = shortageAmount;
	}
	
	
}
