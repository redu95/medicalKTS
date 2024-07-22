package com.bannershallmark.model;

import java.util.Date;

import javax.persistence.Transient;

public class ChartOfAccountModel {
	
	private Integer id;
	private String  name; 
	private String  isActive ;
	private String  accountNumber ;
	private String  type ;
	private String  description ;
	private String  parentName ;
	private String  parentAccountNumber ;
	private String  category1099 ;
	private Date    created ;
	private boolean isSynchronized;
	
	@Transient
	private String  createdConvert ;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIsActive() {
		return isActive;
	}
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public String getParentAccountNumber() {
		return parentAccountNumber;
	}
	public void setParentAccountNumber(String parentAccountNumber) {
		this.parentAccountNumber = parentAccountNumber;
	}
	public String getCategory1099() {
		return category1099;
	}
	public void setCategory1099(String category1099) {
		this.category1099 = category1099;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public String getCreatedConvert() {
		return createdConvert;
	}
	public void setCreatedConvert(String createdConvert) {
		this.createdConvert = createdConvert;
	}
	public boolean isSynchronized() {
		return isSynchronized;
	}
	public void setSynchronized(boolean isSynchronized) {
		this.isSynchronized = isSynchronized;
	}
	
	
	

}
