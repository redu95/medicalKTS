package com.bannershallmark.entity;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "roadData")
public class RoadData {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String shortCode;
	private String startRoad;
	private String startRoadCode;
	private String destinationRoad;
	private String destinationRoadCode;
	private Integer distanceKM;
	private Double fuelUsage;
	private Integer pavedKm;
	private Double pavedRate;
	private Integer gradleKM;
	private Double gradleRate;
	private Double gpsPayment;
	
	
	public RoadData() {
		super();
		// TODO Auto-generated constructor stub
	}


	public RoadData(String shortCode, String startRoad, String startRoadCode, String destinationRoad, String destinationRoadCode, Integer distanceKM, Double fuelUsage, Integer pavedKm,
			Double pavedRate, Integer gradleKM, Double gradleRate, Double gpsPayment) {
		super();
		this.shortCode = shortCode;
		this.startRoad = startRoad;
		this.startRoadCode = startRoadCode;
		this.destinationRoad = destinationRoad;
		this.destinationRoadCode = destinationRoadCode;
		this.distanceKM = distanceKM;
		this.fuelUsage = fuelUsage;
		this.pavedKm = pavedKm;
		this.pavedRate = pavedRate;
		this.gradleKM = gradleKM;
		this.gradleRate = gradleRate;
		this.gpsPayment = gpsPayment;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getShortCode() {
		return shortCode;
	}

	public void setShortCode(String shortCode) {
		this.shortCode = shortCode;
	}

	public String getStartRoad() {
		return startRoad;
	}

	public void setStartRoad(String startRoad) {
		this.startRoad = startRoad;
	}

	public String getStartRoadCode() {
		return startRoadCode;
	}


	public void setStartRoadCode(String startRoadCode) {
		this.startRoadCode = startRoadCode;
	}

	public String getDestinationRoad() {
		return destinationRoad;
	}

	public void setDestinationRoad(String destinationRoad) {
		this.destinationRoad = destinationRoad;
	}

	public String getDestinationRoadCode() {
		return destinationRoadCode;
	}


	public void setDestinationRoadCode(String destinationRoadCode) {
		this.destinationRoadCode = destinationRoadCode;
	}


	public Integer getDistanceKM() {
		return distanceKM;
	}

	public void setDistanceKM(Integer distanceKM) {
		this.distanceKM = distanceKM;
	}

	public Double getFuelUsage() {
		return fuelUsage;
	}


	public void setFuelUsage(Double fuelUsage) {
		this.fuelUsage = fuelUsage;
	}

	public Integer getPavedKm() {
		return pavedKm;
	}

	public void setPavedKm(Integer pavedKm) {
		this.pavedKm = pavedKm;
	}
	
	public Double getPavedRate() {
		return pavedRate;
	}

	public void setPavedRate(Double pavedRate) {
		this.pavedRate = pavedRate;
	}
	public Integer getGradleKM() {
		return gradleKM;
	}

	public void setGradleKM(Integer gradleKM) {
		this.gradleKM = gradleKM;
	}

	public Double getGradleRate() {
		return gradleRate;
	}

	public void setGradleRate(Double gradleRate) {
		this.gradleRate = gradleRate;
	}

	public Double getGpsPayment() {
		return gpsPayment;
	}

	public void setGpsPayment(Double gpsPayment) {
		this.gpsPayment = gpsPayment;
	}
	
	
	
	
	
	
}
