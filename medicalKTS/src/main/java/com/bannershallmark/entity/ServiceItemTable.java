package com.bannershallmark.entity;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "serviceItemTable")
public class ServiceItemTable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Integer itemId;
	private Integer seviceId;
	private Integer usageQuantity;
	private String serviceName;
	private String itemName;
	

	public ServiceItemTable() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public ServiceItemTable(Integer itemId, Integer seviceId, Integer usageQuantity, String serviceName,
			String itemName) {
		super();
		this.itemId = itemId;
		this.seviceId = seviceId;
		this.usageQuantity = usageQuantity;
		this.serviceName = serviceName;
		this.itemName = itemName;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getItemId() {
		return itemId;
	}


	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}


	public Integer getSeviceId() {
		return seviceId;
	}


	public void setSeviceId(Integer seviceId) {
		this.seviceId = seviceId;
	}


	public Integer getUsageQuantity() {
		return usageQuantity;
	}


	public void setUsageQuantity(Integer usageQuantity) {
		this.usageQuantity = usageQuantity;
	}


	public String getServiceName() {
		return serviceName;
	}


	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}


	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	
	
	

	
}
