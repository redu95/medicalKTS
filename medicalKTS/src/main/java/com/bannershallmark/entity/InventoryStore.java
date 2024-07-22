package com.bannershallmark.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "inventoryStore")
public class InventoryStore {
	@Id
	@Column(name = "storeId")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	// `itemid`, `description`, `itemName`, `itemType`, `partNo`, `totalOrder`, `vendorName`, `onHand`
	private String storeName;
	private String description;
	private Integer storeOrgId;
	private Integer branchId;
	private String dm;
	private String dmPhone;
	private String dmEmail;
	private Integer isActive;
	private Date registryDate;
	
	public InventoryStore() {
		super();
		// TODO Auto-generated constructor stub
	}

	public InventoryStore(String storeName, String description, Integer storeOrgId, Integer branchId, String dm,
			String dmPhone, String dmEmail, Integer isActive, Date registryDate) {
		super();
		this.storeName = storeName;
		this.description = description;
		this.storeOrgId = storeOrgId;
		this.branchId = branchId;
		this.dm = dm;
		this.dmPhone = dmPhone;
		this.dmEmail = dmEmail;
		this.isActive = isActive;
		this.registryDate = registryDate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getStoreOrgId() {
		return storeOrgId;
	}

	public void setStoreOrgId(Integer storeOrgId) {
		this.storeOrgId = storeOrgId;
	}

	public Integer getBranchId() {
		return branchId;
	}

	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}

	public String getDm() {
		return dm;
	}

	public void setDm(String dm) {
		this.dm = dm;
	}

	public String getDmPhone() {
		return dmPhone;
	}

	public void setDmPhone(String dmPhone) {
		this.dmPhone = dmPhone;
	}

	public String getDmEmail() {
		return dmEmail;
	}

	public void setDmEmail(String dmEmail) {
		this.dmEmail = dmEmail;
	}

	public Integer getIsActive() {
		return isActive;
	}

	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}

	public Date getRegistryDate() {
		return registryDate;
	}

	public void setRegistryDate(Date registryDate) {
		this.registryDate = registryDate;
	}
	
	
	

}