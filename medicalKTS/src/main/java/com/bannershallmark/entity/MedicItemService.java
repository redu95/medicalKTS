package com.bannershallmark.entity;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "medicItemService")
public class MedicItemService {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private Integer serviceId;
	private Integer itemId;
	private Integer itemUsageInt;
	
	public MedicItemService() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MedicItemService(Integer serviceId, Integer itemId, Integer itemUsageInt) {
		super();
		this.serviceId = serviceId;
		this.itemId = itemId;
		this.itemUsageInt = itemUsageInt;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public Integer getItemUsageInt() {
		return itemUsageInt;
	}

	public void setItemUsageInt(Integer itemUsageInt) {
		this.itemUsageInt = itemUsageInt;
	}

	

	
	
}
