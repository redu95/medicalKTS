package com.bannershallmark.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "patientData")
public class PatientData {
	@Id
	@Column(name = "patientId")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String name;
	private String lastName;
	private String note;
	private Integer age;
	private String sex;
	private String phoneNumber;
	private String address;
	private Date registryDate;
	private Integer instituteId;
	private Integer isActive;
	
	public PatientData() {
		super();
		// TODO Auto-generated constructor stub
	}


	public PatientData(String name, String lastName, String note, Integer age, String sex, String phoneNumber, String address, Date registryDate, Integer instituteId, Integer isActive) {
		super();
		this.name = name;
		this.lastName = lastName;
		this.note = note;
		this.age = age;
		this.sex = sex;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.registryDate = registryDate;
		this.instituteId = instituteId;
		this.isActive = isActive;
	}


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


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}


	public Integer getAge() {
		return age;
	}


	public void setAge(Integer age) {
		this.age = age;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getPhoneNumber() {
		return phoneNumber;
	}


	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public Date getRegistryDate() {
		return registryDate;
	}


	public void setRegistryDate(Date registryDate) {
		this.registryDate = registryDate;
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
