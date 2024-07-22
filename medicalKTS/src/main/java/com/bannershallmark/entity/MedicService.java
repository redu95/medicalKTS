package com.bannershallmark.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "medicService")
public class MedicService {
	@Id
	@Column(name = "medicServiceId")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String serviceName;
	private String serviceDescription;
	private Double price;
	private String servictType;
	private String departmentName;
	private String measurmentUnit;
	private Integer instituteId;
	private Integer isActive;
	
	public MedicService() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public MedicService(String serviceName, String serviceDescription, Double price, String servictType,
			String departmentName, String measurmentUnit, Integer instituteId, Integer isActive) {
		super();
		this.serviceName = serviceName;
		this.serviceDescription = serviceDescription;
		this.price = price;
		this.servictType = servictType;
		this.departmentName = departmentName;
		this.measurmentUnit = measurmentUnit;
		this.instituteId = instituteId;
		this.isActive = isActive;
	}



	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public String getServiceName() {
		return serviceName;
	}



	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}



	public String getServiceDescription() {
		return serviceDescription;
	}



	public void setServiceDescription(String serviceDescription) {
		this.serviceDescription = serviceDescription;
	}



	public Double getPrice() {
		return price;
	}



	public void setPrice(Double price) {
		this.price = price;
	}



	public String getServictType() {
		return servictType;
	}



	public void setServictType(String servictType) {
		this.servictType = servictType;
	}



	public String getDepartmentName() {
		return departmentName;
	}



	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}



	public String getMeasurmentUnit() {
		return measurmentUnit;
	}



	public void setMeasurmentUnit(String measurmentUnit) {
		this.measurmentUnit = measurmentUnit;
	}



	public Integer getInstituteId() {
		return instituteId;
	}



	public void setInstituteId(Integer instituteId) {
		this.instituteId = instituteId;
	}



	public Integer getIsActive() {
		return isActive;
	}



	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}

	

}
