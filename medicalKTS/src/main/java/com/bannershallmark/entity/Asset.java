package com.bannershallmark.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "asset")
public class Asset {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String plateNumber;
	private Integer volume;
	private Date registryDate;
	private String assetType;
	
	
	public Asset() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Asset(String plateNumber, Integer volume, Date registryDate, String assetType) {
		super();
		this.plateNumber = plateNumber;
		this.volume = volume;
		this.registryDate = registryDate;
		this.assetType = assetType;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getPlateNumber() {
		return plateNumber;
	}


	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}


	public Integer getVolume() {
		return volume;
	}


	public void setVolume(Integer volume) {
		this.volume = volume;
	}


	public Date getRegistryDate() {
		return registryDate;
	}


	public void setRegistryDate(Date registryDate) {
		this.registryDate = registryDate;
	}


	public String getAssetType() {
		return assetType;
	}


	public void setAssetType(String assetType) {
		this.assetType = assetType;
	}

	
	
}
