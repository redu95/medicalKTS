package com.bannershallmark.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "stores", uniqueConstraints = { @UniqueConstraint(columnNames = { "storeName" }) })
public class Store implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "store_id")
	private Integer id;
	private Integer userId;
	private String managerFirstName;
	private String managerLastName;
	private String storeEmail;
	private String role;
	@Column(unique = true)
	private Integer store;
	private String hmkAcct;
	private String dm;
	private String mgr_id;
	private String state;
	private Integer site;
	@Column(unique = true)
	private String storeName;
	private String shortName;
	private Integer size;
	private String dmEmail;
	private Boolean isActive;
	private String description;
	private Date createdDateTime;
	private Date updatedDateTime;
	private String parentDepartmentId;
	private String mergedIntoId;
	@Column(name = "store_unq_id")
	private String storeUnqId;
	private boolean isSynchronized;
	private java.util.Date lastSynchronizTime;
	@Column(name = "account_class_unq_id")
	private String accountClassUnqId;
	@Column(name = "rm")
	private String rm;
	@Column(name = "rmEmail")
	private String rmEmail;
	@Column(name = "oldStore")
	private int oldStore;
	@Column(name = "centerName")
	private String centerName;
	@Column(name = "address")
	private String address;
	@Column(name = "phoneNumber")
	private String phoneNumber;
	@Column(name = "assistantManager1")
	private String assistantManagerOne;
	@Column(name = "assistantManager2")
	private String assistantManagerTwo;

	public Integer getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Store [id=" + id + ", store=" + store + ", storeName=" + storeName + "]";
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getManagerFirstName() {
		return managerFirstName;
	}

	public void setManagerFirstName(String managerFirstName) {
		this.managerFirstName = managerFirstName;
	}

	public String getManagerLastName() {
		return managerLastName;
	}

	public void setManagerLastName(String managerLastName) {
		this.managerLastName = managerLastName;
	}

	public String getStoreEmail() {
		return storeEmail;
	}

	public void setStoreEmail(String storeEmail) {
		this.storeEmail = storeEmail;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Integer getStore() {
		return store;
	}

	public String getStoreStr() {
		if (store == null) {
			return null;
		}
		return String.valueOf(store);
	}

	public void setStore(Integer store) {
		this.store = store;
	}

	public String getHmkAcct() {
		return hmkAcct;
	}

	public void setHmkAcct(String hmkAcct) {
		this.hmkAcct = hmkAcct;
	}

	public String getDm() {
		return dm;
	}

	public void setDm(String dm) {
		this.dm = dm;
	}

	public String getMgr_id() {
		return mgr_id;
	}

	public void setMgr_id(String mgr_id) {
		this.mgr_id = mgr_id;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Integer getSite() {
		return site;
	}

	public void setSite(Integer site) {
		this.site = site;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public String getDmEmail() {
		return dmEmail;
	}

	public void setDmEmail(String dmEmail) {
		this.dmEmail = dmEmail;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStoreUnqId() {
		return storeUnqId;
	}

	public void setStoreUnqId(String storeUnqId) {
		this.storeUnqId = storeUnqId;
	}

	public Date getCreatedDateTime() {
		return createdDateTime;
	}

	public void setCreatedDateTime(Date createdDateTime) {
		this.createdDateTime = createdDateTime;
	}

	public Date getUpdatedDateTime() {
		return updatedDateTime;
	}

	public void setUpdatedDateTime(Date updatedDateTime) {
		this.updatedDateTime = updatedDateTime;
	}

	public boolean isSynchronized() {
		return isSynchronized;
	}

	public void setSynchronized(boolean isSynchronized) {
		this.isSynchronized = isSynchronized;
	}

	public java.util.Date getLastSynchronizTime() {
		return lastSynchronizTime;
	}

	public void setLastSynchronizTime(java.util.Date lastSynchronizTime) {
		this.lastSynchronizTime = lastSynchronizTime;
	}

	public String getAccountClassUnqId() {
		return accountClassUnqId;
	}

	public void setAccountClassUnqId(String accountClassUnqId) {
		this.accountClassUnqId = accountClassUnqId;
	}

	public String getRm() {
		return rm;
	}

	public void setRm(String rm) {
		this.rm = rm;
	}

	public String getRmEmail() {
		return rmEmail;
	}

	public void setRmEmail(String rmEmail) {
		this.rmEmail = rmEmail;
	}

	public int getOldStore() {
		return oldStore;
	}

	public void setOldStore(int oldStore) {
		this.oldStore = oldStore;
	}

	public String getParentDepartmentId() {
		return parentDepartmentId;
	}

	public void setParentDepartmentId(String parentDepartmentId) {
		this.parentDepartmentId = parentDepartmentId;
	}

	public String getMergedIntoId() {
		return mergedIntoId;
	}

	public void setMergedIntoId(String mergedIntoId) {
		this.mergedIntoId = mergedIntoId;
	}

	public String getCenterName() {
		return centerName;
	}

	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAssistantManagerOne() {
		return assistantManagerOne;
	}

	public void setAssistantManagerOne(String assistantManagerOne) {
		this.assistantManagerOne = assistantManagerOne;
	}

	public String getAssistantManagerTwo() {
		return assistantManagerTwo;
	}

	public void setAssistantManagerTwo(String assistantManagerTwo) {
		this.assistantManagerTwo = assistantManagerTwo;
	}

}
