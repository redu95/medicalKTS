package com.bannershallmark.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "medicalInstitute")
public class MedicalInstitute {
	@Id
	@Column(name = "instituteId")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String instituteName;
	private String description;
	private Integer orgId;
	private Integer branchId;
	private String dm;
	private String dmPhone;
	private String dmEmail;
	private String address;
	private Integer isActive;
	private Date registryDate;
	
	public MedicalInstitute() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public MedicalInstitute(String instituteName, String description, Integer orgId, Integer branchId, String dm,
			String dmPhone, String dmEmail, String address, Integer isActive, Date registryDate) {
		super();
		this.instituteName = instituteName;
		this.description = description;
		this.orgId = orgId;
		this.branchId = branchId;
		this.dm = dm;
		this.dmPhone = dmPhone;
		this.dmEmail = dmEmail;
		this.address = address;
		this.isActive = isActive;
		this.registryDate = registryDate;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public String getInstituteName() {
		return instituteName;
	}


	public void setInstituteName(String instituteName) {
		this.instituteName = instituteName;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public Integer getOrgId() {
		return orgId;
	}


	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
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


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
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
